#!/bin/sh

# Function to configure MariaDB
config() {
  # Wait for the database to be ready
  until mysqladmin ping -h "localhost" -u"root" ; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
  done
  echo "db initialized"

  mariadb -h "localhost" -r"root"  -e " CREATE DATABASE wordpress;
  CREATE USER 'hbenfadd'@'wordpress' IDENTIFIED BY 'root';
  GRANT ALL PRIVILEGES ON wordpress.* TO 'hbenfadd'@'wordpress' IDENTIFIED BY 'root';
  FLUSH PRIVILEGES;
  "
}

# Start the MariaDB configuration function in the background
config &

# Start Mysql server
exec mysqld --user=mysql

