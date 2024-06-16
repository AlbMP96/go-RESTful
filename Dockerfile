FROM golang:1.22

WORKDIR /app

COPY ./app/go.mod ./app/go.sum ./
RUN go install github.com/air-verse/air@latest
RUN go mod download && go mod verify

COPY ./app .
RUN go mod tidy

EXPOSE 8080

ENTRYPOINT ["air", "-c", ".air.toml"]
