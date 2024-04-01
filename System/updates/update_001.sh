#!/bin/sh

# HEADER
mkdir -p /etc/ex_update
UPDATE_DIR="/mnt/SDCARD/System/updates/$(basename "$0" | cut -d'.' -f 1)"
UPDATE_ID="$(basename "$UPDATE_DIR" | cut -d'_' -f 2)"

if [ -f "/etc/ex_update/$UPDATE_ID" ]; then
    exit 0
fi

echo "--------------------------------------------"
echo "Running $0"
echo "- $UPDATE_DIR"
echo "- $UPDATE_ID"

# CONTENT

# Add ssl certs.
mkdir -p /etc/ssl/certs/
cp -vf "$UPDATE_DIR/ca-certificates.crt" /etc/ssl/certs/

# Install new busybox
cp -vf /bin/busybox /bin/busybox.bak
cp -vf "$UPDATE_DIR/busybox" /bin/busybox

# Create missing busybox commands
for cmd in $(busybox --list); do
    # Skip if command already exists or if it's not suitable for linking
    if [ -e "/bin/$cmd" ] || [ -e "/usr/bin/$cmd" ] || [ "$cmd" = "sh" ]; then
        continue
    fi

    # Create a symbolic link
    ln -vs "/bin/busybox" "/usr/bin/$cmd"
done

unzip -o -d "/mnt/SDCARD/System/" "$UPDATE_DIR/python.zip" > /mnt/SDCARD/System/updates/python.log

# FOOTER
echo "Done!"
touch "/etc/ex_update/$UPDATE_ID"
