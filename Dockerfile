FROM ubuntu:18.04

ENV VNC_SERVER_PASSWD password

ENV LC_ALL C.UTF-8
ENV LANG C.UTF-8
ENV LANGUAGE zh_CN:zh

RUN apt-get -qqy update && \
  apt-get -qqy install \
    wget \
    x11vnc \
    xvfb \
    desktop-file-utils \
    libnss3 \
    libgtk-3-0 \
    libasound2 \
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
  dpkg -i baidunetdisk.deb && \
  rm baidunetdisk.deb -f

RUN sh -c 'echo "/opt/baidunetdisk/baidunetdisk" >> ~/.bashrc'

EXPOSE 5900

CMD echo "VNC (vnc://localhost:5900) password is $VNC_SERVER_PASSWD" && \
  /usr/bin/x11vnc -storepasswd $VNC_SERVER_PASSWD ~/.vnc/passwd && \
  /usr/bin/x11vnc --geometry 1600x1200 -forever -usepw -create
