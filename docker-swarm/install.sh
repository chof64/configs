#!/bin/bash

# Uninstall any previously installed versions:
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done

# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker Engine:
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Verify the installation:
sudo docker run hello-world

# Remove the hello-world container:
if sudo docker ps -a --filter "ancestor=hello-world" --format '{{.ID}}' | grep -q .; then
    sudo docker stop $(sudo docker ps -a --filter "ancestor=hello-world" --format '{{.ID}}')
    sudo docker rm $(sudo docker ps -a --filter "ancestor=hello-world" --format '{{.ID}}')
fi
sudo docker rmi hello-world

# Clean up:
sudo apt-get autoremove
sudo apt-get clean
