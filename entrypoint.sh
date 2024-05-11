#!/bin/sh

sed -i "s|#TOKEN#|$TOKEN|g" /frp/server.toml
sed -i "s|#SUBDOMAIN_HOST#|$SUBDOMAIN_HOST|g" /frp/server.toml

/frp/frps -c /frp/server.toml
