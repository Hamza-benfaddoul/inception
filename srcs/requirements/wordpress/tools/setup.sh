#!/bin/sh

config(){

  # Wait for the database to be ready
  until mysqladmin ping -h $MYSQL_HOST  -u $MYSQL_USER -p$MYSQL_PASSWORD  ; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
  done

  # Generate wp-config.php
  echo " Generate wp-config.php"
  wp config create --dbname="$WORDPRESS_DB_NAME" --dbuser="$WORDPRESS_DB_USER" \
    --dbpass="$MYSQL_PASSWORD" --dbhost="$MYSQL_HOST" --path="$WORDPRESS_WP_PATH"

  # Install WordPress
  echo " Install WordPress "
  wp core install --url=hbenfadd.42.fr --title="inception" --admin_user=hbenfadd \
    --admin_password=root --admin_email=hbenfadd@example.com --path="$WORDPRESS_WP_PATH"
  echo "crate the user"

  # Create a Supervisor User
#  wp user create supervisorusername supervisor@example.com --user_pass=supervisorpassword --role=editor --path="$WORDPRESS_WP_PATH"

}
config &

exec php-fpm81 -F

