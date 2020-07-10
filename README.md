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

I have a few other projects like this:

* [Docker + Flask + Postgres](https://github.com/zachvalenta/docker-flask-postgres)
* [Docker + Flask + SQLite](https://github.com/zachvalenta/docker-flask-sqlite)
* [Docker + Flask + SQLite + gunicorn](https://github.com/zachvalenta/docker-flask-sqlite-gunicorn)
* [Docker + Flask + configuration management](https://github.com/zachvalenta/docker-flask-envs-secrets)

Here are the Docker versions I'm working with:

```sh
$ docker --version  # Docker version 18.09.2, build 6247962
$ docker-compose --version  # docker-compose version 1.23.2, build 1110ad01
$ docker-machine --version  # docker-machine version 0.16.1, build cce350d7
```
