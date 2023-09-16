# Use the official Alpine Linux as the base image
FROM alpine:3.18.3

# Expose the MariaDB port
EXPOSE 3306

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
COPY ./conf/my.cnf /etc/my.cnf

# Copy the MariaDB script file
COPY ./tools/setup.sh /
RUN chmod 777 /setup.sh

# Start MariaDB on container launch
CMD ["/./setup.sh"]

