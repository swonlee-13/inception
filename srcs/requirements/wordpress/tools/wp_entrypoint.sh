#!/bin/sh

if [ ! -f "/var/www/html/xmlrpc.php" ]; then
wp core install \
	--allow-root \
	--url="seongwol.42.fr" \
	--title="inception" \
	--admin_user="seongwol"  --admin_password="1234" \
	--admin_email="gbssw13@gmail.com" \
	--locale=ko_KR

wp user create evaluator evaluator@student.42seoul.kr --user_pass=1234
fi

exec "$@"