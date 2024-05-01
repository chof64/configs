#!/bin/sh

# User Input
VOLUME_NAME=""
HOST_PUBLIC_IP=""

# Install GlusterFS
sudo DEBIAN_FRONTEND=noninteractive apt update
sudo DEBIAN_FRONTEND=noninteractive apt install -y glusterfs-server

# Start and enable the glusterfs-server service
sudo systemctl enable --now glusterd

# Create the brick directory
sudo mkdir -p /gluster/$VOLUME_NAME

# Create the gluster volume
sudo gluster volume create $VOLUME_NAME transport tcp $HOST_PUBLIC_IP:/gluster/$VOLUME_NAME force

# Start the gluster volume
sudo gluster volume start $VOLUME_NAME

# Check the gluster volume status
sudo gluster volume status
sudo gluster volume info

# Mount the gluster volume
sudo mkdir -p /mnt/$VOLUME_NAME
sudo mount -t glusterfs $HOST_PUBLIC_IP:/$VOLUME_NAME /mnt/$VOLUME_NAME

# Add the gluster volume to /etc/fstab
echo "$HOST_PUBLIC_IP:/$VOLUME_NAME /mnt/$VOLUME_NAME glusterfs defaults,_netdev 0 0" | sudo tee -a /etc/fstab
