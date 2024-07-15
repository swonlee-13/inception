#!/bin/sh

if [! -d "/var/lib/sql/wordpress" ]; then
	cd /var/www/html
	
	wp config create \
		--dbname=${MYSQL_DB_NAME} \
		--dbuser=${MYSQL_USER} \
		--dbpass=${MYSQL_DB_PASSWORD} \
		--dbhost=${MYSQL_DB_HOST} \
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
