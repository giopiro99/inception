FROM debian:bookworm

RUN apt update && apt install -y php-fpm php-mysql wget

RUN sed -i 's|listen = /run/php/php.*-fpm.sock|listen = 9001|g' /etc/php/*/fpm/pool.d/www.conf

COPY tools/script-adminer.sh /usr/local/bin/script-adminer.sh

RUN chmod +x /usr/local/bin/script-adminer.sh

EXPOSE 9001

CMD ["/usr/local/bin/script-adminer.sh"]
