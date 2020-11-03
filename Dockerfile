FROM golang:1.15.3-alpine3.12 AS builder

RUN apk --no-cache add git
RUN go get github.com/ffuf/ffuf; exit 0
WORKDIR /go/src/github.com/ffuf/ffuf
RUN go install ./...

FROM alpine:latest
RUN apk --no-cache add ca-certificates
COPY --from=builder /go/bin/ffuf /bin/ffuf

CMD ["ffuf"]