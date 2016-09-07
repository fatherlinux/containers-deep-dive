#!/bin/bash

docker run -it rhel7 cat localfile
echo ""
docker run -it -v `pwd`/demo-namespaces:/demo-namespaces:Z rhel7 cat /demo-namespaces/localfile
echo ""
docker run --privileged --net=host -t rhel7/rhel-tools tcpdump -A -s 1500 -c 5DD
