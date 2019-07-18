FROM python:3-alpine
COPY . /docker-flask-skeleton
WORKDIR /docker-flask-skeleton
RUN python -m pip install -r requirements.txt
CMD flask run --host 0.0.0.0
