import pg from "pg"

const { Pool } = pg;

// Le SSL est activé UNIQUEMENT si la variable d'env DB_SSL vaut "true"
const useSSL = process.env.DB_SSL === "true";

export const pool = new Pool({
  connectionString: process.env.DATABASE_URI,
  ssl: useSSL ? { rejectUnauthorized: false } : false,
});