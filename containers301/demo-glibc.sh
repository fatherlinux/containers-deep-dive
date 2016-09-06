#!/bin/bash

gcc -static ./demo-glibc/helloworld.c -o ./demo-glibc/helloworld.static
gcc ./demo-glibc/helloworld.c -o ./demo-glibc/helloworld.dynamic
echo ""
docker build -t alpine-glibc ./demo-glibc/
echo ""
ldd ./demo-glibc/helloworld.static
echo ""
ldd ./demo-glibc/helloworld.dynamic
echo ""
docker run -t alpine-glibc /helloworld.static
echo ""
docker run -t alpine-glibc /helloworld.dynamic
