#!/bin/bash

sudo rm /private/etc/apache2/httpd.conf
cd apache
sudo ln httpd.conf /private/etc/apache2/httpd.conf
cd ../

sudo rm /private/etc/apache2/extra/httpd-vhosts.conf
cd apache
sudo ln httpd-vhosts.conf /private/etc/apache2/extra/httpd-vhosts.conf
cd ../

sudo rm -rf ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/
cd ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/
ln -s ~/Documents/dotfiles/config/sublime User
