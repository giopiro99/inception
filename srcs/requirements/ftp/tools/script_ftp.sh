#!/bin/bash

mkdir -p /var/run/vsftpd/empty

mkdir -p /srv/ftp && \
    useradd -m -d /srv/ftp -s /bin/bash $FTP_USER && \
    echo "$FTP_USER:$FTP_PASS" | chpasswd

exec /usr/sbin/vsftpd /etc/vsftpd.conf