#!/bin/sh

UPDATES_DIR="/mnt/SDCARD/System/updates/"

RESTORE_DIR="$(cwd)"
cd "$UPDATES_DIR" || exit 1

for script in $(ls -1v update_*.sh); do
    sh "$script" >> "$UPDATES_DIR/update.log"
done

cd "$RESTORE_DIR"

if [ -f "/mnt/SDCARD/trimui.portmaster.zip" ]; then
    sdl2imgshow \
        -i "$EX_RESOURCE_PATH/background.png" \
        -f "$EX_RESOURCE_PATH/DejaVuSans.ttf" \
        -s 48 \
        -c "0,0,0" \
        -t "Installing PortMaster" &

    echo "Updating PortMaster" >> "$UPDATES_DIR/update.log"
    unzip -o -d "/mnt/SDCARD/" "/mnt/SDCARD/trimui.portmaster.zip" >> "$UPDATES_DIR/update.log"
    rm -f "/mnt/SDCARD/trimui.portmaster.zip" >> "$UPDATES_DIR/update.log"

    mkdir -p /roms/ports/PortMaster/
    cp /mnt/SDCARD/Apps/PortMaster/PortMaster/control.txt /roms/ports/PortMaster/control.txt

    pkill -f sdl2imgshow
fi
