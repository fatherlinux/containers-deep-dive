strace sleep 10 2>&1 | grep exec &
sleep 3
ps -efZ | grep sleep
