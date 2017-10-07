all: php*/Dockerfile

DEPS = Dockerfile.template composer.json start.sh

php5/Dockerfile: $(DEPS)
	sed -e 1i'# This file is autogenerated from update.sh' \
	    -e 's!$$PHP_VERSION!5.6.31-cli!' \
	    -e 's!$$PHPUNIT_VERSION!5.7!' Dockerfile.template >| php5/Dockerfile
	cp composer.json start.sh php5/

php7/Dockerfile: $(DEPS)
	sed -e 1i'# This file is autogenerated from update.sh' \
	    -e 's!$$PHP_VERSION!7.1.10-cli!' \
	    -e 's!$$PHPUNIT_VERSION!6.4.1!' \
	    Dockerfile.template >| php7/Dockerfile
	cp composer.json start.sh php7/


