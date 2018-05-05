FROM python:2

MAINTAINER Equipe Aguia

ENV FLASK_APP=web_app.py

COPY    . /usr/src/devops
WORKDIR . /usr/src/devops

RUN pip install Flask

EXPOSE 5000

ENTRYPOINT ["flask", "run"]
