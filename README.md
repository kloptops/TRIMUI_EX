# TRIMUI_EX

This is a simple framework that will be used to bootstrap PortMaster. But like everything it has spiraled out of control...

## Installation Instructions

### With a blank fat32 formatted sdcard copy:

***No seriously, a blank one. I mean it.***

Copy the following to the root of the blank sdcard:

- Download latest TrimUI **Smart Pro** Firmware: [trimui_tg5040.awimg](https://github.com/trimui/firmware_smartpro/releases/latest/): Download `trimui_tg5040_20240413_v1.0.4_hotfix6.7z` and extract `trimui_tg5040.awimg` and place it at the root of sdcard.
- **OR*** Download latest TrimUI **Brick** Firmware: [trimui_](https://github.com/trimui/firmware_brick/releases/latest/): Download `firmware_BRICK_tg3040_20241215_v1.0.6.zip` and extract `trimui_tg3040.awimg` and place it at the root of the sdcard.

The above filenames may change as newer firmware is released.

- PortMaster TrimUI Release: [trimui.portmaster.zip](https://github.com/PortsMaster/PortMaster-GUI/releases/latest/download/trimui.portmaster.zip), place it simply in the root of the sdcard. Do not unzip.

Then download and **unzip** the [TRIMUI_EX.zip](https://github.com/kloptops/TRIMUI_EX/releases/latest/download/TRIMUI_EX.zip) to the root of the sdcard.

Your SDCARD should look like this:

```
SDCARD/
├── Emus/
├── Imgs/
├── Roms/
├── System/
├── trimui_tg????.awimg    -- actual name depends on device / version
└── trimui.portmaster.zip
```

### Start your device:

We need to flash a fresh firmware, I am going to reset everything to make it better.

With the device off, **HOLD POWER + VOL DOWN** until you see the logo, release **POWER**, when you see the green progress bar release **VOL DOWN**.

This will flash fresh firmware. Your device will boot and then it will hopefully show a fancy splash screen. This is my scripts doing its magic. Eventually it will turn on and everything is setup.

This process can take a minute or two. :smile:

## Update Instructions

Download the latest [TRIMUI_EX.zip](https://github.com/kloptops/TRIMUI_EX/releases/latest/download/TRIMUI_EX.zip) and unzip it over the existing contents on your SDCAARD. It should just work.

## Enjoy

From there it should be all setup, PortMaster is under apps, Ports get installed into Roms.

I have added SFTPgo so you can access your files from the web browser, the url is `http://<ipaddress>:8080/`, you can also sftp on port `2022`.

- Username: `trimui`
- Password: `trimui`

We now have working scp (via /usr/libexec/sftp-server) so you can also do:

`scp <filehere> root@<ipaddress>:` the password will be `tina` (not my choice)

The device will keep it's mac address too so you can give it a static ip address.

You can check PortMaster under options for your devices IP Address (on the default theme).

----

If you enjoy this [send me a few dollars](https://ko-fi.com/kloptops/) or consider donating to [PortMaster's open collective](https://opencollective.com/portmaster/) which helps us buy devices like the TrimUI Smart Pro for development.

## How this works:

I have provided my own updated version of busybox, I then link any busybox applets that are missing to `/usr/bin`. We then link `/usr/trimui/lib/libSDL*` to `/usr/lib`, so that regular programs can find it.

I have then included my own compiled version of python 3.11.8, and various programs that PortMaster scripts require.

## Who can use this?

Anyone can, please cut up and use whatever you want or need. I however will provide no support outside of [PortMaster](https://portmaster.games/).

# Things included and working:

- [x] bash\*
- [x] nano
- [x] pkill
- [x] python3
- [x] scp/sftp
- [x] ssh/dropbear
- [x] wget
- [x] zip

\* Not actually bash, but is busybox `ash`, but it aliases correctly and mostly works.

# Projects used:

- [busybox](https://busybox.net)
- [dropbear for ssh](https://sftpgo.comhttps://matt.ucc.asn.au/dropbear/dropbear.html)
- [graphicsmagick](http://www.graphicsmagick.org)
- [greenend sftp server for scp](https://www.greenend.org.uk/rjk/sftpserver/)
- [ldd](https://github.com/lattera/glibc/blob/master/elf/ldd.bash.in)
- [micro](https://micro-editor.github.io)
- [nano](https://www.nano-editor.org)
- [python3](https://www.python.org)
- [sdl2imgshow for displaying splashscreens](https://github.com/kloptops/sdl2imgshow)
- [sftpgo for sftp/webserver](https://sftpgo.com)
- [wget](https://www.gnu.org/software/wget/)
- [xz](https://github.com/kobolabs/liblzma)
- [zip](https://infozip.sourceforge.net)

# Thanks

Thanks to:

- [tGecko](https://github.com/tGecko/TrimUI-Smart-Pro-resources?tab=readme-ov-file#startup-script) with their guide to the startup scripts and setting the mac address.
- `@_xk_` on the RGH discord for [their compiled version of dropbear](https://discord.com/channels/529983248114122762/1054333456928219167/1174827982406299768)
- [Cebion](https://github.com/cebion) for testing everything.
- [Tech Toy Tinker](https://techtoytinker.com) for helping out with the device and testing.
- [Sleepy](https://www.youtube.com/@S1eepy1) for pointing out the device and help with funding dev devices :heart:.
- [PortMaster](https://discord.gg/SbVcUM4qFp) - The whole crew for being so awesome and supportive.




Another fairly big update to PortMaster on TrimUI, we now have optional support for the Ports tab.

## Changes:

- Port files are moved to `Data/ports`
- Ports can either live in `Roms/PORTS/` or `Apps/`.
- Autoinstall now works, place port zips into `Apps/PortMaster/PortMaster/autoinstall` and it will install them correctly.

## `Ports tab` vs `Roms section`

You can swap back and forth whenever you like, PortMaster will do the magic necessary to move everything back. In PortMaster go to `Options` -> `Ports Location:` to toggle the location.

## Small bug

PortMaster will ask to update, in older versions you have press "b" to accept the update, this makes appear like the program isnt updating.

## Updating

PortMaster should just update by itself, but `TRIMUI_EX` has been updated to `v0.0.2c`, it includes a few extra libs and `gdb`. Download the latest [TRIMUI_EX.zip](https://github.com/kloptops/TRIMUI_EX/releases/latest/download/TRIMUI_EX.zip) here and unzip it over your install on the SDCARD.

## Installing

For full installation instructions head here: https://github.com/kloptops/TRIMUI_EX/
