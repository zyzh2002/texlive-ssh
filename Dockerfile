FROM ubuntu:latest

RUN sed -i 's@//.*archive.ubuntu.com@//mirrors.ustc.edu.cn@g' /etc/apt/sources.list &&\
    apt-get update && apt-get upgrade -y &&\
    apt-get install ssh -y &&  ssh-keygen -A

RUN apt-get install texlive-full -y

ENV PORT=22
EXPOSE $PORT/tcp
ENTRYPOINT [ "/usr/bin/sshd -De -p ${PORT}" ]