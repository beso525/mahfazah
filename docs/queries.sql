INSERT INTO accounts (id, name, min_balance)
VALUES (
    'aaaaaaaa-0000-0000-0000-000000000001',
    'SYSTEM',
    -100000000000
  ),
  (
    'aaaaaaaa-0000-0000-0000-000000000002',
    'Ahmed',
    0
  ),
  (
    'aaaaaaaa-0000-0000-0000-000000000003',
    'Sara',
    0
  ),
  (
    'aaaaaaaa-0000-0000-0000-000000000004',
    'Merchant',
    0
  ),
  (
    'aaaaaaaa-0000-0000-0000-000000000005',
    'Mona',
    0
  );
INSERT INTO transactions (
    id,
    description,
    status,
    reference_id,
    created_at,
    completed_at
  )
VALUES (
    'bbbbbbbb-0000-0000-0000-000000000001',
    'Ahmed top-up',
    'SUCCESS',
    'key-001',
    '2026-11-01 10:00',
    '2026-11-01 10:00'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000002',
    'Sara top-up',
    'SUCCESS',
    'key-002',
    '2026-11-01 10:05',
    '2026-11-01 10:05'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000003',
    'Ahmed to Sara',
    'SUCCESS',
    'key-003',
    '2026-11-01 11:00',
    '2026-11-01 11:00'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000004',
    'Sara pays shop',
    'SUCCESS',
    'key-004',
    '2026-11-01 12:00',
    '2026-11-01 12:00'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000005',
    'Partial refund',
    'SUCCESS',
    'key-005',
    '2026-11-02 09:00',
    '2026-11-02 09:00'
  );
INSERT INTO ledger_entries (
    transaction_id,
    account_id,
    type,
    amount_minor,
    currency
  )
VALUES (
    'bbbbbbbb-0000-0000-0000-000000000001',
    'aaaaaaaa-0000-0000-0000-000000000001',
    'DEBIT',
    50000,
    'EGP'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000001',
    'aaaaaaaa-0000-0000-0000-000000000002',
    'CREDIT',
    50000,
    'EGP'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000002',
    'aaaaaaaa-0000-0000-0000-000000000001',
    'DEBIT',
    30000,
    'EGP'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000002',
    'aaaaaaaa-0000-0000-0000-000000000003',
    'CREDIT',
    30000,
    'EGP'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000003',
    'aaaaaaaa-0000-0000-0000-000000000002',
    'DEBIT',
    12000,
    'EGP'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000003',
    'aaaaaaaa-0000-0000-0000-000000000003',
    'CREDIT',
    12000,
    'EGP'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000004',
    'aaaaaaaa-0000-0000-0000-000000000003',
    'DEBIT',
    8550,
    'EGP'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000004',
    'aaaaaaaa-0000-0000-0000-000000000004',
    'CREDIT',
    8550,
    'EGP'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000005',
    'aaaaaaaa-0000-0000-0000-000000000004',
    'DEBIT',
    2000,
    'EGP'
  ),
  (
    'bbbbbbbb-0000-0000-0000-000000000005',
    'aaaaaaaa-0000-0000-0000-000000000003',
    'CREDIT',
    2000,
    'EGP'
  );