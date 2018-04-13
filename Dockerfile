FROM centos/httpd
WORKDIR /usr/src/app

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime


RUN set -ex;\
    tar -xzf mod_encoding-20021209.tar.gz;\
    cd mod_encoding-20021209 ;\
    patch -p0 < ../mod_encoding.c-apache2.2-20060520.patch