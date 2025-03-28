#!/bin/bash

# Clone the repository (if needed)
git clone https://github.com/solarDev177/AI-Forensics.git

# Navigate to the project directory
cd AI-Forensics

# Build the Docker container
docker-compose build

# Start the container
docker-compose up -d

