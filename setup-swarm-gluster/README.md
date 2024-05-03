# chof64/configs/setup-swarm-gluster

These scripts will help us setup a Docker Swarm cluster with GlusterFS. These
scripts are meant to be run on an Ubuntu 22.04 Minimal installation.

## Initialization

This script will update the system, install the basic packages, and reboot the
system. This handles the initial update of the system after it was provisioned.
A crucial step to apply the latest updates and security patches.

This script also installs `curl`, `nano` and `wget` for convenience.

**⚠️Heads Up**: This script will shutdown the system after running. Make sure to
reboot the system via the cloud provider's console.

```bash
curl -fsSL https://raw.githubusercontent.com/chof64/configs/main/setup-swarm-gluster/initialization.sh | sudo sh
```

## Docker and Docker Swarm

### Install Docker Engine

Docker, including Docker Engine and Docker Compose, is required to setup the
Swarm cluster.

This script handles the installation of Docker and its dependencies. It will
also run the `hello-world` container to verify the installation. Cleanup and
removal of the container and image, as well as apt packages are
run after the verification.

```bash
curl -fsSL https://raw.githubusercontent.com/chof64/configs/main/setup-swarm-gluster/install-docker-engine.sh | sudo sh
```

### Setup Docker Swarm

To setup Docker Swarm, run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/chof64/configs/main/setup-swarm-gluster/setup-docker-swarm.sh > setup-docker-swarm.sh
nano setup-docker-swarm.sh
sudo sh ./setup-docker-swarm.sh
rm setup-docker-swarm.sh
```

This will setup a Docker Swarm cluster with the current node as the manager.

To add another node to the cluster, run the following command on the
manager node to get the join token:

```bash
sudo docker swarm join-token [manager/worker]
```

**Fix firewall configuration for a multi-node setup soon.**

## Setup GlusterFS

To setup GlusterFS, run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/chof64/configs/main/setup-swarm-gluster/setup-glusterfs.sh > setup-glusterfs.sh
nano setup-glusterfs.sh
sudo sh ./setup-glusterfs.sh
rm setup-glusterfs.sh
```

This will install GlusterFS and setup a volume. It will also mount the volume
and persist the mount in `/etc/fstab`.

## Start core swarm services

The core swarm services are a set of services required to manage the swarm. It
includes the following services:

- **Portainer**: A web-based management UI for Docker.
- **Traefik**: A reverse proxy and load balancer for HTTP and TCP-based services.

These services are responsible for managing the swarm and its service. They are
crucial to the operation of the swarm.

**Part 1: Deploy with docker-compose**

```bash
curl -fsSL https://raw.githubusercontent.com/chof64/configs/main/setup-swarm-gluster/start-core-swarm-services.sh > start-core-swarm-services.sh
nano start-core-swarm-services.sh
sudo sh ./start-core-swarm-services.sh
rm start-core-swarm-services.sh
```

**Part 2: Configure firewall**

```bash
sudo iptables-save > ~/iptables.v4
sudo nano ~/iptables.v4
sudo iptables-restore < ~/iptables.v4
sudo netfilter-persistent save
rm ~/iptables.v4
```

```bash
# Allow all internal traffic
-A INPUT -s <CIDR ADDRESS> -j ACCEPT
# Allow http and https web traffic
-A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
-A INPUT -p tcp -m state --state NEW -m tcp --dport 443 -j ACCEPT
```
