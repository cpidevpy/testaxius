FROM alpine:latest

RUN apk add --no-cache openssl wget unzip

# Скачиваем Xray последней версии
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip -d /usr/local/bin/ && \
    rm Xray-linux-64.zip && \
    chmod +x /usr/local/bin/xray

WORKDIR /etc/xray

COPY config.json /etc/xray/config.json
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 443

ENTRYPOINT ["/entrypoint.sh"]
