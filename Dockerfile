FROM python:2

MAINTAINER Equipe Aguia

# Environment
ENV FLASK_APP="run.py"
ENV FLASK_DEBUG=1

# Prepare app directory
COPY  . /usr/src/devops
WORKDIR /usr/src/devops

# Install dependences
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt

# Expose the app port
EXPOSE 5000

# Start the app
ENTRYPOINT flask run --host=0.0.0.0 ; bash

## alias docker='sudo docker'
## alias docker-compose='sudo docker-compose'
## curl 127.0.0.1:5000 -v

## docker run --name devops_redis -p 6379:6379 -d redis:alpine
## docker stop devops_redis && docker rm devops_redis
##
## docker build -t devops_web devops/
## docker run -d -ti -p 5000:5000 --name devops devops_web
## --link
## docker stop devops && docker rm devops && docker rmi devops_web
## docker logs --follow devops
## docker exec -ti devops bash

#X docker-compose build
## docker-compose up -d
## docker-compose down --volumes && docker rmi devops_web
## docker-compose logs --follow web
## docker-compose exec web bash

#### The new volumes key mounts the project directory (current directory) on the host to /code inside the container, allowing you to modify the code on the fly, without having to rebuild the image.