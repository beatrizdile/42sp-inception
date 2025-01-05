FROM debian:oldstable

RUN apt update && apt install -y \
    php-fpm \
    php-mysql \
    nginx \
    unzip \
    && apt clean

WORKDIR /etc/nginx/sites-available
RUN rm default
COPY conf/nginx.conf.template .
RUN mv nginx.conf.template default

CMD ["nginx", "-g", "daemon off;"]