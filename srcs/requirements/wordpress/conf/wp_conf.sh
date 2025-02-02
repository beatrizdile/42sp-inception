#!/bin/bash

sleep 15

wp config create --allow-root \
	--path=/var/www/wordpress \
	--dbname=$DATABASE_NAME \
	--dbuser=$DATABASE_USER \
	--dbpass=$DATABASE_USER_PASSWORD \
	--dbhost="mariadb" \
	--dbprefix='wp_' \
	--dbcharset="utf8"

wp core install --allow-root \
--path=/var/www/wordpress \
--title="Inception" \
--url=$DOMAIN_NAME \
--admin_user=$WP_ROOT_USER \
--admin_password=$WP_ROOT_PASSWORD \
--admin_email=$WP_ROOT_EMAIL

wp user create --allow-root	\
--path=/var/www/wordpress \
"$WP_USER" "$WP_EMAIL" \
--user_pass=$WP_PASSWORD \
--role='author'

exec php-fpm7.4 -F
