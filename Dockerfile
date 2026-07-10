FROM httpd:2-bullseye

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

ARG BUILD_DATE
ARG VCS_REF
ARG VERSION
LABEL ca.unb.lib.generator="apache2" \
  org.opencontainers.image.title="authentication.unbscholar.lib.unb.ca" \
  org.opencontainers.image.description="authentication.unbscholar.lib.unb.ca is the outward facing proxy for shibboleth auth to unbscholar.lib.unb.ca." \
  org.opencontainers.image.authors="UNB Libraries <libsupport@unb.ca>" \
  org.opencontainers.image.url="https://github.com/unb-libraries/authentication.unbscholar.lib.unb.ca" \
  org.opencontainers.image.source="https://github.com/unb-libraries/authentication.unbscholar.lib.unb.ca" \
  org.opencontainers.image.version="$VERSION" \
  org.opencontainers.image.revision="$VCS_REF" \
  org.opencontainers.image.created="$BUILD_DATE"
