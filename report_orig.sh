#!/bin/bash

#load module vhost_vsock
modprobe -i vhost_vsock

if [ "$(lsmod | awk '{if($1 == "vhost_vsock") print $1}')" == "vhost_vsock" ]; then
	./grabdata.sh -t
	mkdir ../results/run1
	mv ../results/*.json ../results/run1/
fi
