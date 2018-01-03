#!/bin/bash



# new installation
sudo apt-get update
sudo apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtua

sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


# Author Munis Isazade
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo -e "Step 1 — Installing Docker"
echo -e "The Docker installation package available in the official Ubuntu 16.04 repository may not be the latest version. To get the latest and greatest version, install Docker from the official Docker repository. This section shows you how to do just that."
echo -e "First, add the GPG key for the official Docker repository to the system:"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo -e "Add the Docker repository to APT sources:"
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
echo -e "Next, update the package database with the Docker packages from the newly added repo:"
sudo apt-get update
echo -e "Make sure you are about to install from the Docker repo instead of the default Ubuntu 16.04 repo:"
apt-cache policy docker-ce
echo -e "Install docker-ce Ubuntu 16"
sudo apt-get install -y docker-ce
echo -e "Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it's running:"
sudo systemctl status docker
docker
echo -e "Step 2 — Executing the Docker Command Without Sudo (Optional)"
sudo usermod -aG docker ${USER}
echo -e "Check users groups"
id -nG | grep 'docker'
echo -e "If you need to add a user to the docker group that you're not logged in as, declare that username explicitly using:"
sudo usermod -aG docker username
echo -e "Step 3 — Using the Docker Command"
docker
echo -e "last Docker info"
docker info