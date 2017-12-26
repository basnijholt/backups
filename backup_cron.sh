export rtb=$HOME/dotfiles/rsync-time-backup

if test `find "last_backup.txt" -mmin +1440`
then
  $rtb/backup_commands.sh
  echo "Last backup on $(date)" > last_backup.txt
fi
