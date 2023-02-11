#!/bin/sh

TEMPLATE_DIR=/var/www/html/plugins-template/
ENABLED_DIR=/var/www/html/plugins-enabled/

LOGIN_SERVERS_PLUGIN=login-servers.php

if [ -f "${ENABLED_DIR}${LOGIN_SERVERS_PLUGIN}" ]; then
    rm "${ENABLED_DIR}${LOGIN_SERVERS_PLUGIN}"
fi

cp "${TEMPLATE_DIR}${LOGIN_SERVERS_PLUGIN}" "${ENABLED_DIR}${LOGIN_SERVERS_PLUGIN}"
sed -i -e "s/%DATABASE_HOST%/${DATABASE_HOST}/g" "${ENABLED_DIR}${LOGIN_SERVERS_PLUGIN}"
sed -i -e "s/%DATABASE_PORT%/${DATABASE_PORT}/g" "${ENABLED_DIR}${LOGIN_SERVERS_PLUGIN}"
sed -i -e "s/%DATABASE_DRIVER%/${DATABASE_DRIVER}/g" "${ENABLED_DIR}${LOGIN_SERVERS_PLUGIN}"

/usr/local/bin/entrypoint.sh
php -S "[::]:8080" -t /var/www/html