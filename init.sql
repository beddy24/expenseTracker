-- Schéma de la base "expense" (reconstruit depuis les controllers)

CREATE TABLE IF NOT EXISTS tbluser (
  id          SERIAL PRIMARY KEY,
  firstname   VARCHAR(100) NOT NULL,
  lastname    VARCHAR(100),
  email       VARCHAR(150) NOT NULL UNIQUE,
  password    TEXT NOT NULL,
  contact     VARCHAR(50),
  country     VARCHAR(100),
  currency    VARCHAR(10),
  accounts    TEXT[] DEFAULT '{}',
  createdat   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedat   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tblaccount (
  id              SERIAL PRIMARY KEY,
  user_id         INTEGER NOT NULL REFERENCES tbluser(id),
  account_name    VARCHAR(100) NOT NULL,
  account_number  VARCHAR(100) NOT NULL,
  account_balance NUMERIC(12,2) DEFAULT 0,
  createdat       TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedat       TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE IF NOT EXISTS tbltransaction (
  id          SERIAL PRIMARY KEY,
  user_id     INTEGER NOT NULL REFERENCES tbluser(id),
  description TEXT,
  type        VARCHAR(20),
  status      VARCHAR(20),
  amount      NUMERIC(12,2) NOT NULL,
  source      VARCHAR(100),
  createdat   TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  updatedat   TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);