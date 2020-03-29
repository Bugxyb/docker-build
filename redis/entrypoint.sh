#!/bin/bash

redis-server /etc/redis.conf

tail -f /dev/null
