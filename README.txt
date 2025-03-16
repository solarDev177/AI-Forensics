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

      sudo apt install -y docker-compose  

# Step 5) Add your user to the Docker group (to run Docker without sudo):

sudo usermod -aG docker $USER  
      newgrp docker  # Apply group changes immediately

# Step 6) Now clone the repository:
      git clone https://github.com/solarDev177/AI-Forensics.git  
      cd AI-Forensics  

# Step 7) Run the application using Docker Compose:
      docker-compose up --build  

<< FOR WINDOWS USERS >>

# Step 1) Install Git
      # Download and install Git for Windows

# Step 2) Install Docker Desktop

# Step 3) Ensure Docker is running

# Step 4) Enable WSL (Windows Subsystem for Linux)

# Step 5) Clone the Repository: 
      git clone https://github.com/solarDev177/AI-Forensics.git  
      cd AI-Forensics 

# Step 6) Run the repository using Docker Compose
      docker-compose up --build  
