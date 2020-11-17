FROM golang:1.15.3-alpine3.12 AS builder

RUN apk --no-cache add git
RUN go get github.com/ffuf/ffuf; exit 0
WORKDIR /go/src/github.com/ffuf/ffuf
RUN go install ./...

FROM alpine:latest
WORKDIR /opt/ffuf
RUN wget https://raw.githubusercontent.com/onvio/onvio_wordlists/master/words_and_files_small.txt
RUN mkdir /var/reports
RUN chmod 777 /var/reports

## alpine updates
RUN apk update
RUN apk upgrade
RUN apk add bash
RUN apk add python3
RUN apk --no-cache add ca-certificates

COPY --from=builder /go/bin/ffuf /bin/ffuf

COPY ffuf.sh /opt/ffuf/ffuf.sh
COPY sort_ffuf.sh /opt/ffuf/sort_ffuf.sh
COPY ffuf_qt.py /opt/ffuf/ffuf_qt.py

RUN chmod +x /opt/ffuf/ffuf.sh
RUN chmod +x /opt/ffuf/sort_ffuf.sh
RUN chmod +x /opt/ffuf/ffuf_qt.py

#Start
COPY start.sh /opt/ffuf/start.sh
RUN chmod +x /opt/ffuf/start.sh
ENTRYPOINT ["/opt/ffuf/start.sh"]