#!/bin/sh

php occ app:install richdocuments

if [ "$COLLABORA_SSL" = true ]; then
    COLLABORA_PROTOCOL="https"
else
    COLLABORA_PROTOCOL="http"
fi

php occ rich:setup --wopi-url "$COLLABORA_PROTOCOL://collabora:9980" --callback-url "http://nextcloud:80"
