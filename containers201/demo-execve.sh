strace sleep 3 2>&1 | grep exec &
ps -efZ | grep sleep
