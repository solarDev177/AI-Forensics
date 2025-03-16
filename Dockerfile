# Use a lightweight Python image:
FROM python:3.10-slim

# Set the working directory:
WORKDIR /app

# Copy requirements first for better caching:
COPY requirements.txt .

# Based on the requirements.txt file:
# Install dependencies:
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application:
COPY . .

# Set the environment variable for Matplotlib:
ENV MPLBACKEND TkAgg

# Default command (overridden by Docker Compose):
CMD ["python", "your_script.py"]

