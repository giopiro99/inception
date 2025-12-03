FROM debian:bookworm

# installa vsftpd
RUN apt update && apt install -y vsftpd

# copia il file di configurazione personalizzato di vsftpd
COPY conf/ftp.conf /etc/vsftpd.conf

# copia lo script di avvio personalizzato
COPY tools/script_ftp.sh /usr/local/bin/script_ftp.sh

RUN chmod +x /usr/local/bin/script_ftp.sh

EXPOSE 21 30000-30009

CMD ["/usr/local/bin/script_ftp.sh"]