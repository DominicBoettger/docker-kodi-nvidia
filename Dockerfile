FROM phusion/baseimage:0.9.16
MAINTAINER Matt McCormick <matt@mmmccormick.com>

RUN apt-get update
RUN apt-get install -y x-window-system
RUN apt-get install -y binutils
RUN apt-get install -y mesa-utils
RUN apt-get install -y module-init-tools

ADD nvidia-driver.run /tmp/nvidia-driver.run
RUN sh /tmp/nvidia-driver.run -a -N --ui=none --no-kernel-module
RUN rm /tmp/nvidia-driver.run

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common
RUN add-apt-repository ppa:team-xbmc/ppa
RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y kodi kodi-pvr-vdr-vnsi kodi-pvr-iptvsimple

CMD /usr/bin/kodi-standalone
