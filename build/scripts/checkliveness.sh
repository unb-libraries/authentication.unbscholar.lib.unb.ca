#!/usr/bin/env bash
# Check shibboleth SP.
STATUSCODE=$(curl --silent --insecure --output /dev/null --write-out "%{http_code}" https://localhost/Shibboleth.sso/Status)
if test $STATUSCODE -ne 200; then
  echo 'Shibboleth SP error!'
  exit 1
fi

# Check connection to DSpace.
STATUSCODE=$(curl --silent --insecure --output /dev/null --write-out "%{http_code}" https://localhost/server/api)
if test $STATUSCODE -ne 200; then
  echo 'Error proxying to DSpace!'
  exit 1
fi
