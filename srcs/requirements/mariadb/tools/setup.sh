#!/bin/sh

# Function to configure MariaDB
config() {
  # Wait for the database to be ready
  until mysqladmin ping -h "localhost" -u"root" ; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
  done
  echo "db initialized"

  mariadb -h "localhost" -u"root"  -e "CREATE DATABASE IF NOT EXISTS wordpress; CREATE USER IF NOT EXISTS'hbenfadd'@'%' IDENTIFIED BY 'root';
  GRANT ALL PRIVILEGES ON wordpress.* TO 'hbenfadd'@'%' IDENTIFIED BY 'root';
  FLUSH PRIVILEGES;
  "
}

# Start the MariaDB configuration function in the background
config &

# Execute the provided command (if any)
exec mysqld --user=mysql

