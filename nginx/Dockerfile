FROM alpine:latest

MAINTAINER Bugxyb (markxyb@gmail.com)

LABEL Discription="Bugxyb Nginx Image(Alpine)" version="1.0"

ENV NGINX_VERSION 1.17.1
ENV TEMP_DIR /tmp/work

RUN addgroup -g 10001 -S work \
        && adduser work -u 20001 -D -S -s /bin/sh -G work
WORKDIR /home/work/
VOLUME /usr/local/nginx/conf/vhost/

RUN apk --update --no-cache add bash curl libc-dev linux-headers gcc make pcre pcre-dev zlib zlib-dev openssl openssl-dev

RUN mkdir $TEMP_DIR \
        && wget http://nginx.org/download/nginx-$NGINX_VERSION.tar.gz -O $TEMP_DIR/nginx.tar.gz
RUN cd $TEMP_DIR \
        && pwd && ls -al \
        && tar -xvzf nginx.tar.gz \
        && mv nginx-$NGINX_VERSION nginx \
        && cd $TEMP_DIR/nginx/ \
        && ./configure \
            --user=work \
            --group=work \
            --prefix=/usr/local/nginx \
            --with-http_ssl_module \
            --with-http_realip_module \
            --with-http_stub_status_module \
            --with-threads \
        && make \
        && make install \
        && ln /usr/local/nginx/sbin/nginx /usr/sbin/nginx \
        && rm -rf $TEMP_DIR \
        && mkdir -p /usr/local/nginx/conf/vhost/ \
        && chown -R work:work /usr/local/nginx/
COPY ./conf/nginx.conf /usr/local/nginx/conf/nginx.conf

USER work
EXPOSE 80
EXPOSE 8080

ENTRYPOINT ["nginx", "-g", "daemon off;"]
