FROM httpd:2-bullseye
MAINTAINER UNB Libraries <libsupport@unb.ca>

COPY build /build

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    ca-certificates \
    libapache2-mod-shib \
    ssl-cert && \
  rm -r /var/lib/apt/lists/* && \
  mkdir -p /usr/local/apache2/keys && \
  mv /build/conf/httpd/httpd.conf /usr/local/apache2/conf/httpd.conf && \
  mv /build/conf/auth/shibboleth2.xml /etc/shibboleth/ && \
  mv /build/conf/auth/attribute-map.xml /etc/shibboleth/ && \
  cd /etc/shibboleth/ && \
  shib-keygen && \
  mv /build/scripts /scripts

ENTRYPOINT ["/scripts/run.sh"]

LABEL ca.unb.lib.generator="apache2" \
  org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.description="authentication.unbscholar.lib.unb.ca is the outward facing proxy for shibboleth auth to unbscholar.lib.unb.ca." \
  org.label-schema.name="authentication.unbscholar.lib.unb.ca" \
  org.label-schema.url="https://github.com/unb-libraries/authentication.unbscholar.lib.unb.ca" \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.vcs-url="https://github.com/unb-libraries/authentication.unbscholar.lib.unb.ca" \
  org.label-schema.version=$VERSION \
  org.opencontainers.image.source="https://github.com/unb-libraries/authentication.unbscholar.lib.unb.ca"
