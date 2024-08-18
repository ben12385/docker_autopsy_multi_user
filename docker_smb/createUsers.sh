#!/bin/bash

file=$(cat /tmp/listOfUsers)
for line in $file
do
    echo $line
    IFS=":" read -a userData <<< $line
    username=${userData[0]}
    password=${userData[1]}

    useradd -M -s /sbin/nologin $username
    echo ${username}:${password} | chpasswd
    (echo $password; echo $password) | smbpasswd -a $username -s
done

