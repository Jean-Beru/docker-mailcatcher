FROM alpine:3.18

ARG VERSION=0.10.0

RUN apk add --update ruby ruby-dev ruby-etc ruby-bigdecimal sqlite sqlite-dev build-base libstdc++ ca-certificates && \
    gem install json --no-document && \
    gem install mailcatcher -v $VERSION --no-document && \
    apk del --purge ruby-dev build-base && \
    rm -rf /var/cache/apk/*

EXPOSE 1025 1080

ENTRYPOINT ["mailcatcher", "--foreground"]
CMD ["--ip", "0.0.0.0", "--no-quit"]
