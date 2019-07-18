# overview

This is a skeleton from which to bootstrap a Dockerized Flask app.

To run as a container, have DockerCE installed and use the `Makefile`:

```sh
make image  # create image
make container  # run container using image
```

To run outside of a container, install Flask into a virtual environment and use the `Makefile`:

```sh
make flask  # start app
make index  # hit main app endpoint
```
