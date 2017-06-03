#!/bin/bash

rm /private/etc/apache2/httpd.conf
cd apache
ln httpd.conf /private/etc/apache2/httpd.conf
cd ../

rm /private/etc/apache2/extra/httpd-vhosts.conf
cd apache
ln httpd-vhosts.conf /private/etc/apache2/extra/httpd-vhosts.conf
cd ../
