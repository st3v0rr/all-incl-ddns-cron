#!/bin/bash

echo "Cron Docker container has been started"

declare -p | grep -Ev 'BASHOPTS|BASH_VERSINFO|EUID|PPID|SHELLOPTS|UID' > /container.env

echo "SHELL=/bin/bash
BASH_ENV=/container.env
*/15 * * * * /runcurl.sh > /var/log/runcurl.log 2>&1
#" > scheduler.txt

crontab scheduler.txt
crond && tail -f /dev/null