#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 source_directory destination_directory"
  exit 1
fi

# To Create a backup with timestamp
timestamp=$(date +%Y%m%d_%H%M%S)
backup_filename="backup_$timestamp.tar.gz"
tar -czf "$2/$backup_filename" "$1"

echo "Backup created: $2/$backup_filename"
