#!/bin/bash
echo "Cleaning up Docker environment..."

# Take down any existing setup
sudo docker compose down

# Stop all running containers
sudo docker stop $(sudo docker ps -a -q) 2>/dev/null || true

# Remove all containers
sudo docker rm $(sudo docker ps -a -q) 2>/dev/null || true

# Remove all networks
sudo docker network rm $(sudo docker network ls -q) 2>/dev/null || true

# Prune everything
sudo docker system prune -a -f --volumes

# Restart Docker service
sudo systemctl restart docker

echo "Docker environment cleaned up."