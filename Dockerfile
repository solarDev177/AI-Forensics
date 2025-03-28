FROM ubuntu:latest

RUN apt update && apt install -y \
    xfce4 xfce4-goodies \
    tightvncserver \
    websockify \
    novnc \
    curl && \
    apt clean

# Set up VNC user
RUN useradd -m -s /bin/bash vncuser && \
    echo "vncuser:vncpassword" | chpasswd

USER vncuser
RUN mkdir -p /home/vncuser/.vnc && \
    echo "xfce4-session" > /home/vncuser/.vnc/xstartup && \
    chmod +x /home/vncuser/.vnc/xstartup

EXPOSE 5901 6080

# Start VNC and noVNC server
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

CMD ["/start.sh"]
