FROM ubuntu:18.04
# RUN sed -i s@/archive.ubuntu.com/@/mirrors.aliyun.com/@g /etc/apt/sources.list && apt-get update
RUN apt-get update
RUN	apt-get install -y nano samba

COPY ./smb.conf /etc/samba/smb.conf
# service smbd restart

WORKDIR /etc/samba
CMD ["smbd", "--foreground", "--no-process-group", "--log-stdout"]
