#!/bin/bash

cd /home/steam/

./steamcmd.sh +login anonymous +force_install_dir /home/steam/valheimserver +app_update 896660 validate +exit

cp -v /home/steam/valheim/start_valheim.sh /home/steam/valheimserver/start_valheim.sh

cd /home/steam/valheimserver/

./start_valheim.sh

