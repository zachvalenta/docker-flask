FROM python:3-alpine
LABEL maintainer Zach Valenta
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
WORKDIR /docker-flask-skeleton
COPY requirements.txt /docker-flask-skeleton/
RUN python -m pip install -r requirements.txt
COPY . /docker-flask-skeleton
CMD flask run --host 0.0.0.0
