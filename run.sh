#!/bin/sh
# Running now

if [ `id -u` -ne 0 ]; then
    echo "Please re-run ${this_file} as root."
    exit 1
fi

redis-server &
celery worker -A config.celery &
gunicorn config:app -b 0.0.0.0:4999 -D
