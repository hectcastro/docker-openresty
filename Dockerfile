FROM openresty/openresty:alpine

RUN \
      addgroup -S nginx \
      && adduser -D -S -h /var/cache/nginx -s /sbin/nologin -G nginx nginx \
      && mkdir /usr/local/openresty/nginx/conf/conf.d/

COPY usr/local/openresty/nginx/conf/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY usr/local/openresty/nginx/conf/conf.d/nginx.vh.default.conf /usr/local/openresty/nginx/conf/conf.d/default.conf

EXPOSE 80 443
