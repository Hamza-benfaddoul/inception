up:
	docker compose -f ./srcs/docker-compose.yml up # -d
build:
	docker compose -f ./srcs/docker-compose.yml  build
down:
	docker compose -f ./srcs/docker-compose.yml down
clean:
	sudo rm -rf /home/$(USER)/data/mariadb-data/*
	sudo rm -rf /home/$(USER)/data/wordpress-data/*
