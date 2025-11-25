#!/bin/bash

mkdir -p /etc/mysql
# Sostituisci le variabili d’ambiente dentro il file SQL
envsubst < /tmp/init.sql > /etc/mysql/init.sql

# Se è il primo avvio, inizializza il DB
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=root --datadir=/var/lib/mysql
fi

exec mysqld
