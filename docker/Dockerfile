FROM node:18.20

COPY ./scripts/* /scripts/
RUN chmod +x /scripts/*

WORKDIR /code
ENTRYPOINT /scripts/pihole.entrypoint.sh