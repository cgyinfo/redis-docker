FROM ubuntu:18.04
MAINTAINER Kenny "zhouxiaochuan@cgyinfo.com"

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak
ADD sources.list /etc/apt

# set apt-get sources
RUN apt-get clean && apt-get update && apt-get install redis -y

# modify config file
RUN sed -i 's@bind 127.0.0.1 ::1@bind 0.0.0.0@g' /etc/redis/redis.conf

# close protected-mode
RUN sed -i 's@protected-mode yes@protected-mode no@g' /etc/redis/redis.conf

# set password
RUN echo "requirepass 123456" >> /etc/redis/redis.conf

VOLUME /var/log/redis
EXPOSE 6379

# start
ADD start.sh /usr/local/bin
RUN chmod +x /usr/local/bin/start.sh
ENTRYPOINT [ "/usr/local/bin/start.sh"]
