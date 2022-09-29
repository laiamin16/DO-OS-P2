!/bin/bash
 
jawaban="Y"
 
read -p "Apakah kamu yakin akan menginstall webserver ? (Y/n) " pilih;
 
if [ $pilih == $jawaban ];
then
    echo "Menyiapkan Installasi Web server"
    sudo apt-get update
    echo "Melakukan Installasi Webserver"
    sudo apt-get install -y apache2 php php-mysql
    echo "Melakukan Installasi Database Server"
    sudo apt-get install -y mysql-server
    sudo apt-get install unzip
    echo "Installasi Selesai"
    echo "=============================>"
    echo "Downloading Data"
    echo "=============================>"
    cd
    wget https://github.com/WordPress/WordPress/archive/master.zip
    echo "=============================>"
    echo "Ekstrak File"
    echo "=============================>"
    unzip master.zip
    echo "=============================>"
    echo "Memindahkan data"
    echo "=============================>"
    sudo rm /var/www/html/*
    sudo rm -R /var/www/html/*
    sudo mv WordPress-master/* /var/www/html
     echo "=============================>"
    echo "Config Database"
    echo "=============================>"

   sudo mysql -u root -e "create database wordpress";

sudo mysql -u root wordpress < /var/www/html/dump.sql;

sudo mysql -u root -e "create user 'wordpress'@'localhost' identified by '1234567890'";

sudo mysql -u root -e "grant all privileges on *.* to 'wordpress'@'localhost'";
     
     
     

    echo "Setup selesai"
    exit 0
else
    echo "Installasi dibatalkan"
    exit 1
fi
