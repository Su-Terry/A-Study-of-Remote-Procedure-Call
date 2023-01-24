FROM alpine:3.17
MAINTAINER oceani.c@nycu.edu.tw

ADD files/* /usr/src/app/

WORKDIR /usr/src/app

RUN apk add build-base
RUN apk add libnsl-dev
RUN apk add libtirpc
RUN apk add rpcgen
RUN apk add rpcbind

RUN ln -s /usr/include/tirpc/rpc /usr/include/rpc
RUN ln -s /usr/include/tirpc/rpcsvc /usr/include/rpcsvc
RUN ln -s /usr/include/tirpc/netconfig.h /usr/include/netconfig.h
