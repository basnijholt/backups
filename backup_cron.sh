#!/usr/bin/env bash

if test `find "last_backup.txt" -mmin +1440`
then
  backup_commands.sh
  echo "Last backup on $(date)" > last_backup.txt
fi
