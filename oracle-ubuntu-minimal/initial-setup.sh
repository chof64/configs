#!/bin/sh

#* Set apt noninteractive
sudo export DEBIAN_FRONTEND=noninteractive

#* Update and upgrade the system
sudo apt update
sudo apt upgrade -y

#* Install the necessary packages
sudo apt install -y vim curl

#* Shutdown the system
#? Shutdown the system after 10 seconds. This is useful to
#? speed up the reboot process of the initial setup.
sudo shutdown -h +1
