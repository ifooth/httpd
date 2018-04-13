FROM centos/httpd

WORKDIR /usr/src/app

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN yum install -y patch httpd-devel gcc make

COPY ./mod_encoding mod_encoding
COPY ./build.sh build.sh

RUN chmod a+x build.sh && ./build.sh