# Backups using [rsync-time-backup](https://github.com/laurent22/rsync-time-backup/tree/c313e0a322a6a0b8fc233bf7e272ab0230c35d1b)

I execute [`backup_cron.sh`](backup_cron.sh) every 5 minutes, however when a backup has been made in the last 12 hours, no new backup will be made.

In [`backup_commands.sh`](backup_commands.sh) (which is called by [`backup_cron.sh`](backup_cron.sh)) I specify all folders I want to backup and the conditions under which it should run, e.g. needs to be on my WiFi and my external disk needs to be connected.
