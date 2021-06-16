#!/bin/bash -eu

nginx -g 'daemon off;' &
NGINX_PID=$!

find /etc/nginx -name '*.conf' | entr -n -d nginx -s reload &
WATCH_PID=$!

trap "kill $WATCH_PID; kill $NGINX_PID;" QUIT

wait
