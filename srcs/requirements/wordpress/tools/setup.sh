#!/bin/sh

config_wordpress(){

  # Wait for the database to be ready
  until mysqladmin ping -h "$WP_DB_HOST"  -u"$WP_DB_USER" -p"$WP_DB_PASSWORD"  ; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
  done

  if [ -f $WP_PATH/config.php ]; then
    echo "The 'wp-config.php' file already exists."
  else
    # Create wp-config.php
    wp config create --dbname="$WP_DB_NAME" --dbuser="$WP_DB_USER" \
       --dbpass="$WP_DB_PASSWORD" --dbhost="$WP_DB_HOST" --path="$WP_PATH"
    echo "wp-config.php created."
    # Check if the user already exists
  fi
  if wp user list --field=user_login --path="$WP_PATH" 2>/dev/null | grep -q "^$WP_EDITOR_USER$"; then
        echo "The '$WP_EDITOR_USER' username is already registered."
  else
      # Create the user if it doesn't exist
      wp user create "$WP_EDITOR_USER" "$WP_EDITOR_EMAIL" --user_pass="$WP_EDITOR_PASSWORD" --role=editor --path="$WP_PATH"
      echo "User '$WP_EDITOR_USER' created."
  fi
  if wp db query "SHOW TABLES LIKE 'wp_options';" --path="$WP_PATH" 2>/dev/null | grep -q "wp_options"; then
    echo "WordPress is already installed."
  else
    # Install WordPress if it's not already installed
    echo "Install WordPress"
    wp core install --url=$DOMAIN_NAME  --title="inception" --admin_user=$WP_ADMIN_USER \
      --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path="$WP_PATH"
    echo "WordPress installation completed."
  fi
}

config_wordpress &

# Start php-fpm
exec php-fpm81 -F

