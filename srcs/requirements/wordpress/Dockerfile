FROM debian:bookworm

# Installazione di PHP-FPM, estensione MySQLi e curl
RUN apt update && apt install -y php-fpm php-mysqli curl

# Configurazione di PHP-FPM per accettare connessioni esterne
COPY www.conf /etc/php/8.2/fpm/pool.d/.

# Script di avvio personalizzato
COPY tools/script-wp.sh /usr/local/bin/script-wp.sh

# Rendi eseguibile lo script di avvio
RUN chmod +x /usr/local/bin/script-wp.sh

# Esponi la porta 9000 per PHP-FPM
EXPOSE 9000

# Comando per avviare PHP-FPM usando lo script personalizzato
CMD ["/usr/local/bin/script-wp.sh"]