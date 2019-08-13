FROM node:10-stretch-slim

RUN apt-get update -y

#Install Google Chrome
RUN apt install -y --no-install-recommends apt-utils
RUN wget --quiet https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb

#Install Openjdk 8
RUN DEBIAN_FRONTEND=noninteractive apt-get -y upgrade \
 && DEBIAN_FRONTEND=noninteractive apt-get install --no-install-recommends \
 curl ca-certificates krb5-locales libcurl3 libffi6 libgmp10 libgnutls30 \
 libgssapi-krb5-2 libhogweed4 libidn11 libidn2-0 libk5crypto3 libkeyutils1 \
 libkrb5-3 libkrb5support0 libldap-2.4-2 libldap-common libnettle6 \
 libnghttp2-14 libp11-kit0 libpsl5 librtmp1 libsasl2-2 libsasl2-modules \
 libsasl2-modules-db libssh2-1 libssl1.0.2 libssl1.1 libtasn1-6 libunistring0 \
 openssl publicsuffix libasound2 libasound2-data \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists \
 && curl -L -b "oraclelicense=a" -O http://download.oracle.com/otn-pub/java/jdk/11.0.2+9/f51449fcd52f4d52b93a989c5c56ed3c/jdk-11.0.2_linux-x64_bin.deb \
 && dpkg -i ./jdk-11.0.2_linux-x64_bin.deb \
 && rm ./jdk-11.0.2_linux-x64_bin.deb

COPY . .
COPY tests.sh /usr/local/bin
