# Touch boost switch

if /sbin/busybox [ "`/sbin/busybox grep touch_boost=off $BOEFFLA_CONFIG`" ]; then

  echo "0" > /sys/class/misc/touchboost_switch/touchboost_switch

  echo $(date) "Touch boost disabled" >> $BOEFFLA_LOGFILE

fi


# Touch boost frequency

# Initialize variable and read setting for touch wake delay time
TOUCHFREQ=""
TOUCHFREQ=$(/sbin/busybox sed -n -e 's/.*touch_freq=\(.*\)(.*/\1/p' $BOEFFLA_CONFIG)

# Only apply if value valid
if [ ! -z "$TOUCHFREQ" ] && [ "${TOUCHFREQ:-0}" -ge 200 ] && [ "${TOUCHFREQ:-0}" -le 1400 ]; then

  echo $(( $TOUCHFREQ * 1000 )) > /sys/class/misc/touchboost_switch/touchboost_freq

  echo $(date) "Touch boost frequency set to $TOUCHFREQ MHz" >> $BOEFFLA_LOGFILE

fi


# Touch wake

# Initialize variable and read setting for touch wake delay time
DELAYTIME=""
DELAYTIME=$(/sbin/busybox sed -n -e 's/.*touch_wake=\(.*\)(.*/\1/p' $BOEFFLA_CONFIG)

# Only apply if value valid
if [ ! -z "$DELAYTIME" ] && [ "${DELAYTIME:-0}" -ge 0 ] && [ "${DELAYTIME:-0}" -le 600 ]; then

  echo "1" > /sys/class/misc/touchwake/enabled
  echo $(( $DELAYTIME * 1000 )) > /sys/class/misc/touchwake/delay

  echo $(date) "Touch wake with $DELAYTIME seconds delay enabled" >> $BOEFFLA_LOGFILE

fi
