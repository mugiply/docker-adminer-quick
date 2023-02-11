FROM adminer

ENV DATABASE_HOST=db
ENV DATABASE_PORT=5432
ENV DATABASE_DRIVER=pgsql

COPY ./adminer/plugins-enabled/ /var/www/html/plugins-template/
COPY start.sh /usr/local/bin/

ENTRYPOINT ["/bin/sh", "/usr/local/bin/start.sh"]