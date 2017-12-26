#!/usr/bin/env bash

# Get WiFi SSID from https://stackoverflow.com/a/4481019/3447047
export SSID="`airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'`"

# Folder
export rtb=$HOME/dotfiles/rsync-time-backup


# Backup Seafile folder local to 4TB
if [[ -d /Volumes/4TB ]]; then 
  $rtb/rsync_tmbackup.sh $HOME/Seafile /Volumes/4TB/Backup-Seafile $rtb/excluded_patterns.txt
fi


## Backup Seafile folder to 2TB @ RPi
if [[ $SSID = 'Kwalitijd-Safe' ]]; then
  $rtb/rsync_tmbackup.sh $HOME/Seafile root@192.168.31.3:/media/usb/Backup-Seafile $rtb/excluded_patterns.txt
fi


# 4TB to 2TB @ RPi
if [[ (-d /Volumes/4TB) && ($SSID == 'Kwalitijd-Safe') ]]; then 
  for folder in Encrypted Film Games iTunes Photos Websites; do
      $rtb/rsync_tmbackup.sh /Volumes/4TB/$folder root@192.168.31.3:/media/usb/Backup-$folder $rtb/excluded_patterns.txt
  done 
fi
