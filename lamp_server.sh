#!/bin/bash

echo "============================="
echo " Proses install lamp Server"
echo " Apache2, php, mysql"
echo "============================="
sudo apt-get update
sudo apt-get install -y lamp-server^
sudo a2enmod rewrite
sudo apt-get install -y php5 php5-curl php5-gd php5-mcrypt php5-mysql
sudo service apache2 restart
sudo apt-get install -y phpmyadmin
sudo php5enmod mcrypt
sudo service apache2 restart


sudo chown root:root /etc/phpmyadmin/ -R
sudo chown root:www-data /etc/phpmyadmin/config-db.php
sudo chown root:www-data /etc/phpmyadmin/htpasswd.setup
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf.d/phpmyadmin.conf
sudo /etc/init.d/apache2 reload
sudo ln -s /etc/phpmyadmin/apache.conf /etc/apache2/conf-enabled/phpmyadmin.conf
sudo /etc/init.d/apache2 reload
sudo service apache2 restart
sudo apt-get install unzip

echo "============================="
echo " Proses install lamp Server Selesai"
echo "============================="


echo "============================="
echo " Clone Landing page"
echo "============================="

rm -f master.zip
wget https://codeload.github.com/sdcilsy/landing-page/zip/refs/heads/master
sudo unzip master
sudo rm -R /var/www/$1/public_html/*
sudo rm -f /var/www/$1/public_html/*
sudo mv landing-page-master/* /var/www/$1/public_html
echo "=============================>"
echo "selesai"
echo "=============================>"
