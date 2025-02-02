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

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp \
	&& wp core download --allow-root \
	&& mkdir /run/php

	
COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

COPY ./conf/wp_conf.sh .
RUN chmod +x wp_conf.sh
	
USER www-data
CMD [ "./wp_conf.sh" ]
