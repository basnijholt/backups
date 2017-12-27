#!/usr/bin/env bash

DIRECTORY=$(cd `dirname $0` && pwd)
cd $DIRECTORY

if test `find "last_backup.txt" -mmin +1440`
then
  ./backup_commands.sh && echo "Last backup on $(date)" > last_backup.txt
fi
