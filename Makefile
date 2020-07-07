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
	@echo "image:       build image"
	@echo "start:       start container"
	@echo "stop:        stop container"
	@echo "restart:     restart container"
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
	source venv/bin/activate; export FLASK_APP=app; export FLASK_ENV=development; flask run

hc:
	http http://localhost:5000/healthcheck

#
# 🚢 DOCKER
#

image:
	docker build -t $(name) .

start:
	docker run --name $(name) -p 5000:5000 $(name)

stop:
	docker stop $(name); docker ps -a

restart:
	docker start $(name); docker logs $(name) --follow

#
# 📦 DEPENDENCIES
#

export:
	poetry export -f requirements.txt > requirements.txt

env:
	poetry env info

deps:
	poetry show --tree --no-dev
