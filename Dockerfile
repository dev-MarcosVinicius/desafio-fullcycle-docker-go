FROM golang:1.16 AS builder

WORKDIR /usr/src/app

COPY main.go go.mod ./

RUN go build -o main .

FROM scratch  

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/main ./

CMD ["./main"]