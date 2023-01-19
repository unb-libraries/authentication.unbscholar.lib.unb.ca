FROM httpd:2-bullseye

COPY build /build

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    libapache2-mod-shib && \
  rm -r /var/lib/apt/lists/* && \
  mv /build/conf/httpd/httpd.conf /usr/local/apache2/conf/httpd.conf && \
  mv /build/conf/auth/shibboleth2.xml /etc/shibboleth/ && \
  mv /build/conf/auth/attribute-map.xml /etc/shibboleth/ && \
  cd /etc/shibboleth/ && \
  shib-keygen
