[![Docker Size](https://img.shields.io/docker/image-size/tzuhsiao/baidunetdisk)](https://hub.docker.com/r/tzuhsiao/baidunetdisk)
[![Docker Pulls](https://img.shields.io/docker/pulls/tzuhsiao/baidunetdisk)](https://hub.docker.com/r/tzuhsiao/baidunetdisk)

# 运行
```
docker run --name baidunetdisk \
  -v {配置文件夹}:/root/baidunetdisk \
  -v {下载文件夹}:/root/baidunetdiskdownload \
  -p {VNC端口}:5900 \
  -e VNC_SERVER_PASSWD='{VNC密码}' \
  tzuhsiao/baidunetdisk:latest
```

## 通过VNC访问
使用任何VNC客户端连接，如[VNC® Viewer](https://www.realvnc.com/en/connect/download/viewer/)，[TightVNC](https://www.tightvnc.com/)。

## 通过浏览器访问
默认端口为6080。
