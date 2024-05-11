FROM alpine

ENV FRP_VERSION=v0.58.0

ARG TOKEN=${TOKEN}
ARG SUBDOMAIN_HOST=${SUBDOMAIN_HOST}

ADD entrypoint.sh /entrypoint.sh
ADD server.toml /server.ini

RUN addgroup -S frp \
 && adduser -D -S -h /var/frp -s /sbin/nologin -G frp frp \
 && apk add --no-cache curl \
 && curl -fSL https://github.com/fatedier/frp/releases/download/${FRP_VERSION}/frp_${FRP_VERSION:1}_linux_amd64.tar.gz -o frp.tar.gz \
 && tar -zxv -f frp.tar.gz \
 && rm -rf frp.tar.gz \
 && mv frp_*_linux_amd64 /frp \
 && chown -R frp:frp /frp \
 && mv /entrypoint.sh /frp/ \
 && mv /server.ini /frp/


USER frp

WORKDIR /frp

CMD ["/frp/entrypoint.sh"]