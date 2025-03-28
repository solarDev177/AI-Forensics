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

# Start VNC and noVNC server:
CMD export USER=vncuser && export DISPLAY=:1 && vncserver :1 && websockify -D --web /usr/share/novnc 6080 localhost:5901
