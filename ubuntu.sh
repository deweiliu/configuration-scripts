# Generate SSH
ssh-keygen -t rsa -C "deweiliu@hotmail.com"
git config --global user.email 'deweiliu@hotmail.com'
git config --global user.name 'Dewei Liu'


# update apt get
sudo apt-get update

# Docker
sudo apt-get -y remove docker docker-engine docker.io
sudo apt -y install docker.io
sudo dockere --version

# Maven
sudo apt -y install maven

# Terraform
sudo snap install terraform



