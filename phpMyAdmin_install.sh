#!/bin/bash
yum install php-mbstring -y
systemctl restart httpd
systemctl restart php-fpm
cd /var/www/html
rm -R phpMyAdmin/
wget https://files.phpmyadmin.net/phpMyAdmin/4.8.3/phpMyAdmin-4.8.3-all-languages.tar.gz
mkdir phpMyAdmin
chmod -R 755 phpMyAdmin
tar -xvzf phpMyAdmin-4.8.3-all-languages.tar.gz -C phpMyAdmin --strip-components 1
rm phpMyAdmin-4.8.3-all-languages.tar.gz
echo "<?php phpinfo(); ?>" >> phpinfo.php
cd phpMyAdmin
mkdir tmp && chmod 777 tmp
systemctl start mariadb
google-chrome --no-sandbox http://localhost/phpinfo.php http://localhost/phpMyAdmin &
code config.inc.php --no-sandbox --user-data-dir &