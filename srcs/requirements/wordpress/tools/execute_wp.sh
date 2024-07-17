#!/bin/sh

if [ ! -f "/var/www/html/wp-config.php" ]; then
wp config create \
	--dbname=$DB_NAME \
	--dbuser=$DB_USER \
	--dbpass=$DB_PASSWORD \
	--dbhost=$DB_HOST \
	--path=/var/www/html/ \
	--skip-check

fi