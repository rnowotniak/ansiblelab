FROM centos:latest
LABEL maintainer="Robert Nowotniak <rnowotniak@gmail.com>"

RUN yum install -y epel-release && \
    yum install -y ansible openssh-server openssh-clients \
        nmap-ncat net-tools man && \
    ssh-keygen -A
        
COPY run.sh /root/

CMD ["bash", "/root/run.sh"]
        