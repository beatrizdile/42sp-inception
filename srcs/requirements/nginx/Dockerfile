FROM debian:oldstable

RUN apt update && apt install -y \
    nginx \
    openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN openssl req -newkey rsa:2048 -nodes -keyout /etc/nginx/private.key -x509 \
    -days 365 -out /etc/nginx/certificate.pem -subj "/C=BR/ST=SP/L=SãoPaulo/O=42sp/CN=bedos-sa.42.fr"

CMD ["nginx", "-g", "daemon off;"]