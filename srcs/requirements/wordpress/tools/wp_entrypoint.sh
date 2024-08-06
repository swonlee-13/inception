#!/bin/sh

wp core install \
	--allow-root \
	--url=$DOMAIN \
	--title=$TITLE \
	--admin_user=$DB_USER  --admin_password=$ADMIN_PASSWORD \
	--admin_email=$ADMIN_EMAIL \
	--locale=ko_KR

wp user create evaluator evaluator@student.42seoul.kr --user_pass=1234

exec "$@"
