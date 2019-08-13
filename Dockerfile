FROM node:10-stretch-slim

RUN apt-get update

#Install Google Chrome
RUN apt install -y --no-install-recommends apt-utils
RUN wget --quiet https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb

#Install Openjdk 8
RUN apt-get install default-jre -y

COPY . .
COPY tests.sh /usr/local/bin
