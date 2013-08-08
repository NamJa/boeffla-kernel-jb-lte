# check whether custom boot animation is available to be played
if /sbin/busybox [ -f /data/local/bootanimation.zip ] || /sbin/busybox [ -f /system/media/bootanimation.zip ]; then
        echo $(date) Playing custom boot animation >> $BOEFFLA_LOGFILE
        /system/bin/bootanimation &
else
        echo $(date) Playing Samsung stock boot animation >> $BOEFFLA_LOGFILE
        /system/bin/samsungani &
fi
