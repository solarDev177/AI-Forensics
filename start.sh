#!/bin/bash

# Start the VNC server
tightvncserver :1 -geometry 1280x1024 -depth 24

# Start websockify to serve noVNC
websockify -D --web /usr/share/novnc 6080 localhost:5901

