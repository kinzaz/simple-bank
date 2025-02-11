package main

import (
	"database/sql"
	"log"

	"github.com/kinzaz/simple-bank/api"
	db "github.com/kinzaz/simple-bank/db/sqlc"
	_ "github.com/lib/pq"
)

const (
	dbDriver      = "postgres"
	dsn           = "postgresql://postgres:password@localhost:5432/simple_bank?sslmode=disable"
	serverAddress = "localhost:8080"
)

func main() {

	conn, err := sql.Open(dbDriver, dsn)
	if err != nil {
		log.Fatal("cannot connect to db", err)
	}

	store := db.NewStore(conn)
	server := api.NewServer(store)

	err = server.Start(serverAddress)
	if err != nil {
		log.Fatal("cannot start server", err)
	}

}
