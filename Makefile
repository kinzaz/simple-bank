MIGRATION_PATH = ./db/migration

postgres:
	docker run --name postgres12 --network bank-network -p 5432:5432 -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=password -e POSTGRES_DB=simple_bank -d postgres:12-alpine

migrate-up:
	migrate -path db/migration -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" up 1 

migrate-down:
	migrate -path db/migration -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" down 1

migration:
	migrate create -ext sql -dir $(MIGRATION_PATH) -seq $(filter-out $@,$(MAKECMDGOALS))

migrate-version:
	migrate -path db/migration -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" version

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go  github.com/kinzaz/simple-bank/db/sqlc Store

.PHONY: migrate-up migrate-down sqlc server mock migration migrate-version postgres

