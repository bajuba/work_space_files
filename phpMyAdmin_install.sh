#!/bin/bash
yum install php-mbstring -y
systemctl restart httpd
systemctl restart php-fpm
cd /var/www/html
wget https://files.phpmyadmin.net/phpMyAdmin/4.8.3/phpMyAdmin-4.8.3-all-languages.tar.gz
mkdir phpMyAdmin
chmod -R 755 phpMyAdmin
tar -xvzf phpMyAdmin-4.8.2-all-languages.tar.gz -C phpMyAdmin --strip-components 1
rm phpMyAdmin-4.8.2-all-languages.tar.gz
systemctl start mariadb
google-chrome --no-sandbox http://localhost/phpMyAdmin