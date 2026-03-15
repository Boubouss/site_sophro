package repositories

import "github.com/jackc/pgx/v5"

type AdminRepository interface {
  CreateAdmin() error
}

type adminRepository struct {
  db *pgx.Conn
}

func NewAdminRepository(db *pgx.Conn) *adminRepository {
  return &adminRepository{
    db: db,
  }
}

func (r adminRepository) CreateAdmin() error {
  return nil
}
