#!/bin/bash

# module vhost_vsock is removed when no one is using it
while :
do
        if [ "$(lsmod | awk '{ if($1 == "vhost_vsock") print $3;}')" == "0" ]; then
                modprobe -r vhost_vsock
                break
        fi
done

./grabdata.sh -t
mkdir ../results/run2
mv ../results/*.json ../results/run2/
