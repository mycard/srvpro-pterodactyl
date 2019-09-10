#!/bin/bash
cd /home/container

# motd
cat /home/motd.txt | envsubst

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"
#curl https://raw.githubusercontent.com/Pterodactyl-CN/images/master/ad.txt
# Run the Server
eval ${MODIFIED_STARTUP}
