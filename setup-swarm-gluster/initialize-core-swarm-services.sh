#!/bin/sh

# Create the traefik network
sudo docker network create --driver=overlay traefik-public

# Create the compute node label
NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')
sudo docker node update --label-add core-services=true $NODE_ID

# Create the directory
sudo mkdir -p /swarm/core
cd /swarm/core
