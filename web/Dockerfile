FROM python:3.5-alpine

# Ensure that Python outputs everything that's printed inside
# the application rather than buffering it.
ENV PYTHONUNBUFFERED=1

# Creation of the workdir
RUN mkdir /code

WORKDIR /code

# Add create super user
ADD /bin/install.sh install.sh
RUN chmod +x install.sh

# Add requirements.txt file to container
ADD requirements.txt /code/

# Install extra libs for mysql
RUN apk add --no-cache --virtual .build-deps py3-pip python3-dev musl-dev gcc mariadb-dev mysql-client alpine-sdk nodejs nodejs-npm

# Update pip
RUN pip install --upgrade pip

# Install requirements
RUN pip install --no-cache-dir -r /code/requirements.txt

# Add the current directory(the web folder) to Docker container
ADD . /code/

# Install Gulp Global and Packages
RUN  npm i npm@latest -g && npm install -g gulp
RUN  npm install --no-audit