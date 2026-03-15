FROM golang:1.25-alpine AS builder

WORKDIR /app/src

COPY . . 

RUN go mod download

RUN go build -o /sophro /app/src/cmd/main.go

FROM alpine:latest 

COPY --from=builder /sophro .

ENTRYPOINT ["/sophro"]
