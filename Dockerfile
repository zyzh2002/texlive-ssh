FROM ubuntu:latest
RUN apt-get update && apt-get upgrade -y
RUN apt-get install texlive-full -y && apt-get install ssh &&  ssh-keygen -A
ENV PORT=22
EXPOSE $PORT/tcp
ENTRYPOINT [ "/usr/bin/sshd -De -p ${PORT}" ]