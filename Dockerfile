FROM golang:1.7.3 as builder
WORKDIR /go/src/github.com/greendavegreen/hwfunc/
RUN go get -d -v golang.org/x/net/html
RUN go get -d -v github.com/gorilla/handlers
RUN go get -d -v github.com/gorilla/mux
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hwfunc .

FROM alpine:latest
WORKDIR /root/
COPY static static
COPY --from=builder /go/src/github.com/greendavegreen/hwfunc/hwfunc .

EXPOSE 8080
CMD ["./hwfunc"]