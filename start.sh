# Set the marketinghost
if [ -n "${marketinghost+1}" ]; then
  TARGET_MARKETINGHOST="${marketinghost}"
else
  TARGET_MARKETINGHOST="myupmclandingforbes.upmc.com"
fi

# Tell nginx the address and port of the service to proxy to
sed -i "s@dermapi@${TARGET_DERMAPI}@g" /etc/nginx/conf.d/default.confi

echo "Starting nginx..."
nginx -g 'daemon off;'
