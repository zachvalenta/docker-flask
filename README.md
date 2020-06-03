# overview

The bare bones 🦴 to start your Dockerized 🚢 Flask 🍶 app 💻

## why (does this exist)?

Most 'hello world' examples of a Dockerized Flask app suffer from one of these problems:

* They're not actually 'hello world'; they add gunicorn, a database setup, a REST framework. In other words, more stuff to debug when you just want to get started.
* They use the old way of initializing a Flask app (i.e. `if __name__ == '__main__:'`), which harkens from when Flask still didn't have a major version released (back in 2018).

This repo, on the other hand, aims to be a minimal, viable, and complete, and nothing more.

## how (to run)?

To run as a container, have DockerCE installed and use the `Makefile`:

```sh
make image  # create image
make container  # run container using image
```

Of course, you can still work with the app locally outside of a container by using a virtual environment:
```sh
python3 -m venv venv
source venv/bin/activate
pip install -q --upgrade pip setuptools wheel
pip install flask
make flask
```
