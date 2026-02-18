#FROM centos
FROM ubi8/ubi
COPY rcm-tools.repo /etc/yum.repos.d/rcm-tools.repo
COPY resolv.conf /etc/resolv.conf
COPY ca.crt /etc/pki
COPY krb5.conf /etc/krb5.conf
#RUN curl -o /etc/krb5.conf https://gitlab.corp.redhat.com/it-iam/system-configs/raw/master/krb5/idm/linux-krb5.conf
COPY RH-IT-Root-CA.crt /etc/pki/ca-trust/source/anchors/
RUN subscription-manager register --username  --password 
RUN subscription-manager repos --disable rhel-*
RUN subscription-manager repos --enable rhel-8-for-x86_64-baseos-rpms
RUN subscription-manager repos --enable rhel-8-for-x86_64-baseos-rpms
RUN subscription-manager repos --enable rhel-8-for-x86_64-appstream-rpms
RUN update-ca-trust extract
RUN cat /etc/resolv.conf
RUN yum install -y iputils vim krb5-workstation
RUN echo "nameserver 10.5.30.160" >> /etc/resolv.conf && cat /etc/resolv.conf && echo "10.0.14.183 download.devel.redhat.com" >> /etc/hosts && ping -c1 10.11.5.19 && yum install -y rhpkg
RUN cat /etc/resolv.conf
#RUN mkdir /etc/ipa && curl -o /etc/ipa/ca.crt https://password.corp.redhat.com/ipa.crt
RUN mkdir /etc/ipa && curl -o /etc/ipa/ca.crt https://certs.corp.redhat.com/certs/mtls-ca-validators.crt

