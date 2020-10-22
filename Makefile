.EXPORT_ALL_VARIABLES:
HOST_IP = $(shell ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0.1' | grep 192 | head -n 1)

stop-docker:
	docker-compose down -v

start-docker:
	export HOST_IP=$(HOST_IP) && \
		docker-compose up -d

dev: stop-docker start-docker
	mvn clean compile quarkus:dev
