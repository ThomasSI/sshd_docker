#!/bin/bash

rootpw="$ROOTPW"

echo "$rootpw"

echo echo  ${#rootpw}

file="/rootpass/rootpw"

if [ ${#rootpw} -ge 5 ]
then
    echo "Set new root pw"
    echo "rootpw set to: $rootpw"

    echo "root:$rootpw" | chpasswd
    echo $newrootpw > "$file"
else
    echo "Check for existing rootpw."
    if [ -f "$file" ]
    then
        echo "rootpw is already set execute sshd..."
    else
        echo "renerate new rootpw an create file with it..."
        newrootpw=$(cat /dev/urandom | tr -dc 'a-zA-Z' | fold -w 10 | head -n 1)
        echo "root:$newrootpw" | chpasswd

        echo "rootpw set to: $newrootpw"
        echo $newrootpw > "$file"
    fi

fi


exec "/usr/sbin/sshd" "-D"