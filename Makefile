SRCS = srcs
VOLUME = inception
DOCKER_COMPOSE := $(shell command -v docker-compose || echo "docker compose")

all: dir
	sudo -E $(DOCKER_COMPOSE) -f ./${SRCS}/docker-compose.yml up -d

build: dir
	@sudo -E $(DOCKER_COMPOSE) -f ./${SRCS}/docker-compose.yml up -d --build

down:
	@sudo -E $(DOCKER_COMPOSE) -f ./${SRCS}/docker-compose.yml down -v

re: clean
	@sudo -E $(DOCKER_COMPOSE) -f ./${SRCS}/docker-compose.yml up -d

dir:
	@bash ${SRCS}/init_dir.sh $(VOLUME)

clean: down
	@sudo -E docker image ls | grep '${SRCS}-' | awk '{print $$1}' | xargs docker image rm

fclean: down
	@sudo -E docker image ls | grep '${SRCS}-' | awk '{print $$1}' | xargs docker image rm
	@sudo -E docker builder prune --force
	@sudo -E docker network prune --force
	@sudo -E docker volume prune --force
	@bash ${SRCS}/init_dir.sh $(VOLUME) --delete

.PHONY	: all build down re clean fclean dir