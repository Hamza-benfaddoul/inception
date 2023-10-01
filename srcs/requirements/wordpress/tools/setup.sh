#!/bin/sh

configure_wordpress(){

  until mariadb -h "$WP_DB_HOST"  -u "$WP_DB_USER" -p"$WP_DB_PASSWORD" -e ";"  ; do
    echo "Waiting for MariaDB to be ready..."
    sleep 5
  done


  if [ ! -f "$WP_PATH"/wp-config.php ]; then
    # Create wp-config.php
    wp config create --allow-root --dbname="$WP_DB_NAME" --dbuser="$WP_DB_USER" \
       --dbpass="$WP_DB_PASSWORD" --dbhost="$WP_DB_HOST" --path="$WP_PATH"

    wp config set WP_REDIS_HOST   'redis'                   --path="$WP_PATH"
    wp config set FTP_HOST        $FTP_HOST                 --path="$WP_PATH"
    wp config set FTP_USER        $FTP_USER                 --path="$WP_PATH"
    wp config set FTP_PASS        $FTP_PASSWORD             --path="$WP_PATH"
    wp config set FTP_SSL         false                     --path="$WP_PATH" 
    wp config set FS_METHOD       direct                    --path="$WP_PATH" 
    wp config set FS_PASSIVE_MODE true                      --path="$WP_PATH"
    wp config set EP_HOST         http://$ES_HOST:$ES_PORT  --path="$WP_PATH"

    echo "wp-config.php created."

    wp user create "$WP_EDITOR_USER" "$WP_EDITOR_EMAIL" --user_pass="$WP_EDITOR_PASSWORD" \
        --role=editor --path="$WP_PATH"
    echo "User '$WP_EDITOR_USER' created."

    echo "Install WordPress"
    wp core install --url=$DOMAIN_NAME  --title="inception" --admin_user=$WP_ADMIN_USER \
      --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --path="$WP_PATH"

    # Install redis-cache plugin
    wp plugin install  redis-cache --activate   --path="$WP_PATH" 
    wp redis enable                             --path="$WP_PATH"

    # Install elasticpress  plugin and activate it 
    while true; do
      STATUS=$(nc -z ${ES_HOST}:${ES_PORT})
      if [ ! $STATUS ]; then
        echo "Elasticsearch is running and listening on ${ES_HOST}:${ES_PORT}"
        wp plugin install  elasticpress             --path="$WP_PATH"
        wp plugin activate elasticpress             --path="$WP_PATH"
        while true; do
          wp elasticpress    sync                     --path="$WP_PATH"
          if [ $? -eq 0 ]; then
            echo "Elasticsearch synchronization successful."
            break
          else
            wp elasticpress    clear-sync                     --path="$WP_PATH"
            echo "Elasticsearch synchronization failed. Retrying in ${SLEEP_DURATION} seconds..."
            sleep 5
          fi
        done
        break
      else
        echo "Elasticsearch is not yet available on ${ES_HOST}:${ES_PORT} . Waiting..."
        sleep 5
      fi
    done
  else
    echo "The 'wp-config.php' file already exists."
  fi
  echo "WordPress installation and configuration is completed."
  chmod -R 777 /var/www/html/wordpress/wp-content
}

configure_wordpress &

# Start php-fpm
exec php-fpm81 -F

