#!/bin/bash
cd /home/container

# Output Current Java Version
node -v ## only really needed to show what version is being used. Should be changed for different applications

#cd /home/container/windbot
#git fetch origin master
#git reset --hard FETCH_HEAD
#xbuild /property:Configuration=Release /property:TargetFrameworkVersion=v4.5

#cd /home/container/ygopro
#git fetch origin server
#git reset --hard FETCH_HEAD
#git submodule foreach git fetch origin master
#git submodule foreach git reset --hard FETCH_HEAD
#./premake5 gmake
#cd build
#make config=release
#cd ..
#strip ygopro

#cd /home/container/ygopro-server
#git fetch origin master
##git reset --hard FETCH_HEAD
#npm install

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"
#curl https://raw.githubusercontent.com/Pterodactyl-CN/images/master/ad.txt
# Run the Server
eval ${MODIFIED_STARTUP}
