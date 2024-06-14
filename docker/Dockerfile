FROM node:18.20-alpine3.20

RUN apk update && apk add --no-cache bash gcc libc-dev make

COPY ./scripts/* /scripts/
RUN chmod +x /scripts/*

WORKDIR /code
ENTRYPOINT /scripts/pihole.entrypoint.sh