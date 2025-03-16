# Use Python 3.10 or 3.11 base image
FROM python:3.10-slim

# Install system dependencies (including OpenGL libraries for OpenCV)
RUN apt-get update && apt-get install -y \
    libgl1-mesa-glx \
    libglib2.0-0 \
    && rm -rf /var/lib/apt/lists/*

# Set the working directory
WORKDIR /app

# Copy the requirements.txt file into the container
COPY requirements.txt .

# Install the required Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application into the container
COPY . .

# Set the default command to run your application (replace with your app's entry point)
CMD ["python", "main.py"]
