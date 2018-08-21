#!/bin/sh

service filebeat start
tail -f /var/log/dpkg.log

if [ "$#" -eq 0 ]; then
    scan_all_local_images.sh
else
    scan_images.sh "$@"
fi
