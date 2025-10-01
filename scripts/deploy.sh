#!/bin/bash
set -e

sudo apt-get update && sudo apt-get upgrade -y

sudo apt-get install -y docker.io curl

docker pull ghcr.io/<username>/projectb-web:latest

[ ! -f docker-compose.yml ] && \
    curl -O https://raw.githubusercontent.com/<username>/Dockerized-WEB-APP---CI-CD/main/docker-compose.yml

docker-compose up -d --build

docker-compose ps