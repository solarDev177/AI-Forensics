# Use Python 3.10 base image
FROM python:3.10-slim

# Install system dependencies (including OpenGL, Tkinter, and tkdnd dependencies)
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    libx11-dev \
    libxcursor1 \
    libxrandr2 \
    libxext6 \
    libxi6 \
    libxft2 \
    libtk8.6 \
    tcl8.6-dev \
    tk8.6-dev \
    && rm -rf /var/lib/apt/lists/*
# Set the working directory
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install the required Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application into the container
COPY . .

# Set the default command to run the application
CMD ["python", "main.py"]

