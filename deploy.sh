#!/bin/bash
jekyll build
echo "-- Step 1: deploy to the WebServer"
# Read Password
#echo -n Password: 
#read -s password
rsync -avz -zz --rsh="sshpass -p 123456a ssh -p 22022" _site/ root@192.168.1.1:/etc/lighttpd/www.tvrouter.org/
echo "-- Step 2: grab punbb from the webserver"
rsync -avz -zz --rsh="sshpass -p 123456a ssh -p 22022" root@192.168.1.1:/etc/lighttpd/forum.tvrouter.org ../
echo "-- Done. Now would it be great if you git pull it ?"

#scp -r _site/* root@192.168.1.1:/etc/lighttpd/

