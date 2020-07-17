# overview

The bare bones to Dockerize Flask.

## why does this exist?

Most 'hello world' examples of a Dockerized Flask app suffer from one of these problems:

* They're not actually 'hello world'; they add gunicorn, a database setup, a REST framework. In other words, more stuff to debug when you just want to get started with Docker.
* They use the old way of initializing a Flask app (i.e. `if __name__ == '__main__:'`), which harkens from when Flask still didn't have a major version released (prior to 2018).

This repo, on the other hand, aims to be a minimal, viable, and complete, and nothing more.

## how to run?

To run as a container, have DockerCE installed and use the `Makefile`:

```sh
# create image
make build

# run container using image
make start

# hit Flask server healthcheck
make hc

# stop container
make stop
```

Of course, you can still work with the app locally (outside of a container, on your own operating system) using a virtual environment:

```sh
# create virtual environment
python3 -m venv venv

# activate virtual environment
source venv/bin/activate

# update base dependencies
pip install -q --upgrade pip setuptools wheel

# install Flask
pip install flask

# hit Flask server running on your OS
make flask
```

## FYI

I have [another branch that uses Poetry for dependency management](https://github.com/zachvalenta/docker-flask-skeleton/tree/poetry).

Here's the full list of projects I have in this vein:

* [base: Docker + Flask](https://github.com/zachvalenta/docker-flask)
* [base + config management](https://github.com/zachvalenta/docker-flask-envs-secrets)
* [base + config management + SQLite](https://github.com/zachvalenta/docker-flask-sqlite)
* [base + config management + SQLite + gunicorn](https://github.com/zachvalenta/docker-flask-sqlite-gunicorn-config)
* [base + SQLite](https://github.com/zachvalenta/docker-flask-sqlite)
* [base + SQLite + gunicorn](https://github.com/zachvalenta/docker-flask-sqlite-gunicorn)
* [base + Postgres](https://github.com/zachvalenta/docker-flask-postgres)

Here are the Docker versions I'm working with:

```sh
$ docker --version  # Docker version 18.09.2, build 6247962
$ docker-compose --version  # docker-compose version 1.23.2, build 1110ad01
$ docker-machine --version  # docker-machine version 0.16.1, build cce350d7
```
