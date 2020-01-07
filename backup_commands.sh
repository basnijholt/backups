#!/usr/bin/env bash

# Check if the script is already running
# https://stackoverflow.com/a/45429634/3447047
if ps ax | grep $0 | grep -v $$ | grep bash | grep -v grep
then
    echo "The script is already running."
    exit 1
fi

# Get WiFi SSID from https://stackoverflow.com/a/4481019/3447047
export SSID="`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport -I | awk '/ SSID/ {print substr($0, index($0, $2))}'`"
export MY_NETWORK='Baby love'

# rsync-time-backup script
DIRECTORY=$(cd `dirname $0` && pwd)
cd $DIRECTORY
export rtb=$DIRECTORY/rsync-time-backup/rsync_tmbackup.sh


# Backup Sync folder from local to 4TB
if [[ -d /Volumes/4TB ]]; then
  $rtb $HOME/Sync /Volumes/4TB/Backup-Sync excluded_patterns.txt
fi


## Backup Sync folder to 2TB @ RPi
# if [[ $SSID = $MY_NETWORK ]]; then
#   $rtb $HOME/Sync root@192.168.31.3:/media/usb/Backup-Sync excluded_patterns.txt
# fi


# 4TB to 2TB @ RPi
if [[ (-d /Volumes/4TB) && ($SSID == $MY_NETWORK) ]]; then
  for folder in Encrypted iTunes Photos Websites; do
      $rtb /Volumes/4TB/$folder root@192.168.31.3:/media/usb/Backup-$folder excluded_patterns.txt
  done
fi

# for folder in Encrypted Film Games iTunes Photos Websites; do