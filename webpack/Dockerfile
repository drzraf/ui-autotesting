FROM node:12-alpine
MAINTAINER Raphaël Droz <raphael.droz@gmail.com>

RUN apk add --no-cache bash wget curl git make sed nano python3 && npm install -g webpack webpack-dev-server uglify-es bower gulp
ENV PYTHON=python3

VOLUME /app
EXPOSE 3000
WORKDIR /app
