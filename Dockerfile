FROM alpine:latest

ENV VERSION 0.7.1
ENV HTTP_PORT 1080
ENV SMTP_PORT 1025

RUN apk add --update ruby ruby-dev ruby-etc ruby-bigdecimal sqlite sqlite-dev build-base libstdc++ ca-certificates && \
    gem install json --no-ri --no-rdoc && \
    gem install mailcatcher -v $VERSION --no-ri --no-rdoc && \
    apk del --purge ruby-dev build-base && \
    rm -rf /var/cache/apk/*

EXPOSE $SMTP_PORT $HTTP_PORT

CMD mailcatcher -f --ip=0.0.0.0 --smtp-port=$SMTP_PORT --http-port=$HTTP_PORT
