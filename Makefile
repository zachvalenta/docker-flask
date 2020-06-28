.PHONY: test

help:
	@echo
	@echo "🍶 FLASK"
	@echo
	@echo "flask:       start app"
	@echo "hc:          healthcheck"
	@echo
	@echo "🚢 DOCKER"
	@echo
	@echo "image:       build image"
	@echo "start:       start container"
	@echo "stop:        stop container"
	@echo "restart:     restart container"
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

image:
	docker build -t docker-flask-skeleton .

start:
	docker run --name docker-flask-skeleton -p 5000:5000 docker-flask-skeleton

stop:
	docker stop docker-flask-skeleton; docker ps -a

restart:
	docker restart docker-flask-skeleton; docker ps

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
