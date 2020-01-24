#!/bin/bash

cd unturned

cp -f linux64/steamclient.so Unturned_Headless_Data/Plugins/x86_64/steamclient.so

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:`dirname $0`/Unturned_Headless_Data/Plugins/x86_64/

export TERM=xterm

./Unturned_Headless.x86_64 -batchmode -nographics -NoDefaultConsole +InternetServer/unturned
