-- Сначала удаляются внешние ключи
ALTER TABLE "entries" DROP CONSTRAINT IF EXISTS entries_account_id_fkey;
ALTER TABLE "transfers" DROP CONSTRAINT IF EXISTS transfers_from_account_id_fkey;
ALTER TABLE "transfers" DROP CONSTRAINT IF EXISTS transfers_to_account_id_fkey;

-- Затем удаляются индексы
DROP INDEX IF EXISTS account_owner_idx;
DROP INDEX IF EXISTS entries_account_id_idx;
DROP INDEX IF EXISTS transfers_from_account_id_idx;
DROP INDEX IF EXISTS transfers_to_account_id_idx;
DROP INDEX IF EXISTS transfers_from_and_to_account_ids_idx;

-- И наконец, удаляются сами таблицы
DROP TABLE IF EXISTS "account";
DROP TABLE IF EXISTS "entries";
DROP TABLE IF EXISTS "transfers";