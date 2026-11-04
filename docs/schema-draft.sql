DROP TABLE IF EXISTS ledger_entries;
DROP TABLE IF EXISTS transactions;
DROP TABLE IF EXISTS accounts;
DROP TYPE IF EXISTS transaction_status;
DROP TYPE IF EXISTS entry_type;
CREATE TYPE entry_type AS ENUM ('DEBIT', 'CREDIT');
CREATE TYPE transaction_status AS ENUM ('PENDING', 'SUCCESS', 'FAILED');
CREATE TABLE accounts (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  name VARCHAR(100) NOT NULL,
  currency VARCHAR(3) NOT NULL DEFAULT 'EGP',
  min_balance BIGINT NOT NULL DEFAULT 0,
  is_active BOOLEAN NOT NULL DEFAULT TRUE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  UNIQUE (id, currency)
);
CREATE TABLE transactions (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  description TEXT NULL,
  status transaction_status NOT NULL DEFAULT 'PENDING',
  reference_id VARCHAR(100) UNIQUE NOT NULL,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  completed_at TIMESTAMPTZ NULL
);
CREATE TABLE ledger_entries (
  id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
  account_id UUID NOT NULL,
  type entry_type NOT NULL,
  currency VARCHAR(3) NOT NULL,
  transaction_id UUID NOT NULL REFERENCES transactions(id),
  amount_minor BIGINT NOT NULL CHECK (amount_minor > 0),
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  FOREIGN KEY (account_id, currency) REFERENCES accounts(id, currency)
);
CREATE INDEX idx_ledger_entries_account_id ON ledger_entries(account_id);
CREATE INDEX idx_ledger_entries_transaction_id ON ledger_entries(transaction_id);