<< LINUX USERS ONLY >>

# Step 1) Update package lists:

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
git clone https://github.com/your-username/your-repository.git  
cd your-repository  

# Step 7) Run the application using Docker Compose:
docker-compose up --build  
