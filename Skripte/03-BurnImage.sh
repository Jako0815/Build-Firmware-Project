#!/bin/bash

# Skript das Manjaro Herunterlädt und Installiert
# Automat @ 2021 J-Projekt
# Autor: Jakob Pröm

source Config

clear

Drive_Location=$1;

echo -e "\e[32mManjaro Installations Skript\e[0m"

echo "Dieses Skript lädt Manjaro runter und Extrahiert es"

read -p "Weitermachen? (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi


if test -f "${IMAGE_LOCATION}${IMAGE_FILE}.xz"; then
    echo "Image exists."
else
	echo "Image nicht gefunden... Lade herunter..."
	wget -O "${IMAGE_LOCATION}${IMAGE_FILE}.xz" $IMAGE_URL 
fi


echo "${IMAGE_CHECKSUM}  ${IMAGE_LOCATION}${IMAGE_FILE}.xz"|sha256sum --status -c
if [ "$?" == "0" ]; then
	echo "Checksumme Passt, mache weiter..."
else
	echo "Checksumme ist falsch, lade erneut herunter..."
	rm "${IMAGE_LOCATION}${IMAGE_FILE}.xz"
	wget -O "${IMAGE_LOCATION}${IMAGE_FILE}.xz" $IMAGE_URL 
	
	echo "${IMAGE_CHECKSUM}  ${IMAGE_LOCATION}${IMAGE_FILE}.xz"|sha256sum --status -c
	if [ "$?" == "0" ]; then
		echo "Checksumme Passt, mache weiter..."
	else
		echo "Checksumme ist falsch, Entweder ist das Image fehlerhaft, oder die Checksumme flash"
		read -p "Weitermachen? (y/n): " -n 1 -r
		echo    # (optional) move to a new line
		if [[ ! $REPLY =~ ^[Yy]$ ]]
		then
 		   exit 1
		fi
	fi
	
fi



if test -f "${IMAGE_LOCATION}${IMAGE_FILE}"; then
    echo "Image exists."
else
	echo "Image IMG nicht gefunden... Extrahiere"
	7z x "${IMAGE_LOCATION}${IMAGE_FILE}.xz" -y -o"${IMAGE_LOCATION}"
fi




if test -f "${IMAGE_LOCATION}1.img"; then
    echo "Image exists."
else
	echo "Image nicht gefunden... Extrahiere"
	7z x "${IMAGE_LOCATION}${IMAGE_FILE}" -y -o"${IMAGE_LOCATION}"
fi


if [ -d "${IMAGE_LOCATION}boot" ] 
then
    echo "Boot Ordner wurde erstellt..." 
else
    echo "Erstelle BOOT Ordner..."
    mkdir "${IMAGE_LOCATION}boot"
fi



if [ -d "${IMAGE_LOCATION}root" ] 
then
    echo "Root Ordner wurde erstellt..." 
else
    echo "Erstelle ROOT Ordner..."
    mkdir "${IMAGE_LOCATION}root"
fi

mount -o loop "${IMAGE_LOCATION}0.fat" "${IMAGE_LOCATION}boot"

mount -o loop "${IMAGE_LOCATION}1.img" "${IMAGE_LOCATION}root"






sync


