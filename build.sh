#!/usr/bin/bash
set -ex

cd mod_encoding
tar -xzf mod_encoding-20021209.tar.gz

cd mod_encoding-20021209
yes | cp -rf ../mod_encoding.c.apache2.20040616 mod_encoding.c
patch -p0 < ../mod_encoding.c-apache2.2-20060520.patch

cd lib
./configure --prefix=/usr
make
make install
ldconfig

cd ../
./configure --with-apxs=/usr/bin/apxs --with-iconv-hook=/usr/include
make

gcc -shared -o mod_encoding.so mod_encoding.o -W -Wall -Llib -liconv_hook
cp mod_encoding.so /etc/httpd/modules