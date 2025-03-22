FROM alpine:3.19

RUN apk add --no-cache \
    bash \
    curl \
    tzdata

WORKDIR /app

COPY runcurl.sh entrypoint.sh ./
RUN chmod +x runcurl.sh entrypoint.sh

RUN mkdir -p /var/log

STOPSIGNAL SIGINT

CMD ["/app/entrypoint.sh"]
