FROM nginx:latest

COPY ./default.conf /etc/nginx/conf.d/

RUN apt update
RUN apt install -y --no-install-recommends \
    python3-acme \
    python3-certbot \
    python3-mock  \
    python3-openssl \
    python3-pkg-resources \
    python3-pyparsing \
    python3-zope.interface

RUN apt install -y --no-install-recommends python3-certbot-nginx
