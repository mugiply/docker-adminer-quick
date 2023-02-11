FROM adminer

ARG DATABASE_HOST
ARG DATABASE_PORT
ARG DATABASE_DRIVER

COPY ./adminer/plugins-enabled/ /var/www/html/plugins-enabled/

RUN \
  sed -i -e "s/%DATABASE_HOST%/${DATABASE_HOST}/g" /var/www/html/plugins-enabled/login-servers.php && \
  sed -i -e "s/%DATABASE_PORT%/${DATABASE_PORT}/g" /var/www/html/plugins-enabled/login-servers.php && \
  sed -i -e "s/%DATABASE_DRIVER%/${DATABASE_DRIVER}/g" /var/www/html/plugins-enabled/login-servers.php && \
  cat /var/www/html/plugins-enabled/login-servers.php