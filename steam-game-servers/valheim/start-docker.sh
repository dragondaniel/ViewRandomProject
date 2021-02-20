#!/bin/bash

NAME="shutup-valheim-server"

docker run -t -d \
	--name $NAME \
	-p 2456-2458:2456-2458/udp \
	-v /media/choi/steam/valheim:/home/steam/valheim \
	-e SERVER_NAME="odin-server-2" \
        -e WORLD_NAME="valheim-2" \
        -e SERVER_PASS="secrettest2" \
        steam:latest

sleep 2

container=$(docker ps -a| grep "$NAME"| awk '{print $1}')

docker exec $container /home/steam/valheim/install_val.sh

