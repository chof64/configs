# Use the latest Ubuntu image as the base
FROM ubuntu:latest

# Set environment variable to prevent interactive prompts
ENV DEBIAN_FRONTEND=noninteractive

# Update package lists and install necessary dependencies
RUN apt-get update && apt-get install -y \
  software-properties-common \
  wget \
  && rm -rf /var/lib/apt/lists/*

# Add deadsnakes PPA to get Python 3.12
RUN add-apt-repository ppa:deadsnakes/ppa

# Update package lists again and install Python 3.12
RUN apt-get update && apt-get install -y \
  python3.12 \
  python3.12-distutils \
  && rm -rf /var/lib/apt/lists/*

# Set Python 3.12 as the default python3 version
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.12 1

# Install pip for Python 3.12
RUN wget https://bootstrap.pypa.io/get-pip.py \
  && python3.12 get-pip.py \
  && rm get-pip.py

# Install Ansible using pip
RUN python3.12 -m pip install ansible

# Verify Ansible installation
RUN ansible --version
