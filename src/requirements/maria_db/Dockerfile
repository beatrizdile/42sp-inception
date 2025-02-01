FROM debian:oldstable

RUN apt update && apt install -y mariadb-server

COPY ./conf/db_config.sh .

RUN chmod +x db_config.sh

CMD ["./db_config.sh"]
