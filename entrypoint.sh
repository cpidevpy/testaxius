#!/bin/sh

mkdir -p /etc/xray

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout /etc/xray/key.pem \
  -out /etc/xray/cert.pem \
  -subj "/CN=render.com"

exec /usr/local/bin/xray -config /etc/xray/config.json
