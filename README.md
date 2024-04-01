# TRIMUI EX

This is a simple framework that will be used to bootstrap PortMaster.

# This kinda got out of hand.

The latest trimui beta firmware (which is required for PortMaster) has an extremely limited busybox install, I have replaced it with the latest version with most of the features enabled.

# Things included and working:

- [x] bash\*
- [x] nano
- [x] pkill
- [x] python3
- [ ] scp
- [x] ssh/dropbear
- [x] wget
- [x] zip

\* Not actually bash, but is busybox `ash`, but it aliases correctly and mostly works.

# Thanks

Thanks to [tGecko](https://github.com/tGecko/TrimUI-Smart-Pro-resources?tab=readme-ov-file#startup-script) with their guide to the startup scripts and setting the mac address.