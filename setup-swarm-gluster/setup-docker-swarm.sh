#!/bin/sh

# User Input
HOST_PUBLIC_IP=""

# Uncomment to cancel
# exit 1

# Initialize the swarm.
sudo docker swarm init --advertise-addr $HOST_PUBLIC_IP

# Check nodes in the current swarm
sudo docker node ls
