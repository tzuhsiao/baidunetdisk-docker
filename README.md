# Example Usage
```
docker run --name baidunetdisk \
  -v ~{/BaiduYun/config}:/root/baidunetdisk \
  -v ~/BaiduYun/download:/root/baidunetdiskdownload \
  -p 5900:5900 \
  -e VNC_SERVER_PASSWD='123456' \
  tzuhsiao/baidunetdisk:latest
```
