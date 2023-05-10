# rpi_dac_wakeup
This repo wakes up an external DAC through GPIO of the Raspberry Pi before Picoreplayer fully boots


# Steps
## Step 1
Login into ssh shell—see Access piCorePlayer via ssh.
Turn off your DAC and then it turn on.
Type dmesg and find the string “idVendor” and “idProduct” of your DAC (they are two strings of four characters).

## Step 2
Type sudo nano /etc/udev/rules.d/10-DAC.rules and paste this string:
```
SUBSYSTEM=="usb", ACTION=="add", ATTRS{idVendor}=="xxxx", ATTR{idProduct}=="yyyy", RUN+="/home/tc/DAC.sh"
```
where xxxx and yyyy are what you found in the previous step.

Press control+o to save and control+x to exit.

## Step 3
Type sudo nano /home/tc/DAC.sh and paste this text:

```
#!/bin/sh

giar=$(sudo /usr/local/etc/init.d/squeezelite status)
if [ "$giar" = "Squeezelite not running." ];
then
	sudo /usr/local/etc/init.d/squeezelite restart
fi
```
Press control+o to save and control+x to exit.

## Step 4
Type sudo chmod 755 /home/tc/DAC.sh to make the script executable.

## Step 5
Type sudo nano /opt/.filetool.lst and add at the end of file this string to backup the mod:
```

etc/udev/rules.d/10-DAC.rules
```
Press control+o to save and control+x to exit.

## Step 6
Type pcp br to backup and reboot.
Now, if your DAC is turned-off and squeezelite is not running, when you turn on your DAC, squeezelite will start.

Credits: my wife for the patience…
