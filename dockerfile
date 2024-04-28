# Gunakan golang:alpine sebagai base image
FROM golang:alpine AS builder

# Set working directory
WORKDIR /app

# Salin file main.go ke dalam container
COPY main.go .

# Inisialisasi Go Modules (jika belum ada)
RUN go mod init seeds-test

# Build aplikasi Golang
RUN go build -o seeds-test .

# Stage kedua, hanya menggunakan binary hasil build
FROM alpine

# Set working directory
WORKDIR /app

# Salin binary dari stage pertama
COPY --from=builder /app/seeds-test .

# Eksekusi binary ketika container dimulai
CMD ["./seeds-test"]
