FROM hyrule/baseenv

MAINTAINER Bugxyb (markxyb@gmail.com)

LABEL Description="Bugxyb Redis Image(Alpine)" version="1.0"

ENV REDIS_VERSION 5.0.8
ENV TEMP_DIR /tmp/work

USER root
RUN mkdir $TEMP_DIR \
        && wget http://download.redis.io/releases/redis-$REDIS_VERSION.tar.gz -O $TEMP_DIR/redis.tar.gz

RUN cd $TEMP_DIR \
        && pwd && ls -al \
        && tar -xvzf redis.tar.gz \
        && mv redis-$REDIS_VERSION redis \
        && cd $TEMP_DIR/redis/ \
        && make \
        && make install \
        && rm -rf $TEMP_DIR
COPY ./conf/redis.conf /etc/redis.conf

USER work

EXPOSE 80
EXPOSE 6379

ENTRYPOINT ["redis-server", "/etc/redis.conf"]
