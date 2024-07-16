#!/bin/sh

if [! -f "/var/www/wp-config.php" ]; then
	cd /var/www/html
	
	wp config create \
		--dbname=${MYSQL_DB_NAME} \
		--dbuser=${MYSQL_USER} \
		--dbpass=${MYSQL_DB_PASSWORD} \
		--dbhost=${MYSQL_DB_HOST} \
		--dbport=${MYSQL_DB_PORT}
		--path=/var/www/html/ \
		--skip-check

	wp core install \
		--url=seongwol.42.fr \
		--title="inception" \
		--admin_user=seongwol \ 
		--admin_password=1234 \
		--admin_email=gbssw13@gmail.com \
		--locale=ko_KR && \

	wp user create evaluator --user_pass=1234
fi
