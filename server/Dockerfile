FROM phusion/baseimage
MAINTAINER Jason Kraus "jason@buildicus.com"
RUN rm -rf /etc/service/sshd /etc/my_init.d/00_regen_ssh_host_keys.sh
RUN mkdir /etc/service/ssltunnel
ADD ./run.sh /etc/service/ssltunnel/run
RUN chmod +x /etc/service/ssltunnel/run

CMD /sbin/my_init

RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
