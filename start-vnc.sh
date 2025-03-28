#!/bin/bash

# Start VNC server
vncserver :1 -geometry 1280x800 -depth 24

# Start noVNC server (web-based VNC)
websockify --web /usr/share/novnc/ 6080 localhost:5901

chmod +x start-vnc.sh
