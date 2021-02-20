FROM debian:stable

ADD https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz /tmp

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install apt-utils \
    && DEBIAN_FRONTEND=noninteractive apt-get -y dist-upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install \
        lib32gcc1 \
        libsdl2-2.0-0 \
        libsdl2-2.0-0:i386 \
        ca-certificates \
        supervisor \
        procps \
        locales \
        unzip \
        zip \
        rsync \
	systemd \
    && echo 'LANG="en_US.UTF-8"' > /etc/default/locale \
    && echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen \
    && locale-gen \
    && apt-get clean \
    && useradd -m -d /home/steam steam \
    && tar xzvf /tmp/steamcmd_linux.tar.gz -C /home/steam/ \
    && chown -R root:root /home/steam \
    && chmod 755 /home/steam/steamcmd.sh /home/steam/linux32/steamcmd /home/steam/linux32/steamerrorreporter \
    && cd "/home/steam" \
    && ./steamcmd.sh +login anonymous +quit \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV HOME /home/steam

CMD /bin/bash
