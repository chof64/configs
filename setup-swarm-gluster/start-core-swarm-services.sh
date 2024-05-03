#!/bin/sh

# User Input
export TRAEFIK_DOMAIN=""
export TRAEFIK_EMAIL=""
export TRAEFIK_USERNAME=""
export TRAEFIK_PASSWORD=""
export TRAEFIK_HASHED_PASSWORD=$(openssl passwd -apr1 $TRAEFIK_PASSWORD)

export PORTAINER_DOMAIN=""

# Create the traefik network
sudo docker network create --driver=overlay traefik-public

# Create the compute node label
NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')
sudo docker node update --label-add node.labels.core-services=true $NODE_ID

# Download the compose file
sudo mkdir -p ~/swarm-core
cd ~/swarm-core
curl -fsSL https://raw.githubusercontent.com/chof64/configs/main/setup-swarm-gluster/docker-compose.yml -o docker-compose.yml

# Start the services
sudo docker stack deploy -c docker-compose.yml core
