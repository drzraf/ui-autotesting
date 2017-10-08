FROM mhart/alpine-node:8

RUN HOME=/root npm install --production -g uglify-es
RUN ln -s /usr/lib/node_modules/uglify-es/bin/uglifyjs /usr/local/bin/uglifyjs && uglifyjs --version
