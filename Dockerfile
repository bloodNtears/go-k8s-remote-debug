FROM golang:1.24.2-alpine3.21 AS builder

WORKDIR /app

RUN go install github.com/go-delve/delve/cmd/dlv@v1.24

COPY . .
RUN go build -o server .

FROM alpine:3.21

WORKDIR /app

COPY --from=builder /app/server .
COPY --from=builder /go/bin/dlv ./

EXPOSE 8080

# Старый запуск
# CMD ["./server"]

CMD ["./dlv", "--headless=true", "--accept-multiclient", "--continue", "--listen=0.0.0.0:40000", "--api-version=2", "exec", "./server", "--log"]