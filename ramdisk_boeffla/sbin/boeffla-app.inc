# Deinstall old boeffla-tweaks app and dialog helper app
/system/bin/pm uninstall bo.boeffla
/system/bin/pm uninstall bo.boeffla.tweaks.dialog.helper

# Delete all previous config scripts
/sbin/busybox mount -o remount,rw -t ext4 $SYSTEM_DEVICE /system
/sbin/busybox rm /system/etc/init.d/*_bk*
/sbin/busybox rm /system/etc/init.d/*_???bk*
/sbin/busybox mount -o remount,ro -t ext4 $SYSTEM_DEVICE /system
