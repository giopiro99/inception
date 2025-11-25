# Usa Debian Bookworm come base
FROM debian:bookworm

# Aggiorna i pacchetti e installa MariaDB e gettext-base (per envsubst)
RUN apt update && apt install -y mariadb-server gettext-base

# Crea la directory del socket e imposta i permessi
RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

# Copia il file di configurazione personalizzato di MariaDB
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

# Copia lo script SQL di inizializzazione (user, database, ecc.)
COPY tools/init.sql /tmp/init.sql

# Copia lo script di avvio personalizzato
COPY tools/script-mariadb.sh /usr/local/bin/script-mariadb.sh

# Rende lo script di avvio eseguibile
RUN chmod +x /usr/local/bin/script-mariadb.sh

# Espone la porta standard del database
EXPOSE 3306

# Avvia MariaDB attraverso lo script personalizzato
ENTRYPOINT ["script-mariadb.sh"]
