#!/bin/bash
sudo apt-get  install  -y apache2
cd ~
sudo a2enmod dav
sudo a2enmod dav_fs
sudo mkdir -p /var/www/webdav
sudo chown -R www-data:www-data  /var/www/webdav
sudo htpasswd -c /etc/apache2/webdav.password pi
sudo chown root:www-data /etc/apache2/webdav.password
sudo chmod 640 /etc/apache2/webdav.password
echo "Alias /webdav  /var/www/webdav" > /etc/apache2/sites-available/000-default.conf
echo " " >> /etc/apache2/sites-available/000-default.conf 
echo " " >> /etc/apache2/sites-available/000-default.conf 
echo "<Location /webdav>" >> /etc/apache2/sites-available/000-default.conf
echo "Options Indexes" >> /etc/apache2/sites-available/000-default.conf
echo "DAV On" >> /etc/apache2/sites-available/000-default.conf
echo " AuthType Basic" >> /etc/apache2/sites-available/000-default.conf
echo " AuthName "webdav" ">> /etc/apache2/sites-available/000-default.conf
echo " AuthUserFile /etc/apache2/webdav.password" >> /etc/apache2/sites-available/000-default.conf
echo " Require valid-user " >> /etc/apache2/sites-available/000-default.conf
echo " </Location> " >> /etc/apache2/sites-available/000-default.conf 
sudo systemctl restart apache2