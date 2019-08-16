FROM node:10-alpine

RUN apk add --update \
    openjdk8-jre \
    chromium
CMD ["/usr/bin/java", "-version"]
CMD ["/usr/bin/chromium", "--version"]


COPY . .

