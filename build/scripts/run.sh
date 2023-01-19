#!/bin/bash
set -e
sed -i "s/\${APACHE_SERVER_NAME}/$APACHE_SERVER_NAME/g" /etc/shibboleth/shibboleth2.xml
/etc/init.d/shibd start

# Start Apache (in foreground)
# Apache gets grumpy about PID files pre-existing
rm -f /usr/local/apache2/logs/httpd.pid

exec httpd -DFOREGROUND "$@"
