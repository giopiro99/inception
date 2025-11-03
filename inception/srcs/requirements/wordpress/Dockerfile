FROM debian:bookworm

RUN apt update && apt install -y php-fpm php-mysqli curl

COPY www.conf /etc/php/8.2/fpm/pool.d/.

COPY tools/script-wp.sh /usr/local/bin/script-wp.sh

RUN chmod +x /usr/local/bin/script-wp.sh

EXPOSE 9000

CMD ["/usr/local/bin/script-wp.sh"]