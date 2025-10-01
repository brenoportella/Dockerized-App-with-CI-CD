#!/bin/bash
set -e

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y docker.io curl

if ! command -v docker-compose &> /dev/null; then
    echo "Docker Compose not found. Installing..."
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" \
        -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
fi

sudo docker pull ghcr.io/brenoportella/projectb-app:latest

[ ! -f docker-compose.yml ] && \
    curl -O https://raw.githubusercontent.com/brenoportella/Dockerized-App-with-CI-CD/main/docker-compose.yml

sudo docker-compose up -d

sudo docker-compose ps