
all: confs up

confs:
	@ sudo mkdir -p /home/bedos-sa/data/maria_db
	@ sudo mkdir -p /home/bedos-sa/data/wordpress
	@ sudo grep "bedos-sa.42.fr" /etc/hosts || sudo sh -c 'echo "127.0.0.1 bedos-sa.42.fr" >> /etc/hosts'

up:
	docker-compose -f srcs/docker-compose.yml up --build -d

clean:
	docker-compose -f srcs/docker-compose.yml down --rmi all

fclean: clean
	docker system prune --all --volumes --force
	# docker stop $(docker ps -aq)
	# docker rm --force $(docker ps -aq)
	# docker rmi --force $(docker image ls -q)
	# docker network rm $(docker network ls --filter type=custom -q)
	# docker volume rm $(docker volume ls -q)
	sudo rm -rf /home/bedos-sa/data

re: fclean all

.PHONY: all clean fclean re confs