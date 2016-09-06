docker pull registry.access.redhat.com/rhel7
echo ""
docker pull registry.access.redhat.com/rhel7/rhel
echo ""
docker tag registry.access.redhat.com/rhel7/rhel rhel7
echo ""
docker tag registry.access.redhat.com/rhel7/rhel rhel7/rhel
echo ""
docker images | grep rhel7
