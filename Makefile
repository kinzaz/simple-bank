migrate-up:
	migrate -path db/migration -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" -verbose up

migrate-down:
	migrate -path db/migration -database "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable" -verbose down

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go  github.com/kinzaz/simple-bank/db/sqlc Store

.PHONY: migrate-up migrate-down sqlc server mock

