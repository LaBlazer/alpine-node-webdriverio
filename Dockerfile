FROM node:lts-alpine

RUN apk add --update xvfb \
    openjdk11-jre-headless \
    chromium \
    chromium-chromedriver \
    findutils

RUN yarn global add selenium-standalone \
    && selenium-standalone install

COPY . .
