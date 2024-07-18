#!/bin/sh

adduser -D ${FTP_USER}  

chown -R ${FTP_USER}:${FTP_USER} /var/www/html
chmod -R 755 /var/www/html
echo "${FTP_USER}:${FTP_PASS}" | chpasswd

echo "${FTP_USER}" >> /etc/vsftpd.userlist

exec "$@"