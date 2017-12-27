#!/usr/bin/env bash

# Get WiFi SSID from https://stackoverflow.com/a/4481019/3447047
export SSID="`airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'`"
export MY_NETWORK='Kwalitijd-Safe'

# rsync-time-backup script
export rtb=$HOME/dotfiles/rsync-time-backup/rsync-time-backup/rsync_tmbackup.sh


# Backup Seafile folder from local to 4TB
if [[ -d /Volumes/4TB ]]; then 
  $rtb $HOME/Seafile /Volumes/4TB/Backup-Seafile excluded_patterns.txt
fi


## Backup Seafile folder to 2TB @ RPi
if [[ $SSID = $MY_NETWORK ]]; then
  $rtb $HOME/Seafile root@192.168.31.3:/media/usb/Backup-Seafile excluded_patterns.txt
fi


# 4TB to 2TB @ RPi
if [[ (-d /Volumes/4TB) && ($SSID == $MY_NETWORK) ]]; then 
  for folder in Encrypted Film Games iTunes Photos Websites; do
      $rtb /Volumes/4TB/$folder root@192.168.31.3:/media/usb/Backup-$folder excluded_patterns.txt
  done 
fi
