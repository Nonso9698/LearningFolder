#!/bin/bash
cd /home/ubuntu/
echo "now in ubuntu home"
echo "now in ubuntu home and  about to update"
sudo apt update -y 
echo "updated and now about to start installing apache"
sudo apt -y install apache2 
echo "installed apache2 and now about to start  apache2"
sudo systemctl start apache2
echo "started apache2 and now about to enable  apache2" 
sudo systemctl enable apache2 
echo "enabled apache2 and now about to install wget"
sudo apt install wget -y 
echo "installed wget and now about to clone github"
sudo wget https://github.com/awanmbandi/google-cloud-projects/raw/jjtech-flix-app/jjtech-streaming-application-v1.zip 
echo "cloned github andnow about to install unzip"
sudo apt install unzip -y 
echo "installed unzip and now about to unzip cloned file"
sudo unzip jjtech-streaming-application-v1.zip 
echo "unzipped cloned file and now about to delete defalt html file"
sudo rm -f /var/www/html/index.html 
echo "deleted and now about to mv file to html folder"
sudo cp -rf jjtech-streaming-application-v1/* /var/www/html/
echo "commands done and server should be up yayyyyyy!!!!!!"