FROM centos
MAINTAINER Scott McCarty <smccarty@redhat.com>

ENV container docker
STOPSIGNAL SIGRTMIN+3

RUN yum -y install \
#        --disablerepo=* \
#        --enablerepo=rhel-7-server-rpms \
        httpd mariadb mariadb-server; \
        systemctl enable httpd; \
        systemctl enable mariadb

RUN echo passwd | passwd --stdin root
#VOLUME /sys/fs/cgroup:/sys/fs/cgroup:ro

ENV scott mccarty

CMD [ "/sbin/init" ]
