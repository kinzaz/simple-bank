-- Сначала удаляем уникальный индекс и внешний ключ
ALTER TABLE "account" DROP CONSTRAINT IF EXISTS "owner_currency_key";
ALTER TABLE "account" DROP CONSTRAINT IF EXISTS "account_owner_fkey";

-- Затем удаляем таблицу users
DROP TABLE IF EXISTS "users";