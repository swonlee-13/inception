all: dir
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

build: dir
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d --build

down:
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env down -v

re: clean
	docker compose -f ./srcs/docker-compose.yml --env-file srcs/.env up -d

dir:
	bash srcs/init_dir.sh

clean: down
	docker system prune -a

fclean: down
	docker system prune --all --force --volumes
	docker network prune --force
	docker volume prune --force
	bash srcs/init_dir.sh --delete

.PHONY	: all build down re clean fclean dir