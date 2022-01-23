#!/bin/bash
#init
function pause(){
 read -p "$*"
}
echo '
***********************************************************
* This Action it will take about 35-50 minutes            *
* And will be install the PHP 7.0.33 and 8.0.2 versions   *
* Total your server will have 6 diferent PHP versions the *
* Curent php version plus 7.0.33, 7.1.26, 7.2.14, 7.3.27, *
* 7.4.15 & 8.0.2.                                         *
* << If you agree Please wait until this script Finish    *
*    or else control/Z now and stop the Execution   >>    *
*********************************************************** 
'

##pause  'Press [Enter] key to continue...'
echo '
**********************************************************
****                                                  ****
****        STARTING INSTALLING LIBRARIES             ****
****                                                  ****
**********************************************************
'
apt-get update
apt-get --yes --force-yes install libxml2-dev 
apt-get --yes --force-yes install libssl-dev 
apt-get --yes --force-yes install libcurl4-openssl-dev 
apt-get --yes --force-yes install pkg-config 
apt-get --yes --force-yes install libcurl4-gnutls-dev
apt-get --yes --force-yes install libpcre3-dev
apt-get --yes --force-yes install libfreetype6-dev
apt-get --yes --force-yes install libgd2-xpm-dev
apt-get --yes --force-yes install libmysqlclient-dev
apt-get --yes --force-yes install libsasl2-dev
apt-get --yes --force-yes install libmhash-dev
apt-get --yes --force-yes install unixodbc-dev
apt-get --yes --force-yes install freetds-dev
apt-get --yes --force-yes install libpspell-dev
apt-get --yes --force-yes install libsnmp-dev
apt-get --yes --force-yes install libmcrypt-dev
apt-get --yes --force-yes install libxpm-dev 
apt-get --yes --force-yes install libjpeg-dev 
apt-get --yes --force-yes install libdb4.8-dev
apt-get --yes --force-yes install libbz2-dev
apt-get --yes --force-yes install libpng12-dev 
apt-get --yes --force-yes install libmysqlclient-dev 
apt-get --yes --force-yes install libapache2-mod-fastcgi 
apt-get --yes --force-yes install apache2-mpm-worker
apt-get --yes --force-yes install libcurl4-openssl-dev
apt-get --yes --force-yes install sqlite3 libsqlite3-dev
apt-get --yes --force-yes install libonig-dev
apt-get --yes --force-yes install ruby
gem     --yes --force-yes install oniguruma
apt-get --yes --force-yes install git 
a2enmod actions
service apache2 restart

wget https://nih.at/libzip/libzip-1.2.0.tar.gz
tar -zxvf libzip-1.2.0.tar.gz
cd libzip-1.2.0
./configure
make && make install

##pause  'Press [Enter] key to Set up the PHP Farm...'
echo '
**********************************************************
****                                                  ****
****         STARTING PHP FARM SETUP                  ****
****                                                  ****
**********************************************************
'

cd /opt
git clone https://github.com/malayy2k/phpfarm.git

cd /opt/phpfarm/src



mv /opt/phpfarm/src/options.sh /opt/phpfarm/src/option.sh_old

echo '#!/bin/bash

version=$1
vmajor=$2
vminor=$3
vpatch=$4

#gcov='--enable-gcov'

configoptions="\
--with-apache\
--with-apache_hooks\
--with-apache2filter\
--with-apache2handler\
--enable-short-tags \
--with-pear \
--enable-gd-native-ttf \
--enable-short-tags \
--enable-bcmath \
--enable-calendar \
--enable-exif \
--enable-ftp \
--enable-mbstring \
--enable-pcntl \
--enable-soap \
--enable-sockets \
--enable-wddx \
--enable-zip \
--with-zlib \
--with-zlib-dir \
--with-gettext \
--enable-pdo \
--with-pdo-mysql \
--with-mysqli \
--enable-json \
--with-curl \
--with-hash \
--with-mcrypt \
--with-xmlrpc \
--with-gd \
--with-openssl \
--with-mysql \
--with-config-file-path=/opt/phpfarm/inst/php-$version/lib/ \
$gcov"

