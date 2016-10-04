#!/bin/bash
#
# Developed with these instructions
# https://access.redhat.com/documentation/en/red-hat-enterprise-linux-atomic-host/7/paged/getting-started-with-containers/chapter-15-finding-and-running-containers-without-docker-runc-and-skopeo

# Run the container detached from the terminal
# Had to disable the terminal in config.json ("terminal": false)
strace -o strace.txt runc start -d rhel-container

# Show the system call, clean up the directory
cat strace.txt | grep clone
rm -f strace.txt

# Show the process table
sleep 3
ps -efZ | grep sleep

# Delete the container
runc delete rhel-container
