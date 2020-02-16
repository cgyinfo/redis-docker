#!/bin/bash

echo "redis server starting..."
service redis-server start
echo "redis server started."

tail -f /dev/null