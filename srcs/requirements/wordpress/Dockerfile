FROM alpine:latest

RUN apk update && apk add php php-fpm php-mysqli
WORKDIR /var/www/html

ADD  https://wordpress.org/latest.tar.gz .

RUN tar -xzvf latest.tar.gz && \
    rm -rf latest.tar.gz
RUN chmod -R 755 /var/www/html/wordpress
RUN echo "listen = wordpress:9000" >> /etc/php81/php-fpm.d/www.conf
EXPOSE 9000
WORKDIR /var/www/html/wordpress
COPY ./conf/wp-config.php .
CMD ["php-fpm81", "-F"]