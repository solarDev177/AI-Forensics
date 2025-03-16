<< LINUX/MAC OS/UNIX USERS ONLY >>

# Step 1) Update package lists:

# For MAC OS users, they will need to install Homebrew, which is a package manager:
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
      # It is strongly suggested to install python3 or docker using Homebrew if the user doesn't have it.
      # If GUI on MAC OS experiences problems, resetting Docker Desktop and/or its settings is reccomended. 

# Otherwise, update packages in Linux:
      sudo apt update  

# Step 2) Install Git (if not installed):

      sudo apt install -y git  

# Step 3) Install Docker: 

      sudo apt install -y docker.io  

# Step 4) Install Docker Compose:  

      # Check if docker-compose is installed using: 
      which docker-compose
      If the command returns a path: "/usr/local/bin/docker-compose" or something similar, docker-         compose is installed.
      # If its not, run:
      sud curl -L "https://github.com/docker/compose/releases/download/v2.20.2/docker-compose-             $(uname -m)" -o /usr/local/bin/docker-compose
      # Note: Make sure to replace v2.20.2 with the latest version from the official releases.
      # After installation, make the binary executable: 
      sudo chmod +x /usr/local/bin/docker-compose
      # Verify the installation: 
      docker-compose --version
      # If its the latest version, move to step 5. Otherwise, troubleshoot and repeat step 4.

# Step 5) Add your user to the Docker group (to run Docker without sudo):

      sudo usermod -aG docker $USER  
      newgrp docker  # Apply group changes immediately

# Step 6) Now clone the repository:
      git clone https://github.com/solarDev177/AI-Forensics.git  
      cd AI-Forensics  

# Step 7) Run the application using Docker Compose:

      # If an error occurs where there is already a container with the same name, run the commands:
      docker ps -a # to list containers (even stopped ones)
      docker rm ai-forencics-app # remove the existing container or:
      docker-compose down        # to remove the current containers
      # if the container is running:
      docker stop ai-forensics-app
      docker rm ai-forensics-app
      # After completing the above, try the following commands:
      
      docker build -t ai-forensics-app .
      # Verify the image exists: 
      docker images
      # Run it with X11 forwarding enabled: 
      xhost +local:
      docker run -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix ai-forensics-app

      # If using Wayland, try: 
      docker run -e WAYLAND_DISPLAY=$WAYLAND_DISPLAY -v /run/user/1000:/run/user/1000 ai-forensics-        app

      # Alternatively, if using docker-compose, run:
      docker-compose up --build

<< FOR WINDOWS USERS >>

# Step 1) Install Git
      # Download and install Git for Windows

# Step 2) Install Docker Desktop

# Step 3) Ensure Docker is running

# Step 4) Enable WSL (Windows Subsystem for Linux)

# Step 5) Clone the Repository: 
      
      git clone https://github.com/solarDev177/AI-Forensics.git  

      # cd to the directory:
      cd AI-Forensics 

# Step 6) Run the repository:
      # Download & Install VcXsrv (Recommended)
      https://sourceforge.net/projects/vcxsrv/
      # Search for the Xlaunch client in Windows. Run it, and leave everything how it is, except check 
      # Run this display forwarding command in Powershell before using docker-compose:
      $env:DISPLAY="host.docker.internal:0.0"
      # Build the image: 
      docker build -t ai-forensics-app .
      # Run the container: 
      docker run -e DISPLAY=host.docker.internal:0.0 -v /tmp/.X11-unix:/tmp/.X11-unix ai-forensics-app

      
