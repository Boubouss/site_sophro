FROM golang:1.25-alpine AS builder

RUN go install github.com/a-h/templ/cmd/templ@latest

ENV PATH=$PATH:/go/bin

WORKDIR /app/src

COPY . . 

RUN go mod download

RUN templ generate

RUN go build -o /sophro /app/src/cmd/main.go

FROM alpine:latest 

COPY --from=builder /sophro .
COPY --from=builder app/src/public ./public

ENTRYPOINT ["/sophro"]
