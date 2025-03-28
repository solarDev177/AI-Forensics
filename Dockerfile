FROM ubuntu:latest

RUN apt update && apt install -y \
    x2goserver \
    x2goserver-xsession \
    xfce4 \
    curl \
    && apt clean

RUN useradd -m -s /bin/bash x2go \
    && echo "x2go:x2gopassword" | chpasswd

EXPOSE 22

CMD ["service", "x2goserver", "start"]
