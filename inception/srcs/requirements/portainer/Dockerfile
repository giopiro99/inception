FROM debian:bookworm

RUN apt update && apt install -y wget ca-certificates

# Directory base
RUN mkdir -p /opt/portainer /data

# Scarica e estrai
RUN wget https://github.com/portainer/portainer/releases/download/2.21.4/portainer-2.21.4-linux-amd64.tar.gz -O /tmp/portainer.tar.gz \
    && tar -xzf /tmp/portainer.tar.gz -C /opt/portainer --strip-components=1 \
    && rm /tmp/portainer.tar.gz

# Rendi il binario eseguibile
RUN chmod +x /opt/portainer/portainer

# Espone porta interna
EXPOSE 9443

# Avvia Portainer
CMD ["/opt/portainer/portainer", "--data", "/data"]
