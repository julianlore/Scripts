#!/usr/bin/env bash
# Modified from https://techoverflow.net/2013/10/22/docker-remove-all-images-and-containers/
# Delete all containers
sudo docker rm $(sudo docker ps -a -q)
# Delete all images
sudo docker rmi $(sudo docker images -q)
