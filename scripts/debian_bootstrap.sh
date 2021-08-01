#!/bin/bash

set -e

# Install Ansible
sudo apt-get install -y software-properties-common
sudo apt-add-repository ppa:ansible/ansible
sudo apt-get update
sudo apt install ansible -y

# Install Docker
curl -fsSL get.docker.com -o get-docker.sh
sh get-docker.sh
sudo usermod -aG docker vagrant

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install Package
sudo apt update
sudo sudo apt install -y python-pip
# sudo sudo apt install -y python3-pip
sudo pip install pyrsistent==0.16.1
sudo pip install docker-compose
