#!/bin/sh

# Wait for the database to be ready
until mysql -h $MYSQL_HOST  -u $MYSQL_USER -p$MYSQL_PASSWORD -e ";" ; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
done

# Generate wp-config.php
wp config create --dbname="$WORDPRESS_DB_NAME" --dbuser="$WORDPRESS_DB_USER" --dbpass="$WORDPRESS_DB_PASS" --dbhost="$DB_HOST" --path="$WORDPRESS_WP_PATH"

# Install WordPress
wp core install --url=yourwebsite.com --title="inception" --admin_user=hbenfadd --admin_password=root --admin_email=hbenfadd@example.com --path="$WORDPRESS_WP_PATH"

# Create a Supervisor User
#wp user create supervisorusername supervisor@example.com --user_pass=supervisorpassword --role=editor --path="$WORDPRESS_WP_PATH"
cd /var/www/html/wordpress
exec php-fpm81 -F

