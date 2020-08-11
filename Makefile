.PHONY: test
name = "docker-flask-skeleton"

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
	@echo "freeze:      freeze dependencies into requirements.txt"
	@echo "install:     install dependencies from requirements.txt"
	@echo "purge:       remove any installed pkg *not* in requirements.txt"
	@echo

#
# 🍶 FLASK
#

flask:
	source venv/bin/activate; export FLASK_APP=app; export FLASK_ENV=development; flask run

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
	docker exec -it $(name) bash

list:
	docker ps -a; docker images; docker volume ls

clean:
	docker ps -qa | xargs docker stop; docker system prune --volumes -f; docker image prune -af

#
# 📦 DEPENDENCIES
#

freeze:
	pip freeze > requirements.txt

install:
	pip install -r requirements.txt

purge:
	@echo "🔍 - DISCOVERING UNSAVED PACKAGES\n"
	pip freeze > pkgs-to-rm.txt
	@echo
	@echo "📦 - UNINSTALL ALL PACKAGES\n"
	pip uninstall -y -r pkgs-to-rm.txt
	@echo
	@echo "♻️  - REINSTALL SAVED PACKAGES\n"
	pip install -r requirements.txt
	@echo
	@echo "🗑  - UNSAVED PACKAGES REMOVED\n"
	diff pkgs-to-rm.txt requirements.txt | grep '<'
	@echo
	rm pkgs-to-rm.txt
	@echo
