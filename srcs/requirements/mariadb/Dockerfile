# Use the official Alpine Linux as the base image
FROM alpine:latest

# Install MariaDB and other necessary packages
RUN apk add mariadb && apk add openrc

RUN mkdir -p /run/openrc && touch /run/openrc/softlevel && \
    rc-update add mariadb default && rc-service mariadb setup

# Create a directory to hold the database data
RUN mkdir -p /var/lib/mysql && chown -R mysql:root /var/lib/mysql
RUN mkdir -p /var/log/mysql && chown -R mysql:root /var/log/mysql
RUN mkdir -p /var/run/mysqld && chown -R mysql:root /var/run/mysqld

# Copy the MariaDB configuration file
COPY ./conf/mariadb-server.cnf /etc/mysql/mariadb-server.cnf
COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf
COPY ./conf/mariadb-server.cnf /etc/my.cnf
COPY ./conf/init.sql /docker-entrypoint-initdb.d/

# Expose the MariaDB port
EXPOSE 3306

# Start MariaDB on container launch
CMD ["mysqld", "--user=mysql"]


