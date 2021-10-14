#!/bin/bash

# Mounte die Laufwerke...
# Automat @ 2021 J-Projekt
# Autor: Jakob Pröm

source Config

clear

Drive_Location=$1;

echo -e "\e[32mMounting Skript\e[0m"

echo "Laufwerk: ${Drive_Location}"


if [ -d "${MOUNT__DIR}boot" ] 
then
    echo "Boot Ordner wurde erstellt..." 
else
    echo "Erstelle Boot Ordner..."
    mkdir "${MOUNT__DIR}boot"
fi

if [ -d "${MOUNT__DIR}root" ] 
then
    echo "Root Ordner wurde erstellt..." 
else
    echo "Erstelle Root Ordner..."
    mkdir "${MOUNT__DIR}root"
fi

if [ -d "${MOUNT__DIR}rescue" ] 
then
    echo "Rescue Ordner wurde erstellt..." 
else
    echo "Erstelle Rescue Ordner..."
    mkdir "${MOUNT__DIR}rescue"
fi

if [ -d "${MOUNT__DIR}image" ] 
then
    echo "Image Ordner wurde erstellt..." 
else
    echo "Erstelle Image Ordner..."
    mkdir "${MOUNT__DIR}image"
fi


if [ -d "${MOUNT__DIR}config" ] 
then
    echo "Config Ordner wurde erstellt..." 
else
    echo "Erstelle Config Ordner..."
    mkdir "${MOUNT__DIR}config"
fi


echo "Mounte Dateisysteme..."

mount "/dev/${Drive_Location}1" ${MOUNT__DIR}boot

mount "/dev/${Drive_Location}2" ${MOUNT__DIR}root

mount "/dev/${Drive_Location}3" ${MOUNT__DIR}rescue

mount "/dev/${Drive_Location}5" ${MOUNT__DIR}image

mount "/dev/${Drive_Location}6" ${MOUNT__DIR}config

sleep 10

