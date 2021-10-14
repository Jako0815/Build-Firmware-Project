#!/bin/bash

# Skript das die SD Karte Demounted
# Automat @ 2021 J-Projekt
# Autor: Jakob Pröm

source Config

clear

Drive_Location=$1;

echo "Laufwerk: ${Drive_Location}"

echo "Synchronisiere die SD Karte"
echo "Das kann dauern..."

sync

umount -f ${MOUNT__DIR}boot ${MOUNT__DIR}root ${MOUNT__DIR}rescue ${MOUNT__DIR}image ${MOUNT__DIR}config ${IMAGE_LOCATION}boot ${IMAGE_LOCATION}root
umount -f "/dev/${Drive_Location}1"
umount -f "/dev/${Drive_Location}2"
umount -f "/dev/${Drive_Location}3"
umount -f "/dev/${Drive_Location}5"
umount -f "/dev/${Drive_Location}6"
sleep 1