echo $version $vmajor $vminor $vpatch

custom="custom-options.sh"
[ -f $custom ] && source "$custom" $version $vmajor $vminor $vpatch
custom="custom-options-$vmajor.sh"
[ -f $custom ] && source "$custom" $version $vmajor $vminor $vpatch
custom="custom-options-$vmajor.$vminor.sh"
[ -f $custom ] && source "$custom" $version $vmajor $vminor $vpatch
custom="custom-options-$vmajor.$vminor.$vpatch.sh"
[ -f $custom ] && source "$custom" $version $vmajor $vminor $vpatch
' >  /opt/phpfarm/src/options.sh

chmod +x /opt/phpfarm/src/options.sh
chmod +x /opt/phpfarm/src/compile.sh
chmod +x /opt/phpfarm/src/pyrus.sh


##pause  'Press [Enter] key to Install the PHP 5.6.40 version...'
echo '
**********************************************************
****                                                  ****
****      STARTING PHP 5.6.40 INSTALLATION            ****
****                                                  ****
**********************************************************
'
./compile.sh 5.6.40

##pause  'Press [Enter] key to Install the PHP 7.0.33 version...'
echo '
**********************************************************
****                                                  ****
****     STARTING PHP 7.0.33 INSTALLATION             ****
****                                                  ****
**********************************************************
'
./compile.sh 7.0.33

##pause  'Press [Enter] key to Install the PHP 7.2.14 version...'
echo '
**********************************************************
****                                                  ****
****     STARTING PHP 7.1.26 INSTALLATION             ****
****                                                  ****
**********************************************************
'
./compile.sh 7.1.26

##pause  'Press [Enter] key to Install the PHP 7.3.27 version...'
echo '
**********************************************************
****                                                  ****
****     STARTING PHP 7.2.14 INSTALLATION             ****
****                                                  ****
**********************************************************
'
./compile.sh 7.2.14

##pause  'Press [Enter] key to Install the PHP 7.4.15 version...'
echo '
**********************************************************
****                                                  ****
****     STARTING PHP 7.3.27 INSTALLATION             ****
****                                                  ****
**********************************************************
'
./compile.sh 7.3.27

##pause  'Press [Enter] key to Install the PHP 7.4.27 version...'
echo '
**********************************************************
****                                                  ****
****     STARTING PHP 7.4.27 INSTALLATION             ****
****                                                  ****
**********************************************************
'
./compile.sh 7.4.27

##pause  'Press [Enter] key to Install the PHP 8.0.2 version...'
echo '
**********************************************************
****                                                  ****
****     STARTING PHP 8.0.2 INSTALLATION             ****
****                                                  ****
**********************************************************
'
./compile.sh 8.0.2

##pause  'Press [Enter] key to Configure the Server With The new PHP Versions...'
echo '
**********************************************************
****                                                  ****
****         STARTING  APACHE CONFIGURATION           ****
****                                                  ****
**********************************************************
'
cd /
service apache2 stop
rm -r /etc/apache2/mods-available/fastcgi.conf
echo "" > /etc/apache2/mods-available/fastcgi.conf

echo '<IfModule mod_fastcgi.c>
AddHandler fastcgi-script .fcgi
</IfModule>' > /etc/apache2/mods-available/fastcgi.conf

rm -rf /var/sentora/phpconfig
mkdir /var/sentora/phpconfig
chown www-data:www-data /var/sentora/phpconfig
chmod -R 0777 /var/sentora/phpconfig

sed -i -e '1iInclude /var/sentora/phpconfig/cgiConfig.conf' /etc/sentora/configs/apache/httpd.conf
sed -i -e '2iInclude /var/sentora/phpconfig/cgiPath.conf' /etc/sentora/configs/apache/httpd.conf

echo '<Directory /var/sentora/phpconfig/>
Require all granted
</Directory>' >  /var/sentora/phpconfig/cgiPath.conf

