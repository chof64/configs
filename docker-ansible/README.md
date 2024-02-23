# chof64/configs/docker-ansible

Configs for using Ansible with Docker (containerized) to manage remote hosts.

## How to use

1. Copy this directory to your local machine. Ensure you have Docker installed.

_After you've copied the directory to your local machine, there are scripts that
make it easy to build and connect to the Docker container. And there will be
scripts to help do something._

### The scripts to make it easy

1. Run the `build.sh` script to build the Docker image.
2. Run the `connect.sh` script to connect to the Docker container.

- The `connect.sh` script will run the Docker container and connect to it,
  allowing you to run Ansible commands.
- The container will be removed when you exit the shell.

3. Once connected to the container, you can run Ansible commands as you would on
   a normal machine.
