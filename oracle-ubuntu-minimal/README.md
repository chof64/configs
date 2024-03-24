# chof64/configs/oracle-ubuntu

This is a collection of configuration files and scripts for setting up a new
Ubuntu Minimal compute instance on Oracle Cloud Infrastructure (OCI).

## The Scripts

1. `initial-setup.sh` - This script will upgrade the system, install some basic
   packages, and configure the system for the user.

```bash
curl -sSL https://raw.githubusercontent.com/chof64/configs/main/oracle-ubuntu-minimal/initial-setup.sh | sh
```
