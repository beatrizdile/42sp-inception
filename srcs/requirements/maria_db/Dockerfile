FROM debian:oldstable

ARG DATABASE_NAME
ARG DATABASE_USER
ARG DATABASE_USER_PASSWORD
ARG DATABASE_ROOT
ARG DATABASE_ROOT_PASSWORD

RUN apt update && apt install -y mariadb-server

COPY ./conf/db_config.sh .

RUN chmod +x db_config.sh && ./db_config.sh

COPY ./conf/mariadb.conf /etc/mysql/my.cnf

EXPOSE 3306

CMD ["mariadbd-safe"]