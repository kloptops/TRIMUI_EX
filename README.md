# TRIMUI EX

This is a simple framework that will be used to bootstrap PortMaster.

## Installation Instructions

### With a blank fat32 formatted sdcard copy:

***No seriously, a blank one. I mean it.***

Copy the following to the root of the blank sdcard:

- TrimUI Firmware: [trimui_tg5040.awimg](https://github.com/trimui/firmware_smartpro/releases/tag/v1.0.4) _Download trimui_tg5040_20240401_v1.0.4.7z_
- PortMaster TrimUI Beta: [trimui.portmaster.zip](https://github.com/kloptops/TRIMUI_EX/releases/latest/download/trimui.portmaster.zip)

Then download and **unzip** the [TRIMUI_EX.zip](https://github.com/kloptops/TRIMUI_EX/releases/latest/download/TRIMUI_EX.zip) to the root of the sdcard.

### Start your device:

We need to flash a fresh firmware, I am going to fuck shit up to make it better.

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

# Thanks

Thanks to:

- [tGecko](https://github.com/tGecko/TrimUI-Smart-Pro-resources?tab=readme-ov-file#startup-script) with their guide to the startup scripts and setting the mac address.
- `@_xk_` on the RGH discord for [their compiled version of dropbear](https://discord.com/channels/529983248114122762/1054333456928219167/1174827982406299768)
- [Cebion](https://github.com/cebion) for testing everything.
- [Tech Toy Tinker](https://techtoytinker.com) for helping out with the device and testing.
- [Sleepy](https://www.youtube.com/@S1eepy1) for pointing out the device and help with funding dev devices :heart:.
- [PortMaster](https://discord.gg/SbVcUM4qFp) - The whole crew for being so awesome and supportive.
