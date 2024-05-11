#!/bin/sh

sed -i "s|#TOKEN#|$TOKEN|g" /frp/server.ini
sed -i "s|#SUBDOMAIN_HOST#|$SUBDOMAIN_HOST|g" /frp/server.ini

/frp/frps -c /frp/server.ini
