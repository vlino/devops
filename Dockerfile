FROM python:2
ARG request_domain

MAINTAINER Equipe Aguia

# Environment
ENV SRV_HOST=$request_domain
ENV WEB_PORT=5000
ENV FLASK_APP="run.py"
ENV FLASK_DEBUG=1

# Prepare app directory
COPY  . /usr/src/devops
WORKDIR /usr/src/devops

# Set local time
#RUN ln -fs /usr/share/zoneinfo/America/Maceio /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata

# Set configs
#apt-get update
#apt-get install python-pip python-dev nginx
#pip install virtualenv
#mkdir ./build
#cd ./build
#virtualenv build/
#source build/bin/activate
#pip install uwsgi flask

# Install dependences
RUN pip install --upgrade pip \
 && pip install --no-cache-dir -r requirements.txt \
 && pip install Flask

# Set Database configs

# Build the app
#RUN flask run build
#uwsgi --socket 0.0.0.0:8000 --protocol=http -w run
#deactivate

###nano ~/myproject/myproject.ini
#[uwsgi]
#module = wsgi
#
#master = true
#processes = 5
#
#socket = myproject.sock
#chmod-socket = 660
#vacuum = true
#
#die-on-term = true

###sudo nano /etc/init/myproject.conf
#description "uWSGI server instance configured to serve myproject"
#
#start on runlevel [2345]
#stop on runlevel [!2345]
#
#setuid user
#setgid www-data
#
#env PATH=/home/user/myproject/myprojectenv/bin
#chdir /home/user/myproject
#exec uwsgi --ini myproject.ini

###sudo start myproject

# Install web server and publish built files
#RUN apt-get -y update && apt-get -y install nginx
#RUN dpkg -i ./nginx/*.deb && rm -rf ./nginx \
# && sed -i "s%try_files \$uri \$uri/ =404;%try_files \$uri \$uri/ /index.html?\$args;%g" /etc/nginx/sites-available/default \
# && rm -rf /var/www/html/* && cp -R ./build/* /var/www/html/

#RUN sed -i "s%listen 80 default_server;%listen "${WEB_PORT}" default_server;%g" /etc/nginx/sites-available/default
#RUN sed -i '1,15d;18d' /etc/nginx/sites-available/default

###sudo nano /etc/nginx/sites-available/myproject
#server {
#    listen 80;
#    server_name server_domain_or_IP;
#
#    location / {
#        include uwsgi_params;
#        uwsgi_pass unix:/home/user/myproject/myproject.sock;
#    }
#}

###sudo ln -s /etc/nginx/sites-available/myproject /etc/nginx/sites-enabled
###sudo nginx -t
###sudo service nginx restart

# Expose the app port
#EXPOSE ${WEB_PORT}
EXPOSE 5000

# Start the app
#ENTRYPOINT service nginx start && /bin/bash
ENTRYPOINT flask run ; bash

## docker build --build-arg request_domain=`hostname | sed 's/ .*//'` -t devops_image devops/
## docker run -tid -p 5000:5000 --name devops devops_image
####                                         --link mysql_operacional:mysql
## docker stop devops && docker rm devops && docker rmi devops_image
## docker logs --follow devops
## docker exec -ti devops bash

#>#># docker run --name devops_mysql --restart=always -e MYSQL_DATABASE=devops -e MYSQL_ROOT_PASSWORD="pass" -d mariadb:latest
