SRCS = srcs
VOLUME = inception

all: dir
	@sudo -E docker-compose -f ./${SRCS}/docker-compose.yml up -d

build: dir
	@sudo -E docker-compose -f ./${SRCS}/docker-compose.yml up -d --build

down:
	@sudo -E docker-compose -f ./${SRCS}/docker-compose.yml down -v

re: clean
	@sudo -E docker-compose -f ./${SRCS}/docker-compose.yml up -d

dir:
	@sudo -E bash ${SRCS}/init_dir.sh

clean: down
	@sudo -E docker image ls | grep '${SRCS}-' | awk '{print $$1}' | xargs docker image rm
	
fclean: down
	@sudo -E docker image ls | grep '${SRCS}-' | awk '{print $$1}' | xargs docker image rm
	@sudo -E docker builder prune --force
	@sudo -E docker network prune --force
	@sudo -E docker volume prune --force
	@sudo -E bash ${SRCS}/init_dir.sh ${VOLUME} --delete

.PHONY	: all build down re clean fclean dir