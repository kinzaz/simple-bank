package gapi

import (
	db "github.com/kinzaz/simple-bank/db/sqlc"
	"github.com/kinzaz/simple-bank/pb"
)

func convertUser(user db.User) *pb.User {
	return &pb.User{
		Username:          user.Username,
		FullName:          user.FullName,
		Email:             user.Email,
		PasswordChangedAt: user.PasswordChangedAt.String(),
		CreatedAt:         user.CreatedAt.String(),
	}
}
