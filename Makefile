.PHONY: test

name = "docker-flask"

help:
	@echo
	@echo "🍶 FLASK"
	@echo
	@echo "flask:       start app"
	@echo "hc:          healthcheck"
	@echo
	@echo "🚢 DOCKER"
	@echo
	@echo "build:       build image"
	@echo "rebuild:     rebuild image after stopping/removing containers of same name"
	@echo "start:       start container"
	@echo "stop:        stop container"
	@echo "restart:     restart container"
	@echo "rm:          remove container"
	@echo "shell:       open shell inside container"
	@echo "list:        list all containers/images/volumes"
	@echo "clean:       stop containers, rm all containers/images/volumes"
	@echo
	@echo "📦 DEPENDENCIES"
	@echo
	@echo "export:      export Poetry dependencies to requirements.txt"
	@echo "env:         show environment info"
	@echo "deps:        list prod dependencies"
	@echo

#
# 🍶 FLASK
#

flask:
	export FLASK_APP=app; export FLASK_ENV=development; poetry run flask run

hc:
	http http://localhost:5000/healthcheck

#
# 🚢 DOCKER
#

build:
	docker build -t $(name) .

rebuild: stop rm
	docker build -t $(name) .

start:
	docker run --name $(name) -p 5000:5000 $(name)

stop:
	docker stop $(name)

restart:
	docker start $(name); docker logs $(name) --follow

rm: stop
	docker rm $(name)

shell:
	docker exec -it $(name) sh

list:
	docker ps -a; docker images; docker volume ls

clean:
	docker ps -qa | xargs docker stop; docker system prune --volumes -f; docker image prune -af

#
# 📦 DEPENDENCIES
#

export:
	poetry export -f requirements.txt > requirements.txt

env:
	poetry env info

deps:
	poetry show --tree --no-dev
