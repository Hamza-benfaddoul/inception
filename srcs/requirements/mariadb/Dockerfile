# Use the official Alpine Linux as the base image
FROM alpine:latest

# Update 
RUN apk update

# Install MariaDB and other necessary packages
RUN apk add mariadb mariadb-client
RUN apk add openrc && \
    mkdir -p /run/openrc && touch /run/openrc/softlevel

RUN rc-update add mariadb default && rc-service mariadb setup

# Create a directory to hold the database data
RUN mkdir -p /var/lib/mysql && chown -R mysql:root /var/lib/mysql
RUN mkdir -p /var/log/mysql && chown -R mysql:root /var/log/mysql
RUN mkdir -p /var/run/mysqld && chown -R mysql:root /var/run/mysqld

# Copy the MariaDB configuration file
COPY ./conf/init.sql /
COPY ./conf/my.cnf /etc/my.cnf
COPY ./tools/setup.sh /
RUN chmod 777 /setup.sh

# Expose the MariaDB port
EXPOSE 3306

ENTRYPOINT ["/setup.sh"]

# Start MariaDB on container launch
CMD ["mysqld"]

