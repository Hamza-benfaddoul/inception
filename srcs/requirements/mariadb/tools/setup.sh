#!/bin/sh

# Function to configure MariaDB
config_mariadb() {
  # Wait for the database to be ready
  until mysqladmin ping -h "localhost" -u$MYSQL_ROOT_PASSWORD ; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
  done
  mariadb -h "localhost" -u"$MYSQL_ROOT_PASSWORD" -e "CREATE DATABASE IF NOT EXISTS $WP_DB_NAME ;
  CREATE USER IF NOT EXISTS $WP_DB_USER@'%' IDENTIFIED BY '$WP_DB_PASSWORD'; 
  GRANT ALL PRIVILEGES ON $WP_DB_NAME.* TO $WP_DB_USER@'%' IDENTIFIED BY '$WP_DB_PASSWORD'; 
  FLUSH PRIVILEGES;"
  
  echo "db initialized"
}

# Start the MariaDB configuration function in the background
config_mariadb &

# Start mysql server
exec mysqld
