#!/bin/bash

# Skript das dass Filesystem anpasst
# Automat @ 2021 J-Projekt
# Autor: Jakob Pröm

source Config

clear

Drive_Location=$1;

echo -e "\e[34mFilesystem Edit Skript\e[0m"

echo "Laufwerk: ${Drive_Location}"

echo "Dieses Skript verändert die größe der Partition"
echo "und erstellt eine neue Partition"

read -p "Fortfahren? (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi


#Hänge die Laufwerke aus
umount  "/dev/${Drive_Location}1"
umount  "/dev/${Drive_Location}2"
umount  "/dev/${Drive_Location}3"
umount  "/dev/${Drive_Location}4"
umount  "/dev/${Drive_Location}5"

umount -f ${MOUNT__DIR}boot ${MOUNT__DIR}root ${MOUNT__DIR}config


# Lösche alle Signaturen
wipefs --all --force /dev/${Drive_Location}


# Erstelle den Table

echo "o
n
p
1

+${BOOT_PARTITION_SIZE}

t
c


n
p
2

+${ROOT_PARTITION_SIZE}

n
p
3

+${RESCUE_PARTITION_SIZE}

n
e



n

+${IMAGE_PARTITION_SIZE}

n

+${CONFIG_PARTITION_SIZE}
t
6
0b
c


w" | fdisk /dev/${Drive_Location}


# Erstelle die Datei-Systeme
mkfs.vfat "/dev/${Drive_Location}1"
mkfs.vfat "/dev/${Drive_Location}6"

mkfs.ext4 -F "/dev/${Drive_Location}2"
mkfs.ext4 -F "/dev/${Drive_Location}3"
mkfs.ext4 -F "/dev/${Drive_Location}5"









# Bennene die Partitionen um

fatlabel "/dev/${Drive_Location}1" ${BOOT_PARTITION_NAME}
e2label "/dev/${Drive_Location}2" ${ROOT_PARTITION_NAME}
e2label "/dev/${Drive_Location}3" ${RESCUE_PARTITION_NAME}
e2label "/dev/${Drive_Location}5" ${IMAGE_PARTITION_NAME}
fatlabel "/dev/${Drive_Location}6" ${CONFIG_PARTITION_NAME}

sleep 10
