FROM node:lts-alpine

RUN apk add --update xvfb \
    openjdk12-jre-headless \
    python \
    gcc \
    g++ \
    musl-dev \
    make \
    findutils

RUN yarn global add selenium-standalone \
    webdriverio \
    node-gyp \
    && selenium-standalone install

COPY . .
