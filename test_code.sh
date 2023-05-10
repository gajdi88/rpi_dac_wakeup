# turn on pin 9 for export
echo 3 > /sys/class/gpio/export

# set pin 9 as output
echo "out" > /sys/class/gpio/gpio3/direction


# turn off
echo 0 > /sys/class/gpio/gpio3/value

# turn on
echo 1 > /sys/class/gpio/gpio3/value
