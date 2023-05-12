#!/bin/sh

wp --allow-root --path=/var/www core install --url="cegbulef.42.fr" --title="Chinedu's Word-Press" --admin_user=wpaduser --admin_password=$WPADPASS --admin_email="cegbulef@student.42abudhabi.ae"

wp user create wpuser1 "user1@student.42abudhabi.ae" --role=author --user_pass=$WPUSER1PASS --allow-root

wp --allow-root --path=/var/www option update blogname "Chinedu's Word-Press"
wp --allow-root --path=/var/www option update blogdescription "The Inception of Things"
wp --allow-root --path=/var/www option update blog_public 0

wp theme install salient --activate --allow-root

wp plugin install redis-cache --activate --allow-root

wp plugin update --all --allow-root

/usr/sbin/php-fpm8 -F
