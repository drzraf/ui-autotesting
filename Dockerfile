FROM php:5.6.31-cli
LABEL maintainer "Raphaël Droz <raphael.droz@gmail.com>"
EXPOSE 9222

ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/data DEBUG_ADDRESS=0.0.0.0 DEBUG_PORT=9222

# most "static" chrome headless part
RUN apt-get update -qqy && apt-get -qqy install curl \
    && curl -s https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list \
    && apt-get -qqy update \
    && apt-get -qqy --no-install-recommends install sudo ca-certificates apt-transport-https git unzip

RUN apt-get install -qqy $(LANG=C apt-cache depends google-chrome-beta | awk '$1~/Depends/{printf $2" "}')

# most "static" npm/uglify2 part
RUN apt-get install -qqy npm
RUN HOME=/root npm install uglify-js-harmony -g

# composer/behat part
RUN apt-get -qqy --no-install-recommends install git unzip wget make sed \
    && echo "date.timezone = Europe/Paris" | tee /usr/local/etc/php/conf.d/test.ini \
    && curl -s https://getcomposer.org/download/1.4.2/composer.phar -o /usr/local/bin/composer \
    && chmod +x /usr/local/bin/composer

ADD composer.json /
RUN composer --no-ansi install



ENV CHROME_VERSION=60.0.3112.78-1
RUN apt-get update -qqy && apt-get install -y --no-install-recommends google-chrome-beta

RUN apt-get -qqy --no-install-recommends install localepurge \
  && sed -ri -e '/^(USE_DPKG|NEEDSCONFIGFIRST)/d' -e '$afr' -e '$aen' /etc/locale.nopurge \
  && localepurge
RUN rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN google-chrome-beta --version

ADD start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh

VOLUME /data
CMD ["/usr/bin/start.sh"]
