FROM ubuntu:latest

RUN apt update && apt install -y \
    xfce4 xfce4-goodies \
    tightvncserver \
    websockify \
    novnc \
    curl && \
    apt clean

# Set up VNC user and password
RUN useradd -m -s /bin/bash vncuser && \
    echo "vncuser:VNCDelta134923123" | chpasswd

USER vncuser
RUN echo "$VNC_PASSWORD" | vncpasswd -f > /home/vncuser/.vnc/passwd && \
    chmod 600 /home/vncuser/.vnc/passwd

EXPOSE 5901 6080

# Start VNC and noVNC server
CMD vncserver :1 && websockify -D --web /usr/share/novnc 6080 localhost:5901
