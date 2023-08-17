FROM golang:1.18-alpine as builder

WORKDIR /app
COPY . /app
RUN CGO_ENABLED=0 GOOS=linux go build -o go-multistage-building -a -installsuffix cgo

FROM scratch
COPY --from=builder /app/go-multistage-building /app

ENTRYPOINT ["/app"]