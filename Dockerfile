# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory
WORKDIR /app

# Copy the current directory contents into the container
COPY . /app

# Install any necessary dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Set the environment variable for Matplotlib to avoid display issues
ENV MPLBACKEND TkAgg

# Command to run the application
CMD ["python", "your_script.py"]

