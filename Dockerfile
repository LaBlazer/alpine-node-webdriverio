FROM node:10-stretch

RUN apt-get update

#Install Google Chrome
RUN wget --quiet https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN dpkg -i google-chrome-stable_current_amd64.deb || apt-get -qq install -y -f
RUN dpkg -i google-chrome-stable_current_amd64.deb

#Install Openjdk 8
RUN apt-get install default-jre -y
RUN apt-get install default-jdk -y

COPY . .
COPY run_tests.sh /usr/local/bin
CMD java -version && google-chrome --version
