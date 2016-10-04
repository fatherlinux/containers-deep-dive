#!/bin/bash
#
# Developed with these instructions: http://red.ht/2doofq4

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
