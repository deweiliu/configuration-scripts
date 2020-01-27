# Save username
user=$(whoami)

# Set command prompt
echo '# Set command prompt' >> ~/.bashrc
echo 'export PS1="\nDate: \d Time: \t Command Number: \#\n\h: \W \u$ "' >> ~/.bashrc

# update apt get
sudo apt-get update

# Setup Snap path
# so applications installed with Snap can be run from Terminal
export PATH=$PATH:/snap/bin

# update snap
snap refresh

# SSH key
ssh-keygen -t rsa -C "deweiliu@hotmail.com" -q -f "/home/${user}/.ssh/id_rsa" -N ''
gedit ~/.ssh/id_rsa.pub

# Git
sudo apt -y install git
git config --global user.email 'deweiliu@hotmail.com'
git config --global user.name 'Dewei Liu'

# Docker
sudo apt-get -y remove docker docker-engine docker.io
sudo apt -y install docker.io
sudo docker --version

# Maven and setup JAVA_HOME
sudo apt -y install maven
echo '# Set JAVA HOME environment variable' >> ~/.bashrc
echo 'export JAVA_HOME=/opt/openjdk11' >> ~/.bashrc

# Terraform
sudo snap install terraform

# build-essential and gcc
sudo apt -y install build-essential

# Pip3
sudo apt -y install python3-pip

# Visual Studio Code
sudo snap install code --classic

# Eclipse
sudo snap install eclipse --classic




