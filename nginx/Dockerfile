FROM hyrule/baseenv

MAINTAINER Bugxyb (markxyb@gmail.com)

LABEL Description="Bugxyb Nginx Image(Alpine)" version="1.0"

ENV NGINX_VERSION 1.16.1
ENV TEMP_DIR /tmp/work

VOLUME /usr/local/nginx/conf/vhost/

USER root
RUN apk --update --no-cache add pcre pcre-dev zlib zlib-dev openssl openssl-dev

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
COPY ./conf/vhost/ /usr/local/nginx/conf/vhost/

USER work
EXPOSE 80
EXPOSE 8080

ENTRYPOINT ["nginx", "-g", "daemon off;"]
