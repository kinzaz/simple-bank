# Build stage
FROM golang:1.23.6-alpine3.20 AS builder

WORKDIR /app

COPY . .

RUN go build -o main 

# Run stage
FROM alpine:3.20

WORKDIR /app

COPY --from=builder /app/main .
COPY app.env .
COPY start.sh .
COPY wait-for.sh .
COPY db/migration ./db/migration

EXPOSE 8080

# cmd and entrypoint in docker-compose
# CMD [ "/app/main" ]
# ENTRYPOINT [ "/app/start.sh" ]
