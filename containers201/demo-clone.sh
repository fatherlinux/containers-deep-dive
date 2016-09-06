# Developed with these instructions
# https://access.redhat.com/documentation/en/red-hat-enterprise-linux-atomic-host/7/paged/getting-started-with-containers/chapter-15-finding-and-running-containers-without-docker-runc-and-skopeo
strace runc start rhenl-container 2>&1 | grep clone
