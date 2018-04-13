FROM centos/httpd

WORKDIR /usr/src/app

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN yum install -y git gcc make patch httpd-devel openssl-devel libzip-devel

COPY ./mod_encoding mod_encoding

COPY ./build_mod_encoding.sh build_mod_encoding.sh
RUN chmod a+x build_mod_encoding.sh && ./build_mod_encoding.sh

COPY ./build_cgit.sh build_cgit.sh
RUN chmod a+x build_cgit.sh && ./build_cgit.sh