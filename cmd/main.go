package main

import (
	"context"
	"fmt"
	"os"
	"sophro/internal/handlers"

	"github.com/jackc/pgx/v5"
	"github.com/labstack/echo/v5"
)

func main() {

  fmt.Println("Connection to database...")
  db, err := pgx.Connect(context.Background(), os.Getenv("DB_URL"))
  if err != nil {
    fmt.Println("Connection to database failed")
    fmt.Println(os.Getenv("DB_URL"))
    return
  }
  
  app := echo.New()

  app.Static("/public", "/public")
  
  h := handlers.NewAppHandler(db)

  app.GET("/", h.HandleLandingPage)
  app.GET("/admin", h.HandleAdminPage)

  if err := app.Start(":8080"); err != nil {
    app.Logger.Error("Failed to start server", "error", err)
  }
}
