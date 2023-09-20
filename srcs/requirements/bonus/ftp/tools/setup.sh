#!/bin/sh

echo "FTP_SERVER INSTALLATION BEGIN!!!"
adduser -D $FTP_USER && echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
chown -R $FTP_USER:$FTP_USER /var/www/wordpress
echo "USER ftpuser CREATED "

exec vsftpd /etc/vsftpd/vsftpd.conf
