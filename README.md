# CGYINFO: Redis Docker Image

## Statement
redis 4.0.9 based ubuntu 18.04

## Usage

```
docker run -d --name redis -v /d/RES/redis/data:/var/lib/redis -v /d/RES/redis/logs:/var/log/redis -p 6379:6379 cgyinfo/redis
```

## Epilogue

