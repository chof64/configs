# chof64/configs/docker-swarm

## Install Docker

1. Uninstall old versions

```bash
for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do sudo apt-get remove $pkg; done
```
