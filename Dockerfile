FROM golang:1.16.4-alpine3.13

COPY start.sh ffuf_qt.py /opt/ffuf/

RUN apk --no-cache add git \
    && export GO111MODULE=on \
    && go get -u github.com/ffuf/ffuf@v1.3.1 \
    && ln -s /go/bin/ffuf /usr/bin/ffuf \
    && cd /opt/ffuf \
    && wget https://raw.githubusercontent.com/onvio/onvio_wordlists/master/words_and_files_small.txt \
    && apk update \
    && apk --no-cache add bash python3 ca-certificates \
    && chmod +x /opt/ffuf/start.sh

WORKDIR /opt/ffuf/
VOLUME /var/reports/

ENTRYPOINT ["./start.sh"]