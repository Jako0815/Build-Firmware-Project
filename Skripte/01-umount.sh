#!/bin/bash

# Skript das die SD Karte Demounted
# Automat @ 2021 J-Projekt
# Autor: Jakob Pröm

source Config

clear
# Location des Laufwerkes
Drive_Location=$1;

echo "Laufwerk: ${Drive_Location}"
#
umount -f "/dev/${Drive_Location}"
umount -f ${MOUNT__DIR}boot ${MOUNT__DIR}root ${MOUNT__DIR}rescue ${MOUNT__DIR}image ${MOUNT__DIR}config 

sleep 1

