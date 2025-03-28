FROM ubuntu:latest

# Install dependencies
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

# Set up VNC server
USER vncuser
RUN mkdir -p /home/vncuser/.vnc && \
    echo "xfce4-session" > /home/vncuser/.vnc/xstartup && \
    chmod +x /home/vncuser/.vnc/xstartup

# Expose VNC and noVNC ports
EXPOSE 5901 6080

# Start script
COPY run-vnc.sh /run-vnc.sh
COPY start-vnc.sh /start-vnc.sh

# Make run-vnc.sh executable
RUN chmod +x /enable-vnc.sh

RUN chmod +x /start-vnc.sh

CMD ["/start-vnc.sh"]


