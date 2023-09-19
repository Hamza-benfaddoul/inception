# Use the Alpine Linux base image
FROM alpine:3.18.3

# Update and install dependencies
RUN apk  add \
    wget \
    php-fpm \
    php-session \
    php-json \
    php-ctype \
    php-mysqli \
    php-pdo \
    php-pdo_mysql \
    php-pdo_sqlite

WORKDIR /var/www/html/adminer
# Download Adminer
RUN wget https://github.com/vrana/adminer/releases/download/v4.8.1/adminer-4.8.1.php
RUN mv adminer-4.8.1.php adminer.php 

RUN echo "listen = adminer:9000" >> /etc/php81/php-fpm.d/www.conf

# Expose port 443 for HTTPS
EXPOSE 443

# Start nginx and php-fpm
CMD ["php-fpm81", "-F"]

