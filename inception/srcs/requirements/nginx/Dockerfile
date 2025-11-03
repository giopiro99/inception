# Usa come base l'immagine ufficiale di Debian "bookworm"
# (una distribuzione Linux stabile e leggera)
FROM debian:bookworm

# Aggiorna la lista dei pacchetti disponibili,
# installa eventuali aggiornamenti di sistema
# e installa i pacchetti necessari: nginx (server web) e openssl (per gestire certificati SSL)
RUN apt update && apt upgrade -y && apt install -y nginx openssl

# Copia il file di configurazione personalizzato di Nginx
# dalla directory locale /conf del progetto
# nella directory di configurazione principale di Nginx dentro al container.
# In questo modo il container userà la tua configurazione invece di quella di default.
COPY /conf/server.conf /etc/nginx/nginx.conf

# Comando di default quando il container parte:
# avvia Nginx in foreground
# in modo che il container resti attivo.
CMD ["nginx", "-g", "daemon off;"]
