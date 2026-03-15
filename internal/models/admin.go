package models

type CreateAdminRequest struct {
  Username string
  Email string
  Password string
}

type Admin struct {
  Id int
  Username string
  Email string
}
