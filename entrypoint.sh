#!/bin/bash

new_val=$REDIS_PASSWORD
old_val="# requirepass foobared"

sed -i "s/$old_val/requirepass $new_val/g" /etc/redis/redis.conf

service redis-server start

tail -f /dev/null