FROM debian:bookworm

# Installazione di PHP-FPM, estensione MySQL e wget
RUN apt update && apt install -y php-fpm php-mysql wget

# Aggiungo il repository ufficiale di Adminer e lo installo aggiungendo la linea listen 9001 nel file di configurazione di PHP-FPM 
RUN sed -i 's|listen = /run/php/php.*-fpm.sock|listen = 9001|g' /etc/php/*/fpm/pool.d/www.conf

# copio lo script di avvio personalizzato
COPY tools/script-adminer.sh /usr/local/bin/script-adminer.sh

RUN chmod +x /usr/local/bin/script-adminer.sh

EXPOSE 9001

CMD ["/usr/local/bin/script-adminer.sh"]
