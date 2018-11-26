FROM node:10-alpine
MAINTAINER Raphaël Droz <raphael.droz@gmail.com>

RUN apk add --no-cache bash wget curl git make sed nano && npm install -g webpack webpack-dev-server uglify-es bower gulp
VOLUME /app
EXPOSE 3000
WORKDIR /app
