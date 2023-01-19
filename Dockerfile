FROM ubuntu:20.04

COPY ./build /build

RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apache2 \
    openssl \
    libapache2-mod-shib2 && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /tmp/* && \
  a2enmod proxy proxy_ajp proxy_http shib && \
  mv /build/conf/apache2/unbscholar.dspace.lib.unb.ca.conf /etc/apache2/sites-available/unbscholar.dspace.lib.unb.ca.conf && \
  a2ensite unbscholar.dspace.lib.unb.ca.conf && \
  a2dissite 000-default.conf  && \


RUN mv /build/conf/auth/shibboleth2.xml /etc/shibboleth/ && \
  mv /build/conf/auth/attribute-map.xml /etc/shibboleth/ && \
  cd /etc/shibboleth/ && \
  shib-keygen && \
  mv /build/scripts /scripts

EXPOSE 80
ENTRYPOINT ["/scripts/run.sh"]
