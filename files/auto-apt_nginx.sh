#!/bin/bash -e

cd "/tmp/nginx/nginx-1.13.9" &&

sudo auto-apt run ./configure \
    --prefix=/usr/share/nginx \
    --sbin-path=/usr/sbin/nginx \
    --conf-path=/etc/nginx/nginx.conf \
    --http-log-path=/var/log/nginx/access.log \
    --error-log-path=/var/log/nginx/error.log \
    --lock-path=/var/lock/nginx.lock \
    --pid-path=/run/nginx.pid \
    --modules-path=/usr/lib/nginx/modules \
    --http-client-body-temp-path=/var/lib/nginx/body \
    --http-fastcgi-temp-path=/var/lib/nginx/fastcgi \
    --http-proxy-temp-path=/var/lib/nginx/proxy \
    --http-scgi-temp-path=/var/lib/nginx/scgi \
    --http-uwsgi-temp-path=/var/lib/nginx/uwsgi \
    --with-debug \
    --with-pcre-jit \
    --with-http_ssl_module \
    --with-http_stub_status_module \
    --with-http_realip_module \
    --with-http_auth_request_module \
    --with-http_dav_module \
    --with-http_slice_module \
    --with-threads \
    --with-http_addition_module \
    --with-http_geoip_module=dynamic \
    --with-http_gunzip_module \
    --with-http_gzip_static_module \
    --with-http_image_filter_module=dynamic \
    --with-http_sub_module \
    --with-http_xslt_module=dynamic \
    --with-stream=dynamic \
    --with-stream_ssl_module \
    --with-mail=dynamic \
    --with-mail_ssl_module \
            --add-module=../ngx_http_auth_pam_module \
        --add-module=../ngx-fancyindex \
        --with-http_v2_module

sudo make &&
sudo checkinstall -y \
    --maintainer root \
    --pkgname nginx \
    --pkgversion nginx-1.13.9 \
    --pakdir /tmp/nginx
