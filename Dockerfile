FROM python:3-alpine
LABEL maintainer Zach Valenta
ENV PYTHONDONTWRITEBYTECODE 1
COPY . /docker-flask-skeleton
WORKDIR /docker-flask-skeleton
RUN python -m pip install -r requirements.txt
CMD flask run --host 0.0.0.0
