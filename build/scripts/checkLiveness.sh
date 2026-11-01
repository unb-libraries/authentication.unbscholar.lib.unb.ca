#!/usr/bin/env bash
# Liveness: is this pod's Shibboleth SP (Apache + shibd) answering? Only that. DSpace's health
# is not checked here: a liveness failure restarts this pod, which cannot fix DSpace, and would
# turn every DSpace restart into a restart loop of the auth pod as well.
STATUSCODE=$(curl --silent --max-time 2 --output /dev/null --write-out "%{http_code}" http://localhost/Shibboleth.sso/Status)
if [ "$STATUSCODE" != "200" ]; then
  echo "Shibboleth SP error! /Shibboleth.sso/Status answered ${STATUSCODE}"
  exit 1
fi
