# CGYINFO: Redis Docker Image

## Statement
redis 4.0.9 docker image based ubuntu 18.04

## Usage

```
docker run -d --name redis -v /d/RES/redis/data:/var/lib/redis -v /d/RES/redis/logs:/var/log/redis -e REDIS_PASSWORD=123456 -p 6379:6379 cgyinfo/redis
```

The image applys two VOLUMES be mounted by container:
/var/lib/redis : redis storage data
/var/log/redis : redis server logs

## Epilogue

![LOGO](https://www.cgyinfo.com/logo.png)

Please refer to the official website for details: [https://www.cgyinfo.com](https://www.cgyinfo.com)
