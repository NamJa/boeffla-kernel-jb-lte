# prepare boeffla sound

# set change delay to 200 ms
echo "200000" > /sys/class/misc/boeffla_sound/change_delay
echo $(date) Boeffla-Sound change delay set to 200 ms >> $BOEFFLA_LOGFILE
