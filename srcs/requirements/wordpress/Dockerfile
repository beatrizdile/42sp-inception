FROM debian:oldstable

ARG DOMAIN_NAME
ARG DATABASE_NAME
ARG DATABASE_USER
ARG DATABASE_USER_PASSWORD
ARG WP_ROOT_USER
ARG WP_ROOT_EMAIL
ARG WP_ROOT_PASSWORD
ARG WP_USER
ARG WP_EMAIL
ARG WP_PASSWORD

RUN apt update && \
	apt install -y php7.4 php7.4-fpm php7.4-mysql mariadb-client wget

WORKDIR /var/www/wordpress

COPY ./conf/wp_conf.sh /var/www/wp_conf.sh

RUN chmod +x /var/www/wp_conf.sh

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
	&& chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
	&& wp core download --allow-root \
	&& mkdir /run/php \
	&& chown -R www-data:www-data /run/php /var/log /var/www/wordpress

	
RUN sed -i '0,/^listen/ s/^listen.*/listen = 0.0.0.0:9000/' /etc/php/7.4/fpm/pool.d/www.conf

USER www-data

CMD [ "/var/www/wp_conf.sh" ]
