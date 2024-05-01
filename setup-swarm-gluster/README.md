# setup-swarm-gluster

## Initialization

To initialize the system, run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/chof64/configs/main/setup-swarm-gluster/initialization.sh | sudo sh
```

This will update the system, install the basic packages, and reboot the system.

## Install Docker Engine

To install Docker Engine, run the following command:

```bash
curl -fsSL https://raw.githubusercontent.com/chof64/configs/main/setup-swarm-gluster/install-docker-engine.sh | sudo sh
```

This will install Docker Engine and Docker Compose. It will also run the
`hello-word` container to verify the instllation and handle cleanup.

## Setup Docker Swarm

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
