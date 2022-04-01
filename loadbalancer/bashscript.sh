#!/bin/sh
echo ' } ' >> /etc/nginx/conf.d/default.conf.template
envsubst < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf && nginx -g 'daemon off;'