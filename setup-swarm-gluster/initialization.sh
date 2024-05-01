#!/bin/sh

# Update and upgrade
sudo DEBIAN_FRONTEND=noninteractive apt update
sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y

# Install basic tools
sudo DEBIAN_FRONTEND=noninteractive apt update
sudo DEBIAN_FRONTEND=noninteractive apt install -y nano curl wget

# Autoremove and autoclean apt
sudo DEBIAN_FRONTEND=noninteractive apt autoremove -y
sudo DEBIAN_FRONTEND=noninteractive apt autoclean -y

# Shutdown instance
sudo shutdown -h now
