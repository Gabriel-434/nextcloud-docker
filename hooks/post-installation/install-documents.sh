#!/bin/sh

php occ app:install richdocuments

php occ rich:setup --wopi-url "http://collabora:9980" --callback-url "http://nextcloud:80"
