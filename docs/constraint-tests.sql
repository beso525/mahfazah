-- Expect an update error
UPDATE ledger_entries
SET amount_minor = 30
WHERE transaction_id = 'bbbbbbbb-0000-0000-0000-000000000001'
  AND account_id = 'aaaaaaaa-0000-0000-0000-000000000002';
-- Expect a delete error
DELETE FROM ledger_entries
WHERE transaction_id = 'bbbbbbbb-0000-0000-0000-000000000001'
  AND account_id = 'aaaaaaaa-0000-0000-0000-000000000002';
-- Expect a truncate error
TRUNCATE TABLE ledger_entries;