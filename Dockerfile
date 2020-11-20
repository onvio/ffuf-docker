FROM golang:1.15.3-alpine3.12

COPY start.sh ffuf_qt.py /opt/ffuf/

RUN apk --no-cache add git \
    && go get github.com/ffuf/ffuf \
    && cd /go/src/github.com/ffuf/ffuf \
    && go install ./... \
    && ln -s /go/bin/ffuf /usr/bin/ffuf \
    && cd /opt/ffuf \
    && wget https://raw.githubusercontent.com/onvio/onvio_wordlists/master/words_and_files_small.txt \
    && apk update \
    && apk --no-cache add bash python3 ca-certificates \
    && chmod +x /opt/ffuf/start.sh

VOLUME /var/reports/

ENTRYPOINT ["/opt/ffuf/start.sh"]