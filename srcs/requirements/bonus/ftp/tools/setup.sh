#!/bin/sh

adduser -D ${FTP_USER}

echo "${FTP_USER}:${FTP_PASS}" | chpasswd

echo "${FTP_USER}" >> /etc/vsftpd.userlist

exec "$@"