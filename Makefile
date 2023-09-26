up:
	mkdir -p  ~/data/mariadb-data
	mkdir -p  ~/data/wordpress-data
	docker compose -f ./srcs/docker-compose.yml up 
build:
	docker compose -f ./srcs/docker-compose.yml  build
down:
	docker compose -f ./srcs/docker-compose.yml down
clean:
	rm -rf ~/data/

