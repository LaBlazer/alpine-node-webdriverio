FROM node:10-alpine

RUN apk add --update \
    openjdk8-jre \
    chromium

COPY . .
COPY tests.sh /usr/local/bin
