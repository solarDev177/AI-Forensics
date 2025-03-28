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
USER root
COPY start.sh /start.sh

# Make start.sh executable
RUN chmod +x /start.sh

CMD ["/start.sh"]


