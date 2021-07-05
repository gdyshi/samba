# samba

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
