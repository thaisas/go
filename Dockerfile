FROM golang:1.17-alpine as builder

ENV APP_NAME hello-world
ENV CMD_PATH main.go

COPY . $GOPATH/src/$APP_NAME
WORKDIR $GOPATH/src/$APP_NAME

RUN CGO_ENABLED=0 go build -v -o /$APP_NAME $GOPATH/src/$APP_NAME/$CMD_PATH

FROM scratch

COPY --from=builder /hello-world .

EXPOSE 8081

ENTRYPOINT ["/hello-world"]
