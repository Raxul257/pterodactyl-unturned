#!/bin/bash
sleep 1

cd /home/container

./steam/steamcmd.sh +@sSteamCmdForcePlatformBitness 64 +login anonymous +force_install_dir /home/container/unturned +app_update 1110390 +quit

curl -o Rocket.zip -L "https://github.com/RocketMod/Rocket.Unturned/releases/download/4.9.3.0/Rocket.Unturned.zip"
unzip -o -q Rocket.zip
rm Rocket.zip
cp /home/container/Modules /home/container/unturned/Modules

rm -r Modules/
rm -r Scripts/

MODIFIED_STARTUP=$(eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g'))
echo ":/home/container$ ${MODIFIED_STARTUP}"

cp /start.sh ./start.sh
chmod 777 start.sh

${MODIFIED_STARTUP}
