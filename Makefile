SRCS = srcs

all: dir
	@docker compose -f ./${SRCS}/docker-compose.yml up -d

build: dir
	@docker compose -f ./${SRCS}/docker-compose.yml up -d --build

down:
	@docker compose -f ./${SRCS}/docker-compose.yml down -v

re: clean
	@docker compose -f ./${SRCS}/docker-compose.yml up -d

dir:
	@bash ${SRCS}/init_dir.sh

clean: down
	@docker image ls | grep '${SRCS}-' | awk '{print $$1}' | xargs docker image rm
fclean: down
	@docker image ls | grep '${SRCS}-' | awk '{print $$1}' | xargs docker image rm
	@docker builder prune --force
	@docker network prune --force
	@docker volume prune --force
	@bash ${SRCS}/init_dir.sh --delete

.PHONY	: all build down re clean fclean dir