#!/bin/bash
# Backup /etc to Azure Blob

TIMESTAMP=$(date +%F)
BACKUP_FILE="/tmp/etc-backup-$TIMESTAMP.tar.gz"
tar -czf $BACKUP_FILE /etc

az storage blob upload \
  --account-name <your_storage_account> \
  --container-name backups \
  --file $BACKUP_FILE \
  --name etc-backup-$TIMESTAMP.tar.gz