echo FastCgiServer /var/sentora/phpconfig/php-cgi-5.6.40 >> /var/sentora/phpconfig/cgiConfig.conf
echo FastCgiServer /var/sentora/phpconfig/php-cgi-7.0.30 > /var/sentora/phpconfig/cgiConfig.conf
echo FastCgiServer /var/sentora/phpconfig/php-cgi-7.1.26 > /var/sentora/phpconfig/cgiConfig.conf
echo FastCgiServer /var/sentora/phpconfig/php-cgi-7.2.14 > /var/sentora/phpconfig/cgiConfig.conf
echo FastCgiServer /var/sentora/phpconfig/php-cgi-7.3.27 > /var/sentora/phpconfig/cgiConfig.conf
echo FastCgiServer /var/sentora/phpconfig/php-cgi-8.0.2 > /var/sentora/phpconfig/cgiConfig.conf
echo ScriptAlias /cgi-bin-php/ /var/sentora/phpconfig/ >> /var/sentora/phpconfig/cgiConfig.conf


echo '#!/bin/sh
PHPRC="/etc/php/7.0/cgi/5.6.40/"
export PHPRC

PHP_FCGI_FCGI_CHILDREN=3
export PHP_FCGI_CHILDREN

PHP_FCGI_MAX_REQESTS=5000
export PHP_FCGI_MAX_REQUESTS

exec /opt/phpfarm/inst/bin/php-cgi-5.6.40' > /var/sentora/phpconfig/php-cgi-5.6.40

echo '#!/bin/sh
PHPRC="/etc/php/7.0/cgi/7.0.33/"
export PHPRC

PHP_FCGI_CHILDREN=3
export PHP_FCGI_CHILDREN

PHP_FCGI_MAX_REQUESTS=5000
export PHP_FCGI_MAX_REQUESTS

exec /opt/phpfarm/inst/bin/php-cgi-7.0.33' > /var/sentora/phpconfig/php-cgi-7.0.33

echo '#!/bin/sh
PHPRC="/etc/php/7.0/cgi/7.1.26/"
export PHPRC

PHP_FCGI_CHILDREN=3
export PHP_FCGI_CHILDREN

PHP_FCGI_MAX_REQUESTS=5000
export PHP_FCGI_MAX_REQUESTS

exec /opt/phpfarm/inst/bin/php-cgi-7.1.26' > /var/sentora/phpconfig/php-cgi-7.1.26

echo '#!/bin/sh
PHPRC="/etc/php/7.0/cgi/7.2.14/"
export PHPRC

PHP_FCGI_CHILDREN=3
export PHP_FCGI_CHILDREN

PHP_FCGI_MAX_REQUESTS=5000
export PHP_FCGI_MAX_REQUESTS

exec /opt/phpfarm/inst/bin/php-cgi-7.2.14' > /var/sentora/phpconfig/php-cgi-7.2.14

echo '#!/bin/sh
PHPRC="/etc/php/7.0/cgi/7.3.27/"
export PHPRC

PHP_FCGI_CHILDREN=3
export PHP_FCGI_CHILDREN

PHP_FCGI_MAX_REQUESTS=5000
export PHP_FCGI_MAX_REQUESTS

exec /opt/phpfarm/inst/bin/php-cgi-7.3.27' > /var/sentora/phpconfig/php-cgi-7.3.27

echo '#!/bin/sh
PHPRC="/etc/php/7.0/cgi/7.4.27/"
export PHPRC

PHP_FCGI_CHILDREN=3
export PHP_FCGI_CHILDREN

PHP_FCGI_MAX_REQUESTS=5000
export PHP_FCGI_MAX_REQUESTS

exec /opt/phpfarm/inst/bin/php-cgi-7.4.27' > /var/sentora/phpconfig/php-cgi-7.4.27

echo '#!/bin/sh
PHPRC="/etc/php/7.0/cgi/8.0.2/"
export PHPRC

PHP_FCGI_CHILDREN=3
export PHP_FCGI_CHILDREN

PHP_FCGI_MAX_REQUESTS=5000
export PHP_FCGI_MAX_REQUESTS

exec /opt/phpfarm/inst/bin/php-cgi-8.0.2' > /var/sentora/phpconfig/php-cgi-8.0.2

chown -R www-data:www-data /var/sentora/phpconfig
chmod -R +x /var/sentora/phpconfig/

service apache2 start


