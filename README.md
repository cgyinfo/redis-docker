# CGYINFO: Redis Docker Image

## Statement
redis docker image based ubuntu 18.04

## Usage

```
docker run -d --name redis -v /d/RES/redis/data:/var/lib/redis -v /d/RES/redis/logs:/var/log/redis -p 6379:6379 cgyinfo/redis
```

The image applys two VOLUMES be mounted by container:
/var/lib/redis : redis data storage
/var/log/redis : redis server log file

## Epilogue

![LOGO](https://www.cgyinfo.com/logo.png)

Please refer to the official website for details: [https://www.cgyinfo.com](https://www.cgyinfo.com)
