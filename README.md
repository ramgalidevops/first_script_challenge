# Passwd Monitor Script

This repository provides a simple script that monitors the `/etc/passwd` file for changes.

## Features

- Detects modifications to `/etc/passwd`
- Logs changes to `/var/log/passwd_monitor.log`
- Uses SHA256 checksums for change detection
- Runs automatically every 15 minutes via cron

## Installation

1. Copy the script  

`sudo cp check_passwd_changes.sh /usr/local/bin/  `
`sudo chmod +x /usr/local/bin/check_passwd_changes.sh  `

2. Install cron job  

`sudo cp passwd_monitor /etc/cron.d/`

3. Ensure log file is writable

`sudo touch /var/log/passwd_monitor.log`

## Cron Schedule

Runs every 15 minutes:

*/15 * * * * root /usr/local/bin/check_passwd_changes.sh
