FROM httpd:2-bullseye

COPY build/conf/httpd/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY build/conf/auth/shibboleth2.xml /etc/shibboleth/
COPY build/conf/auth/attribute-map.xml /etc/shibboleth/

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    libapache2-mod-shib && \
  rm -r /var/lib/apt/lists/* && \
  cd /etc/shibboleth/ && \
  shib-keygen
