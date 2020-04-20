FROM ubuntu:18.04

ENV VNC_SERVER_PASSWD password

ENV LANG C.UTF-8
ENV LANGUAGE zh_CN:zh

RUN apt-get update && \
  apt-get install -y wget x11vnc xvfb xfonts-wqy desktop-file-utils libnss3 libgtk-3-0 libasound2 && \
  rm -rf /var/lib/apt/lists/* && \
  mkdir ~/.vnc && \
  touch ~/.vnc/passwd

RUN wget http://wppkg.baidupcs.com/issue/netdisk/LinuxGuanjia/3.0.1/baidunetdisk_linux_3.0.1.2.deb -O baidunetdisk.deb && \
  dpkg -i baidunetdisk.deb

RUN sh -c 'echo "/opt/baidunetdisk/baidunetdisk" >> ~/.bashrc'

EXPOSE 5900

CMD /usr/bin/x11vnc -storepasswd $VNC_SERVER_PASSWD ~/.vnc/passwd && \
  /usr/bin/x11vnc -forever -usepw -create
