#!/bin/bash -x

URL=https://download.mozilla.org/\?product\=firefox-latest-ssl\&amp\;os\=linux\&amp\;lang\=en-GB

FIREFOX_VERSION=$(\
  curl ${URL} 2> /dev/null | \
  grep -Po '(?<=releases/)[^\/]+' | \
  tail -1
)

CURRENT_VERSION=$(cat /home/roridler/.firefox_version 2> /dev/null || echo none)

BASEDIR=$(dirname "$0")

echo current = ${CURRENT_VERSION} and latest is ${FIREFOX_VERSION}

echo ${FIREFOX_VERSION} > /home/roridler/.firefox_version

if [[ ${CURRENT_VERSION} != ${FIREFOX_VERSION} ]]; then
  cd $BASEDIR
  podman build -t firefox \
               -f firefox/Dockerfile \
               --build-arg firefox_version=${FIREFOX_VERSION} \
               --build-arg firefox_locale=en-GB \
               firefox
  curl -s \
    --form-string "token=${PO_TOKEN}" \
    --form-string "user=${PO_USER}" \
    --form-string "message=Upgraded Firefox to ${FIREFOX_VERSION} from ${CURRENT_VERSION}.  Restart the container." \
      https://api.pushover.net/1/messages.json
fi
