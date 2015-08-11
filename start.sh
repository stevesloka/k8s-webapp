#!/usr/bin/env bash

if [ -n "${API_SERVICE_HOST+1}" ]; then
  TARGET_API="${API_SERVICE_HOST}"
else
  TARGET_API="dermapi"
fi
if [ -n "${API_SERVICE_PORT+1}" ]; then
  TARGET_API="${TARGET_API}:${API_SERVICE_PORT}"
else
  TARGET_API="${TARGET_API}:8080"
fi

# Tell nginx the address and port of the service to proxy to
sed -i "s@replacemeapi@${TARGET_API}@g" /etc/nginx/conf.d/default.conf

echo "Starting nginx..."
nginx -g 'daemon off;'
