FROM ubuntu:latest
RUN apt update && apt upgrade -y
RUN apt install texlive-full -y && apt install ssh &&  ssh-keygen -A
ENV PORT=22
EXPOSE $PORT/tcp
ENTRYPOINT [ "/usr/bin/sshd -De -p ${PORT}" ]