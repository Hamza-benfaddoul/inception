# Use the official Alpine Linux as the base image
FROM alpine:latest

# Install MariaDB and other necessary packages
RUN apk add mariadb mariadb-common mariadb-client && apk add openrc

RUN mkdir -p /run/openrc && touch /run/openrc/softlevel && rc-update add mariadb default && \
    rc-service mariadb setup

# Create a directory to hold the database data
RUN mkdir -p /var/lib/mysql

# Copy the MariaDB configuration file
COPY ./conf/my.cnf /etc/mysql/my.cnf
COPY ./conf/init.sql /docker-entrypoint-initdb.d/

# Expose the MariaDB port
EXPOSE 3306
RUN mkdir -p /var/log/mysql && chown -R mysql:root /var/log/mysql
RUN mkdir -p /var/run/mysqld && chown -R mysql:root /var/run/mysqld

# Start MariaDB on container launch
CMD ["mysqld", "--user=mysql"]


