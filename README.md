Building a docker image for an user interface automatic testing ([Docker Hub](https://hub.docker.com/r/drzraf/ui-autotesting/)]

* based on [php:5.6.31-cli](https://github.com/docker-library/php/blob/master/5.6/Dockerfile)) (PHP 5.6 / Debian Jessie)
* [chrome-headless](https://developers.google.com/web/updates/2017/04/headless-chrome) 60
* [firefox-headless](https://developer.mozilla.org/en-US/Firefox/Headless_mode) 55 [later]
* composer, phpunit, phpcs
* [preloaded](./composer.json) composer projects
  * behat+[mink](http://mink.behat.org/en/latest/)+html-formatter
  * [behat-mink](https://gitlab.com/DMore/behat-chrome-extension) Chrome extension
* Wordpress [wp-cli](http://wp-cli.org/)
* [uglify-js](https://github.com/mishoo/UglifyJS2/tree/harmony) (uglify-es)
* xsltproc, jq
* svn, git, unzip, make & curl
