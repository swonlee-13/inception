FROM debian:buster

WORKDIR /app

RUN apt update && apt upgrade -y && \
	apt install python3 python3-pip python3-venv -y

COPY . .

EXPOSE 9090
	
RUN chmod +x ./run.sh

ENTRYPOINT ["./run.sh"]