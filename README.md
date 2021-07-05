# samba

## 实现功能

1. 文件从外网到局域网只进不出
2. 局域网内部文件共享，且外网无法访问

## 网络环境说明

当前默认配置内网网段为8，即ip为：192.168.8.*
建议将内网路由器修改为8网段，如果不修改，需要修改镜像的配置文件 /etc/samba/smb.conf

# run
运行后，会共享3个文件夹：`\\ip\file_send`、`\\ip\file_recv`和`\\ip\internal`。

- `file_send`仅限局域网外电脑访问，用于拷贝外网文件到服务器。具有读写权限
- `file_recv`仅限局域网内电脑访问，用于拷贝外网文件到内网电脑。具有只读权限
- `internal`仅限局域网内电脑访问，用于内网电脑交换文件

```
mkdir -p /home/share_dir/external
mkdir -p /home/share_dir/internal
sudo chmod 777 /home/share_dir -R
docker run --name samba -p 445:445 -v /home/share_dir:/share gdyshi/samba
```

# 修改配置

```
nano /etc/samba/smb.conf
```
