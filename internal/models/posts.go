package models

import "time"

type CreatePostRequest struct {
  Title string
  Content string
}

type Post struct {
  Id int
  Title string
  Content string
  CreatedAt time.Time
}
