#FROM rhel
FROM ubi8/ubi:8.4-213
#FROM ubi8/ubi:8.5-226
COPY rcm-tools.repo /etc/yum.repos.d/rcm-tools.repo
COPY resolv.conf /etc/resolv.conf
COPY ca.crt /etc/pki
COPY krb5.conf /etc/krb5.conf
COPY RH-IT-Root-CA.crt /etc/pki/ca-trust/source/anchors/
RUN update-ca-trust extract
RUN subscription-manager clean
RUN subscription-manager register --username  --password 
RUN subscription-manager release --list
RUN subscription-manager repos --list
#RUN subscription-manager attach --auto
RUN subscription-manager attach --pool 8a85f9a07db4828b017dc51ad91008fb
RUN subscription-manager release --set=8.4
#RUN subscription-manager repos --enable rhel-8-for-x86_64-baseos-eus-rpms
#RUN subscription-manager repos --enable rhel-8-for-x86_64-appstream-eus-rpms
#RUN subscription-manager repos --enable rhel-8-for-x86_64-baseos-eus-debug-rpms
#RUN subscription-manager repos --enable rhel-8-for-x86_64-appstream-eus-debug-rpms
#RUN subscription-manager repos --enable rhel-8-for-x86_64-highavailability-eus-rpms
RUN subscription-manager repos --enable rhel-8-for-x86_64-baseos-aus-rpms
RUN subscription-manager repos --enable rhel-8-for-x86_64-appstream-aus-rpms
RUN subscription-manager repos --enable rhel-8-for-x86_64-baseos-aus-debug-rpms
RUN subscription-manager repos --enable rhel-8-for-x86_64-appstream-aus-debug-rpms
RUN subscription-manager repos --enable rhel-8-for-x86_64-highavailability-aus-rpms
RUN subscription-manager repos --enable fast-datapath-for-rhel-8-x86_64-rpms
RUN yum install -y pacemaker-cluster-libs
#RUN yum install -y kernel-4.18.0-305.25.1.el8_4.x86_64 kernel-debuginfo-4.18.0-305.25.1.el8_4.x86_64 
#RUN yum install -y ovn2.13-20.12.0-196.el8fdp.x86_64 ovn2.13-host-20.12.0-196.el8fdp.x86_64	
RUN yum install -y ovn-2021-21.09.1-23.el8fdp.x86_64 ovn-2021-host-21.09.1-23.el8fdp.x86_64
#RUN yum install -y mariadb-10.3.28-1.module+el8.2.0+10474+c7510d9c.x86_64 mariadb-server-10.3.28-1.module+el8.2.0+10474+c7510d9c.x86_64
RUN cat /etc/resolv.conf
RUN yum install -y iputils vim krb5-workstation crash openssh-clients gdb mtools lz4 yum-utils
#RUN debuginfo-install -y ovn2.13-host-20.12.0-196.el8fdp.x86_64
RUN debuginfo-install -y ovn-2021-host-21.09.1-23.el8fdp.x86_64
#RUN debuginfo-install -y mariadb-10.3.28-1.module+el8.2.0+10474+c7510d9c.x86_64 mariadb-server-10.3.28-1.module+el8.2.0+10474+c7510d9c.x86_64
#RUN debuginfo-install -y glibc-2.28-211.el8.x86_64 libaio-0.3.112-1.el8.x86_64 libblkid-2.32.1-39.el8_7.x86_64 libcap-2.48-4.el8.x86_64 libgcc-8.5.0-16.el8_7.x86_64 libgcrypt-1.8.5-7.el8_6.x86_64 libgpg-error-1.31-1.el8.x86_64 libmount-2.32.1-39.el8_7.x86_64 libselinux-2.9-6.el8.x86_64 libstdc++-8.5.0-16.el8_7.x86_64 libxcrypt-4.1.1-6.el8.x86_64 lz4-libs-1.8.3-3.el8_4.x86_64 openssl-libs-1.1.1k-7.el8_6.x86_64 pcre-8.42-6.el8.x86_64 pcre2-10.32-3.el8_6.x86_64 systemd-libs-239-68.el8_7.4.x86_64 xz-libs-5.2.4-4.el8_6.x86_64 zlib-1.2.11-21.el8_7.x86_64
RUN yum install -y glibc-debuginfo
RUN echo "nameserver 10.5.30.160" >> /etc/resolv.conf && cat /etc/resolv.conf && echo "10.0.14.183 download.devel.redhat.com" >> /etc/hosts && ping -c1 10.11.5.19 
#RUN echo "nameserver 10.5.30.160" >> /etc/resolv.conf && cat /etc/resolv.conf && echo "10.0.14.183 download.devel.redhat.com" >> /etc/hosts && ping -c1 10.11.5.19 && yum install -y rhpkg
RUN cat /etc/resolv.conf
RUN mkdir /etc/ipa && curl -o /etc/ipa/ca.crt https://password.corp.redhat.com/ipa.crt
RUN subscription-manager unregister
