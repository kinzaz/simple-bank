package gapi

import (
	"fmt"

	db "github.com/kinzaz/simple-bank/db/sqlc"
	"github.com/kinzaz/simple-bank/pb"
	"github.com/kinzaz/simple-bank/token"
	"github.com/kinzaz/simple-bank/util"
	"github.com/kinzaz/simple-bank/worker"
)

type Server struct {
	pb.UnimplementedSimpleBankServer
	config          util.Config
	store           db.Store
	tokenMaker      token.Maker
	taskDistributor worker.TaskDistributor
}

func NewServer(config util.Config, store db.Store, taskDistributor worker.TaskDistributor) (*Server, error) {
	tokenMaker, err := token.NewPasetoMaker(config.TokenSymmetricKey)
	if err != nil {
		return nil, fmt.Errorf("cannot create token maker: %w", err)
	}
	server := &Server{
		config:          config,
		store:           store,
		tokenMaker:      tokenMaker,
		taskDistributor: taskDistributor,
	}

	return server, nil
}
