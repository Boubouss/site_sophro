package repositories

import "github.com/jackc/pgx/v5"

type PostRepository interface {
  CreatePost() error 
}

type postRepository struct {
  db *pgx.Conn
}

func NewPostRepository(db *pgx.Conn) *postRepository {
  return &postRepository{
    db: db,
  }
}

func (r postRepository) CreatePost() error {
  return nil
}
