FROM php:5.6.31-cli
LABEL maintainer "Raphaël Droz <raphael.droz@gmail.com>"
EXPOSE 9222

# Note: track https://git.alpinelinux.org/cgit/aports/log/community/chromium
# for Chromium 60 then switch to Alpine and use php* dist packages

ENV DEBIAN_FRONTEND=noninteractive
ENV HOME=/data DEBUG_ADDRESS=0.0.0.0 DEBUG_PORT=9222

# most "static" chrome headless part
RUN apt-get update -qqy && apt-get -qqy install curl \
    && curl -s https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" | tee /etc/apt/sources.list.d/google.list \
    && apt-get -qqy update \
    && apt-get -qqy --no-install-recommends install sudo ca-certificates apt-transport-https git unzip

# Chrome deps' (should not move often, keep it in the initial step of container build)
RUN apt-get install -qqy $(LANG=C apt-cache depends google-chrome-beta | awk '$1~/Depends/{printf $2" "}')

# wp-cli/WordPress testsuite dep'. xsltproc is useful for WP XHR dumps
RUN apt-get install -qqy zip unzip subversion mysql-client libmysqlclient-dev xsltproc 

# most "static" npm/uglify-es part
RUN apt-get install -qqy npm
RUN HOME=/root npm install uglify-es -g

# composer/behat/phpunit/phpcs part
RUN apt-get -qqy --no-install-recommends install git wget make sed \
    && echo "date.timezone = Europe/Paris" | tee /usr/local/etc/php/conf.d/test.ini \
    && curl -sSLo /usr/local/bin/composer https://getcomposer.org/download/1.4.2/composer.phar \
    && chmod 755 /usr/local/bin/composer \
    && curl -sSLo /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-5.7.phar \
    && chmod 755 /usr/local/bin/phpunit \
    && curl -sSLo /usr/local/bin/phpcs https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar \
    && chmod 755 /usr/local/bin/phpcs \
    && curl -sSLo /usr/local/bin/phpcbf https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar \
    && chmod 755 /usr/local/bin/phpcbf \
    && curl -sSLo /usr/local/bin/wp https://github.com/wp-cli/wp-cli/releases/download/v1.2.1/wp-cli-1.2.1.phar \
    && chmod 755 /usr/local/bin/wp \
    && curl -sSLo /usr/local/bin/behat https://github.com/Behat/Behat/releases/download/v3.3.0/behat.phar \
    && chmod 755 /usr/local/bin/behat

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
