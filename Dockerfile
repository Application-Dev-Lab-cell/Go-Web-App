# Step 1: Use official Golang image as builder
FROM golang:1.26 AS base

# Step 2: Set working directory inside container
WORKDIR /app

# Step 3: Copy go.mod and go.sum first (better caching)
COPY go.mod .
RUN go mod download

# Step 4: Copy the rest of the source code
COPY . .

# Step 5: Build the Go binary
RUN go build -o main .

# Step 6: Use a distroless image for the final stage

FROM gcr.io/distroless/base

# Step 7: Set working directory
WORKDIR /app

# Step 8: Copy binary from builder stage
COPY --from=base /app/main .
COPY --from=base /app/static/ ./static/

# Step 9: Expose port (adjust if your app uses another)
EXPOSE 8080

# Step 10: Command to run the app
CMD ["./main"]
