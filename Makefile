# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hbenfadd <hbenfadd@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/09/26 05:40:50 by hbenfadd          #+#    #+#              #
#    Updated: 2023/09/26 06:45:37 by hbenfadd         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

all: build up

up:
	mkdir -p ~/data/wordpress-data
	mkdir -p ~/data/mariadb-data
	docker compose -f ./srcs/docker-compose.yml up -d
build:
	docker compose -f ./srcs/docker-compose.yml build

build:
down:
	docker compose -f ./srcs/docker-compose.yml down
logs:
	docker compose -f ./srcs/docker-compose.yml logs -f

clean:
	docker stop $$(docker ps -qa);\
	docker rm $$(docker ps -qa);\
	docker rmi -f $$(docker images -qa);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm $$(docker network ls -q);\
	2>/dev/null

fclean: clean
	rm -rf ~/data/

re: fclean
	docker compose -f scrs/docker-compose.yml up -d --build