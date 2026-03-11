#!/bin/bash

PASSWD_FILE="/etc/passwd"
HASH_FILE="/var/tmp/passwd_hash"
LOG_FILE="/var/log/passwd_monitor.log"

# Generate current checksum
CURRENT_HASH=$(sha256sum $PASSWD_FILE | awk '{print $1}')

# If hash file does not exist, create it
if [ ! -f $HASH_FILE ]; then
    echo $CURRENT_HASH > $HASH_FILE
    echo "$(date) - Initial baseline created for /etc/passwd" >> $LOG_FILE
    exit 0
fi

# Read stored checksum
STORED_HASH=$(cat $HASH_FILE)

# Compare hashes
if [ "$CURRENT_HASH" != "$STORED_HASH" ]; then
    echo "$(date) - ALERT: /etc/passwd has changed!" >> $LOG_FILE
    
    # Update stored hash
    echo $CURRENT_HASH > $HASH_FILE
fi
