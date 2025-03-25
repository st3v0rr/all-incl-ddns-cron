#!/bin/bash

echo "Docker container has been started"

cleanup() {
    echo "Signal empfangen, Container wird beendet..."
    exit 0
}

trap cleanup SIGTERM SIGINT

touch /var/log/runcurl.log

echo "Starting periodic execution loop..."
while true; do
    MINUTES=$((10#$(date +%M)))
    SECONDS=$((10#$(date +%S)))

    if [ $((MINUTES % 15)) -eq 0 ] && [ $SECONDS -lt 10 ]; then
        echo "Executing runcurl.sh at $(date)" >> /var/log/runcurl.log
        /app/runcurl.sh >> /var/log/runcurl.log 2>&1
    fi

    sleep 9
done
