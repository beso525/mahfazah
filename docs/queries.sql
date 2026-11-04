SELECT a.name,
  COALESCE(
    SUM(
      CASE
        WHEN l.type = 'CREDIT' THEN l.amount_minor
        WHEN l.type = 'DEBIT' THEN - l.amount_minor
        ELSE 0
      END
    ),
    0
  ) AS current_balance
FROM accounts a
  LEFT JOIN ledger_entries l ON account_id = a.id
GROUP BY a.name;
SELECT SUM(
    CASE
      WHEN type = 'CREDIT' then amount_minor
      WHEN type = 'DEBIT' then - amount_minor
      ELSE 0
    END
  ),
  0 AS total_entries
FROM ledger_entries;
SELECT l.transaction_id
FROM ledger_entries l
GROUP BY l.transaction_id
HAVING SUM(
    CASE
      WHEN l.type = 'CREDIT' THEN l.amount_minor
      WHEN l.type = 'DEBIT' THEN - l.amount_minor
      ELSE 0
    END
  ) != 0;
SELECT a.name,
  COUNT(l.transaction_id)
FROM accounts a
  JOIN ledger_entries l ON a.id = account_id
GROUP BY a.name,
  l.type
HAVING l.type = 'CREDIT'
  AND COUNT(l.transaction_id) > 1;
SELECT CASE
    WHEN l.type = 'CREDIT' THEN l.amount_minor
    WHEN l.type = 'DEBIT' THEN - l.amount_minor
    ELSE 0
  END
FROM ledger_entries l
  JOIN transactions t ON transaction_id = t.id
  JOIN accounts a ON account_id = a.id
WHERE a.name = 'Sara'
ORDER BY l.created_at ASC;