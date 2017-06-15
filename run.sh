#!/bin/sh
set -e

DEPS_PACKAGES="php5-gd php5-mysql"
BUILD_PACKAGES="libzip-dev libssh2-1-dev"

ln -s ../mods-available/headers.load /etc/apache2/mods-enabled
ln -s ../mods-available/ssl.load /etc/apache2/mods-enabled
ln -s ../mods-available/rewrite.load /etc/apache2/mods-enabled

apt-get update
apt-get install -y $BUILD_PACKAGES $DEPS_PACKAGES

pecl config-set php_ini /etc/php5/apache2/conf.d/php.ini

yes | pecl install zip ssh2

docker-php-ext-install pdo_mysql

apt-get remove --purge -y $BUILD_PACKAGES && rm -rf /var/lib/apt/lists/*
apt-get clean
rm -rf /tmp/run.sh
