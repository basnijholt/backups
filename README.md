# Backups using [rsync-time-backup](https://github.com/laurent22/rsync-time-backup/)

I execute [`backup_cron.sh`](backup_cron.sh) every 5 minutes, however when a backup has been made in the last 12 hours, no new backup will be made.

In [`backup_commands.sh`](backup_commands.sh) (which is called by [`backup_cron.sh`](backup_cron.sh)) I specify all folders I want to backup and the conditions under which it should run, e.g. needs to be on my WiFi and my external disk needs to be connected.

## What is so special about this?

Absolutely nothing. I just had some specific requirement as to when I can or need to make a backup and thought it might serve as an example to others. In short, I have an external drive that I backup to a Raspberry Pi and I can only do so when I am connected to my network and the disk is connected.


I add this to my crobtab, with `crontab -e`:
```bash
*/5 * * * * $HOME/dotfiles/rsync-time-backup/backup_cron.sh >> $HOME/dotfiles/rsync-time-backup/log.txt
```