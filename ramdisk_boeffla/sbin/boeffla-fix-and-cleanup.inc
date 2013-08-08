### system

# remount system volume rw
/sbin/busybox mount -o remount,rw -t ext4 $SYSTEM_DEVICE /system

# if no startup sound existing in rom, copy a silent one now
# (for better boeffla sound compatibility)
if [ ! -f /system/media/audio/ui/PowerOn.ogg ]; then

	/sbin/busybox cp /res/misc/PowerOn.ogg /system/media/audio/ui/PowerOn.ogg

	echo $(date) Dummy start sound copied to fix potential Boeffla sound microphone issue >> $BOEFFLA_LOGFILE

fi

# sync and remount system volume ro
/sbin/busybox sync
/sbin/busybox mount -o remount,ro -t ext4 $SYSTEM_DEVICE /system


### rootfs

# remount root volume rw
/sbin/busybox mount -o remount,rw /

# change permissions of /sbin folder
/sbin/busybox chmod -R 755 /sbin

# change permissions of scripts in /res/bc
/sbin/busybox chmod 755 /res/bc/*

# sync and remount root volume ro
/sbin/busybox sync
/sbin/busybox mount -o remount,ro /
