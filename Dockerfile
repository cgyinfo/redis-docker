FROM ubuntu:18.04
MAINTAINER Kenny "zhouxiaochuan@cgyinfo.com"

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
&& mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list /etc/apt
RUN chmod +x /usr/local/bin/entrypoint.sh

# set apt-get sources
RUN apt-get clean && apt-get update && apt-get install -y --no-install-recommends redis

# modify config file bind address, protected mode and password
RUN sed -i 's@bind 127.0.0.1 ::1@bind 0.0.0.0@g' /etc/redis/redis.conf \
&& sed -i 's@protected-mode yes@protected-mode no@g' /etc/redis/redis.conf \
&& echo "requirepass 123456" >> /etc/redis/redis.conf

VOLUME /var/lib/redis
VOLUME /var/log/redis
EXPOSE 6379

# start
COPY entrypoint.sh /usr/local/bin
ENTRYPOINT [ "entrypoint.sh"]
