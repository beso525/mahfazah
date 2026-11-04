CREATE OR REPLACE FUNCTION forbid_ledger_changes() RETURNS trigger AS $$ BEGIN RAISE EXCEPTION 'ledger_entries is append-only: % is not allowed',
  TG_OP;
END;
$$ LANGUAGE plpgsql;
CREATE TRIGGER trg_ledger_append_only BEFORE
UPDATE
  OR DELETE ON ledger_entries FOR EACH ROW EXECUTE FUNCTION forbid_ledger_changes();
CREATE TRIGGER trg_ledger_no_truncate BEFORE TRUNCATE ON ledger_entries FOR EACH STATEMENT EXECUTE FUNCTION forbid_ledger_changes();
CREATE OR REPLACE FUNCTION check_transaction_balanced() RETURNS trigger AS $$
DECLARE net BIGINT;
BEGIN
SELECT COALESCE(
    SUM(
      CASE
        WHEN type = 'CREDIT' THEN amount_minor
        ELSE - amount_minor
      END
    ),
    0
  ) INTO net
FROM ledger_entries
WHERE transaction_id = NEW.transaction_id;
IF net <> 0 THEN RAISE EXCEPTION 'Transaction % is not balanced (net %)',
NEW.transaction_id,
net;
END IF;
RETURN NULL;
END;
$$ LANGUAGE plpgsql;
CREATE CONSTRAINT TRIGGER trg_entries_balanced
AFTER
INSERT ON ledger_entries DEFERRABLE INITIALLY DEFERRED FOR EACH ROW EXECUTE FUNCTION check_transaction_balanced();