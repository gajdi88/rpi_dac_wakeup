# turn on pin 9 for export
echo 3 > /sys/class/gpio/export

# set pin 9 as output
echo "out" > /sys/class/gpio/gpio3/direction


# turn off
echo 0 > /sys/class/gpio/gpio3/value

# wait
sleep .2s

# turn on
echo 1 > /sys/class/gpio/gpio3/value

# wait
sleep 1s

# turn off
echo 0 > /sys/class/gpio/gpio3/value

giar=$(sudo /usr/local/etc/init.d/squeezelite status)
if [ "$giar" = "Squeezelite not running." ];
then
	sudo /usr/local/etc/init.d/squeezelite restart
fi
