if [ -f /data/media/autoroot ]; then

	echo $(date) Auto root is enabled >> $BOEFFLA_LOGFILE

	if [ ! -f /system/xbin/su ] && [ ! -f /system/bin/su ]; then
		/sbin/busybox mount -o remount,rw -t ext4 $SYSTEM_DEVICE /system
		/sbin/busybox cp /res/misc/su /system/xbin/su
		/sbin/busybox chown 0.0 /system/xbin/su
		/sbin/busybox chmod 6755 /system/xbin/su
		/sbin/busybox mount -o remount,ro -t ext4 $SYSTEM_DEVICE /system
		echo $(date) Auto root: su binaries copied >> $BOEFFLA_LOGFILE
	fi

	if [ ! -f /system/app/Superuser.apk ] && [ ! -f /data/app/Superuser.apk ]; then
		/sbin/busybox mount -o remount,rw -t ext4 $SYSTEM_DEVICE /system
		/sbin/busybox cp /res/misc/Superuser.apk /system/app/Superuser.apk
		/sbin/busybox chown 0.0 /system/app/Superuser.apk
		/sbin/busybox chmod 644 /system/app/Superuser.apk
		/sbin/busybox mount -o remount,ro -t ext4 $SYSTEM_DEVICE /system
		echo $(date) Auto root: Superuser app copied >> $BOEFFLA_LOGFILE
	fi

	rm /data/media/autoroot

fi
