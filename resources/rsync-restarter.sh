#!/bin/bash
#https://superuser.com/a/302843

while [ 1 ]
do
    rsync -avz --partial source dest
    if [ "$?" = "0" ] ; then
        echo "rsync completed normally"
        exit
    else
        echo "Rsync failure. Backing off and retrying..."
        sleep 180
    fi
done
