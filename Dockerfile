FROM ubuntu:latest

RUN apt update && apt install -y \
    xfce4 xfce4-goodies \
    tightvncserver \
    websockify \
    novnc \
    curl && \
    apt clean

# Set up VNC user
RUN echo "vncuser:VNCDelta134923123" | chpasswd

# Set user context and configure VNC
USER vncuser
RUN mkdir -p /home/vncuser/.vnc && \
    echo "xfce4-session" > /home/vncuser/.vnc/xstartup && \
    chmod +x /home/vncuser/.vnc/xstartup

EXPOSE 5901 6080

# Start VNC and noVNC server:
CMD vncserver :1 && websockify -D --web /usr/share/novnc 6080 localhost:5901

