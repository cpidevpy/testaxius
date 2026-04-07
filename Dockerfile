FROM teddysun/xray:latest

RUN apk add --no-cache openssl

WORKDIR /etc/xray

COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
