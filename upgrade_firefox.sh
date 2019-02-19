#!/bin/bash -x

URL=https://download.mozilla.org/\?product\=firefox-latest-ssl\&amp\;os\=linux\&amp\;lang\=en-GB

FIREFOX_VERSION=$(\
  curl ${URL} 2> /dev/null | \
  egrep -o '[0-9]{2,}.[0-9]{1,}.[0-9]{1,}' | \
  tail -1
)

CURRENT_VERSION=$(cat /home/robin/.firefox_version 2> /dev/null || echo none)

echo current = ${CURRENT_VERSION} and latest is ${FIREFOX_VERSION}

echo ${FIREFOX_VERSION} > /home/robin/.firefox_version

if [[ ${CURRENT_VERSION} != ${FIREFOX_VERSION} ]]; then
  docker-compose build --build-arg firefox_version=${FIREFOX_VERSION} firefox
  curl -s \
    --form-string "token=${PO_TOKEN}" \
    --form-string "user=${PO_USER}" \
    --form-string "message=Upgraded Firefox to ${FIREFOX_VERSION}.  Restart the container." \
      https://api.pushover.net/1/messages.json
fi
