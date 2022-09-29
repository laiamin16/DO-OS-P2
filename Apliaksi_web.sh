#!/bin/bash
 
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
    echo "Installasi Selesai"
    echo "=============================>"
    echo "Downloading Data"
    echo "=============================>"
    cd
    wget https://github.com/sdcilsy/sosial-media/archive/master.zip
    echo "=============================>"
    echo "Ekstrak File"
    echo "=============================>"
    unzip master.zip
    echo "=============================>"
    echo "Memindahkan data"
    echo "=============================>"
    sudo rm /var/www/html/*
    sudo rm -R /var/www/html/*
    sudo mv sosial-media-master/* /var/www/html
    echo "Setup selesai"
    exit 0
else
    echo "Installasi dibatalkan"
    exit 1
fi
