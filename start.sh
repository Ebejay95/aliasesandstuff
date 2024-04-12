#!/usr/bin/env bash

# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    docker_create_myubuntu.sh                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lorbke <lorbke@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/03/03 18:21:50 by lorbke            #+#    #+#              #
#    Updated: 2023/03/03 18:59:57 by lorbke           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# linux distro
DISTRO="ubuntu"

# default name of the container
IMG_NAME="minilinux"

# Dockerfile path
DOCKERFILE_DIR="$(dirname $0)"

# colors
blue=$'\033[0;34m'
cyan=$'\033[1;96m'
red=$'\033[0;31m'
reset=$'\033[0;39m'

start_docker()
{
	# start the docker daemon
	if ! [ "$(pgrep Docker)" ]
	then
		echo "${blue}Starting docker daemon...${reset}"
		open -j -g -a Docker
	fi

	# wait for the daemon to start
	until docker info > /dev/null 2>&1
	do
		sleep 1
	done
	echo "${blue}Docker daemon started${reset}"
}

build_minilinux()
{
	# build the image
	echo "${blue}Building image...${reset}"
	docker build -t $IMG_NAME $DOCKERFILE_DIR
}

run_minilinux()
{
	# create the container
	if [ ! "$(docker image ls | grep $IMG_NAME)" ]
	then
    build_minilinux
  fi
  echo "${blue}Creating container...${reset}"
  docker run -it -v $PWD:/host/ -v ~/.ssh:/root/.ssh --name $IMG_NAME -e DOCKER_CONTAINER_NAME=$IMG_NAME $IMG_NAME zsh
}

launch_minilinux()
{
	# check if the container already exists
	if [ "$(docker ps | grep $IMG_NAME)" ]
	then
    echo "${blue}Attaching to running container...${reset}"
		docker exec -it $IMG_NAME zsh
    exit 0
	elif [ "$(docker ps -a | grep $IMG_NAME)" ]
  then
		echo "${blue}Restarting Container...${reset}"
		docker start -ia $IMG_NAME
  else
		run_minilinux
	fi
}

save_minilinux()
{
	# save changes to image
	echo "${blue}Saving changes to image...${reset}"
	export CONT_ID=$(docker ps -a | grep $IMG_NAME | cut -d ' ' -f 1)
	docker commit $CONT_ID $IMG_NAME
}

clean_up_minilinux()
{
	# clean up
		# remove exited container
	docker container rm $IMG_NAME
	echo "${red}Cleaning up...${reset}"
		# remove "dangling" image layers
	docker rmi $(docker images -f "dangling=true" -q) 2>/dev/null
}

# main
start_docker
launch_minilinux
save_minilinux
clean_up_minilinux