#!/bin/bash -e

cd "/tmp/nginx/pcre-8.41" &&

sudo auto-apt run ./configure &&
sudo make &&
sudo checkinstall -y \
    --maintainer root \
    --pkgname pcre \
    --pkgversion pcre-8.41 \
    --pakdir /tmp/nginx
