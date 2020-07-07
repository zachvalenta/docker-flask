FROM python:3-alpine
LABEL maintainer Zach Valenta
ARG project_name=docker-flask-skeleton
ENV PYTHONDONTWRITEBYTECODE 1
WORKDIR /$project_name
COPY requirements.txt /$project_name/
RUN python -m pip install -r requirements.txt
COPY . /$project_name
CMD flask run --host 0.0.0.0
