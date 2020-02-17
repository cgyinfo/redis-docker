FROM ubuntu:18.04
LABEL author="kenny" mail="zhouxiaochuan@cgyinfo.com" url="http://www.cgyinfo.com"

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list /etc/apt

# set apt-get sources and install the necessary softwares
RUN apt-get update && apt-get install -y --no-install-recommends redis \
    && sed -i 's/bind 127.0.0.1 ::1/bind 0.0.0.0/g' /etc/redis/redis.conf \
    && sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis/redis.conf

VOLUME /var/lib/redis
VOLUME /var/log/redis
EXPOSE 6379

# start
COPY entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh"]
