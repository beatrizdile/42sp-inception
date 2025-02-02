FROM debian:oldstable

RUN apt update && apt install -y \
    nginx \
    openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]