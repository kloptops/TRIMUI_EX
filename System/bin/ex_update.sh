#!/bin/sh

UPDATES_DIR="/mnt/SDCARD/System/updates/"

RESTORE_DIR="$(cwd)"
cd "$UPDATES_DIR" || exit 1

for script in $(ls -1v update_*.sh); do
    sh "$script" >> "$UPDATES_DIR/update.log"
done

cd "$RESTORE_DIR"

if [ -f "/mnt/SDCARD/trimui.portmaster.zip" ]; then
    echo "Updating PortMaster" >> "$UPDATES_DIR/update.log"
    unzip -o -d "/mnt/SDCARD/" "/mnt/SDCARD/trimui.portmaster.zip" >> "$UPDATES_DIR/update.log"
    rm -f "/mnt/SDCARD/trimui.portmaster.zip" >> "$UPDATES_DIR/update.log"
fi
