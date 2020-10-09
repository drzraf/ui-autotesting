Build a docker image for an user interface automatic testing [Docker Hub](https://hub.docker.com/r/drzraf/ui-autotesting/)

* based on official:
  * [Alpine 3.12](https://pkgs.alpinelinux.org/package/v3.12/community/x86/php7)
  * [php:7.3-cli](https://github.com/docker-library/php/blob/master/5.6/Dockerfile)
  * Jessie's [php:5.6.31-cli](https://github.com/docker-library/php/blob/master/5.6/Dockerfile)
* [chrome-headless][https://pkgs.alpinelinux.org/package/v3.12/community/aarch64/chromium) 83
* [firefox-headless](https://pkgs.alpinelinux.org/package/v3.12/community/aarch64/firefox) 81
* composer, phpunit, phpcs
* [preloaded](./composer.json) composer projects
  * behat+[mink](http://mink.behat.org/en/latest/)+html-formatter
  * [behat-mink](https://gitlab.com/DMore/behat-chrome-extension) Chrome extension
* Wordpress [wp-cli](http://wp-cli.org/)
* [uglify-js](https://github.com/mishoo/UglifyJS2/tree/harmony) (uglify-es)
* xsltproc, xpath, jq
* svn, git, unzip, make & curl

Other flavors/images:
* webpack: just webpack
