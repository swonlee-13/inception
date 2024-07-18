
all: mac
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build: mac
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down

re:
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

mac:
	bash srcs/make_dir.sh

clean: down
	docker system prune -a

fclean:
	docker stop $$(docker ps -qa) || \
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	rm -rf /Users/seongwol/Documents/volume/wordpress/data
	rm -rf /Users/seongwol/Documents/volume/wordpress/data

.PHONY	: all build down re clean fclean