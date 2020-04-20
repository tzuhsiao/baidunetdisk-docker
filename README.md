# Example Usage
```
docker run --name baidunetdisk \
  -v {配置文件夹}:/root/baidunetdisk \
  -v {下载文件夹}:/root/baidunetdiskdownload \
  -p 5900:5900 \
  -e VNC_SERVER_PASSWD='{VNC密码}' \
  tzuhsiao/baidunetdisk:latest
```
