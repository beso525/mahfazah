INSERT INTO transactions (
    id,
    description,
    status,
    reference_id,
    created_at,
    completed_at
  )
VALUES (
    'bbbbbbbb-0000-0000-0000-000000000006',
    'BROKEN transfer',
    'SUCCESS',
    'key-006',
    '2026-11-02 10:00',
    '2026-11-02 10:00'
  );
INSERT INTO ledger_entries (
    transaction_id,
    account_id,
    type,
    amount_minor,
    currency
  )
VALUES (
    'bbbbbbbb-0000-0000-0000-000000000006',
    'aaaaaaaa-0000-0000-0000-000000000002',
    'DEBIT',
    1000,
    'EGP'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000006',
    'aaaaaaaa-0000-0000-0000-000000000003',
    'CREDIT',
    900,
    'EGP'
  );