#!/bin/bash

# Stop the Docker service
sudo systemctl stop docker

# Backup the original Docker daemon configuration file
sudo cp /etc/docker/daemon.json /etc/docker/daemon.json.bak

# Update the Docker daemon configuration to use the local logging driver
sudo sed -i 's/"log-driver": "[^"]*"/"log-driver": "local"/' /etc/docker/daemon.json

# Start the Docker service
sudo systemctl start docker

# Check Docker daemon configuration
echo "Checking Docker daemon configuration:"
cat /etc/docker/daemon.json

# Check active logging driver
echo "Checking active logging driver:"
sudo docker info | grep 'Logging Driver'

# Restart Docker service (optional, uncomment if needed)
# sudo systemctl restart docker
