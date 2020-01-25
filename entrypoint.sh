#!/bin/bash
sleep 1

cd /home/container

./steam/steamcmd.sh +@sSteamCmdForcePlatformBitness 64 +login anonymous +force_install_dir /home/container/unturned +app_update 1110390 +quit

rm -r /home/container/unturned/Modules
cp -r /Modules /home/container/unturned/Modules

mkdir /home/container/unturned/Servers/unturned
ln -s /home/container/unturned/Servers/unturned /home/container/server

cp /start.sh ./start.sh
chmod 777 start.sh

MODIFIED_STARTUP=$(eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
echo ":/home/container$ ${MODIFIED_STARTUP}"

${MODIFIED_STARTUP}
