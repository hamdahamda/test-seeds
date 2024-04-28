
FROM golang:alpine AS builder


WORKDIR /app


COPY main.go .


RUN go mod init seeds-test


RUN go build -o seeds-test .


FROM alpine


WORKDIR /app

COPY --from=builder /app/seeds-test .


CMD ["./seeds-test"]
