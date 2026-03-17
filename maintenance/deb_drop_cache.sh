#!/bin/bash

cache=`free -m | head -n 2 | tail -n 1 | awk '{print $6}'`

if [ "$cache" -gt "4096" ] ; then

        sync ; echo 3 > /proc/sys/vm/drop_caches

fi
