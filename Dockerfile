FROM ubuntu:18.04
LABEL author="kenny" mail="zhouxiaochuan@cgyinfo.com" url="http://www.cgyinfo.com"

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && mv /etc/apt/sources.list /etc/apt/sources.list.bak
COPY sources.list /etc/apt

# set apt-get sources and install the necessary softwares
RUN apt-get update && apt-get install -y --no-install-recommends redis \
    && rm -rf /var/lib/apt/lists/* \
    && sed -i 's/bind 127.0.0.1 ::1/bind 0.0.0.0/g' /etc/redis/redis.conf \
    && sed -i 's/protected-mode yes/protected-mode no/g' /etc/redis/redis.conf

VOLUME /var/lib/redis
VOLUME /var/log/redis
EXPOSE 6379

# entrypoint
ENV LANG=C.UTF-8 LANGUAGE=C.UTF-8 LC_ALL=C.UTF-8
COPY docker-entrypoint.sh /usr/local/bin
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
ENTRYPOINT [ "docker-entrypoint.sh"]
