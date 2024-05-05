#!/bin/sh

# User Input
export TRAEFIK_DOMAIN=""
export TRAEFIK_EMAIL=""
export TRAEFIK_USERNAME=""
export TRAEFIK_PASSWORD=""
export TRAEFIK_HASHED_PASSWORD=$(openssl passwd -apr1 $TRAEFIK_PASSWORD)

export PORTAINER_DOMAIN=""

# Download the compose file
curl -fsSL https://raw.githubusercontent.com/chof64/configs/main/setup-swarm-gluster/docker-compose.yml > docker-compose.yml
sudo nano docker-compose.yml

# Start the services
sudo -E docker stack deploy -c docker-compose.yml core
