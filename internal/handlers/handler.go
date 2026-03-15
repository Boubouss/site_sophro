package handlers

import (
	repo "sophro/internal/repositories"
	"sophro/internal/views/pages"

	"github.com/jackc/pgx/v5"
	"github.com/labstack/echo/v5"
)

type AppHandler interface {
  HandleLandingPage() error
  HandleAdminPage() error
}

type appHandler struct {
  adminRepo repo.AdminRepository
  postRepo repo.PostRepository
}

func NewAppHandler(db *pgx.Conn) *appHandler {
  return &appHandler{
    adminRepo: repo.NewAdminRepository(db),
    postRepo: repo.NewPostRepository(db),
  }
}

func (h appHandler) HandleLandingPage(c *echo.Context) error {
  return render(c, pages.Landing())
}

func (h appHandler) HandleAdminPage(c *echo.Context) error {
  return render(c, pages.Admin())
}
