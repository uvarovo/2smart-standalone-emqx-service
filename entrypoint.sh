#!/bin/sh
set -e

# Substitute MySQL connection params from environment into emqx.conf
MYSQL_SERVER="${EMQX_MYSQL_HOST}:${EMQX_MYSQL_PORT}"

sed -i \
  -e "s|MYSQL_SERVER_PLACEHOLDER|${MYSQL_SERVER}|g" \
  -e "s|MYSQL_USER_PLACEHOLDER|${EMQX_MYSQL_USER}|g" \
  -e "s|MYSQL_PASS_PLACEHOLDER|${EMQX_MYSQL_PASSWORD}|g" \
  -e "s|MYSQL_DB_PLACEHOLDER|${EMQX_MYSQL_DATABASE}|g" \
  /opt/emqx/etc/emqx.conf

exec /usr/bin/docker-entrypoint.sh /opt/emqx/bin/emqx foreground
