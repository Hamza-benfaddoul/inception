#!/bin/sh

# Function to configure MariaDB
config() {
    sleep 10
    mariadb < /init.sql
    echo "done"
}

# Start the MariaDB configuration function in the background
config &

# Execute the provided command (if any)
echo "exec done"
exec mysqld --user=mysql

