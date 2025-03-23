#!/bin/bash

DATE_TIME=$(date '+%d/%m/%Y %H:%M:%S');

echo "IP Update - $DATE_TIME"
echo "User: $CURL_USERNAME"
curl -s -u $CURL_USERNAME:$CURL_PASSWORD https://dyndns.kasserver.com/\?myip=`curl -s https://tools.steve4u.de/ip.php`
echo -e "\n IP Update complete"
