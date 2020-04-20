FROM ubuntu:18.04

ENV VNC_SERVER_PASSWD password

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE zh_CN:zh

RUN apt-get update && \
  apt-get install -y \
    wget \
    x11vnc \
    xvfb \
    desktop-file-utils \
    libnss3 \
    libgtk-3-0 \
    libasound2

RUN apt-get -qqy update && \
  apt-get -qqy --no-install-recommends install \
    libfontconfig \
    libfreetype6 \
    xfonts-cyrillic \
    xfonts-scalable \
    fonts-liberation \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei && \
  rm -rf /var/lib/apt/lists/* && \
  apt-get -qyy clean

RUN mkdir ~/.vnc && \
  touch ~/.vnc/passwd

RUN wget \
  http://wppkg.baidupcs.com/issue/netdisk/LinuxGuanjia/3.0.1/baidunetdisk_linux_3.0.1.2.deb \
    -O baidunetdisk.deb && \
  dpkg -i baidunetdisk.deb

RUN sh -c 'echo "/opt/baidunetdisk/baidunetdisk" >> ~/.bashrc'

EXPOSE 5900

CMD /usr/bin/x11vnc -storepasswd $VNC_SERVER_PASSWD ~/.vnc/passwd && \
  /usr/bin/x11vnc -forever -usepw -create
