#!/bin/bash

##sudo apt-get update
##sudo apt-get upgrade

## install samba
##sudo apt-get install samba samba-common-bin

## check if 
if [ ! -d "/home/pi/shared" ] 
then
 echo "create shared folder"
 sudo mkdir /home/pi/shared
else 
 echo "shared folder existing"
fi

## check for user and add to smb.conf file if necessary
if grep -Fxq "[pimylifeupshare]" /etc/samba/smb.conf
then 
 echo "user pimylifeupshare exists"
else 
 echo "user pimylifeupshare added to conf"
 sudo cat user_pimylifeupshare.txt >> /etc/samba/smb.conf
fi

## create pi user
sudo smbpasswd -a pi

## restart samba service
sudo systemctl restart smbd
