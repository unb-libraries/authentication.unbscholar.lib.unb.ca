#!/bin/sh

if [ "$DEPLOY_ENV" = "local" ]; then
  # Delete all references to SSL in the apache conf.
  sed -i '/^SSL/d' /usr/local/apache2/conf/httpd.conf
  # Listen on the default port.
  sed -i "s|Listen 443|Listen 80|g" /usr/local/apache2/conf/httpd.conf
fi

/etc/init.d/shibd start
/usr/local/bin/httpd-foreground
