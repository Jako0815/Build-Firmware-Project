#!/bin/bash

# Skript das die SD Karte Demounted
# Automat @ 2021 J-Projekt
# Autor: Jakob Pröm

source Config

clear

Drive_Location=$1;

echo -e "\e[32mDatei Kopier Skript\e[0m"

echo "Laufwerk: ${Drive_Location}"

echo "Dieses Skript kopiert die Dateien zur SD-Karte"

read -p "Fortfahren? (y/n): " -n 1 -r
echo    # (optional) move to a new line
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi



read -p "Boot Image schreiben? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rsync -av --no-o --no-g ${IMAGE_LOCATION}boot/ ${MOUNT__DIR}boot/
fi

sync


read -p "Root schreiben? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rsync -av --no-o --no-g ${IMAGE_LOCATION}root/ ${MOUNT__DIR}root/
fi

sync

read -p "Rescue Root schreiben? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rsync -av --no-o --no-g ${IMAGE_LOCATION}root/ ${MOUNT__DIR}rescue/
fi






sync





read -p "Boot Patchen? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rsync -av --no-o --no-g ${DATA_DIR}boot/ ${MOUNT__DIR}boot/
fi

sync


read -p "Root + Rescue Patchen? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rsync -av --no-o --no-g ${DATA_DIR}root+rescue/ ${MOUNT__DIR}root/
	rsync -av --no-o --no-g ${DATA_DIR}root+rescue/ ${MOUNT__DIR}rescue/
fi

sync



read -p "Root Patchen? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rsync -av --no-o --no-g ${DATA_DIR}root/ ${MOUNT__DIR}root/
fi

sync


read -p "Rescue Root Patchen? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rsync -av --no-o --no-g ${DATA_DIR}rescue/ ${MOUNT__DIR}rescue/
fi

sync

read -p "Image Patchen? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rsync -av --no-o --no-g ${DATA_DIR}image/ ${MOUNT__DIR}image/
fi

sync


read -p "Config Patchen? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
	rsync -av --no-o --no-g ${DATA_DIR}config/ ${MOUNT__DIR}config/
fi

sync
