docker run -t rhel7 sleep 10 &
docker run -t rhel7 sleep 10 &
sleep 3
ps -efZ | grep svirt | grep sleep
for i in `docker ps | grep sleep | awk '{print $1}' | grep [0-9]`; do lscgroup | grep $i; done
