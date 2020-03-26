FROM alpine:latest

MAINTAINER Bugxyb (markxyb@gmail.com)

LABEL Description="Bugxyb Base Env Image(Alpine)" version="1.0"

RUN addgroup -g 10001 -S work \
        && adduser work -u 20001 -D -S -s /bin/sh -G work
WORKDIR /home/work/


RUN apk --update --no-cache add bash curl make libc-dev linux-headers gcc

USER work
EXPOSE 80
