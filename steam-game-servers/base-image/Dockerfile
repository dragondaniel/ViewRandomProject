FROM centos:7

RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm && yum -y update && yum -y install glibc libstdc++ glibc.i686 libstdc++.i686 vim wget curl tmux

RUN useradd steam

USER steam
ENV HOME /home/steam
CMD /bin/bash
