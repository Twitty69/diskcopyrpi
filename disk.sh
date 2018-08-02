#!/bin/sh

# Choix de la partition a monter

read -p 'Entrez la partition voulue :' part
# Création du dossier temp pour la partition final
mkdir /tmp/usb_root
# Création du dossier tmp pour la partition /
mkdir /tmp/sd_root
# Monte la partiton finale
mount $part /tmp/usb_root
#Monte la partition /
mount --bind / /tmp/sd_root/
#verification de rsync
apt install rsync
#sychronisation
cd /
rsync -avh --exclude '/tmp' /tmp/sd_root /tmp/usb_root
mkdir /tmp/usb_root/tmp
chmod 777 /tmp/usb_root/tmp


