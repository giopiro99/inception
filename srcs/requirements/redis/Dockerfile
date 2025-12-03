FROM debian:bookworm

# Installazione di Redis
RUN apt update && apt install -y redis-server

# Configurazione di Redis per accettare connessioni esterne
EXPOSE 6379

# Comando per avviare Redis in modalità server
CMD ["redis-server",  "--bind", "0.0.0.0", "--protected-mode", "no"]

# redis e' un database in memoria che funziona come un archivio chiave-valore ad alte prestazioni.
# gestisce la cache delle applicazioni web e le rende piu' veloci.
# rispondendo rapidamente alle richieste degli utenti senza passare sempre dal database principale.