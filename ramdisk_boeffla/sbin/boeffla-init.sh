#!/system/bin/sh
#
# credits to various people

# define block devices
SYSTEM_DEVICE="/dev/block/mmcblk0p9"
CACHE_DEVICE="/dev/block/mmcblk0p8"
DATA_DEVICE="/dev/block/mmcblk0p12"

# define file paths, depending on whether we are on Samsung or CM
if [ -d "/lib/modules" ] ; then
	# Samsung
	BOEFFLA_PATH="/data/media/boeffla-kernel"
	BOEFFLA_DATA_PATH="/data/media/boeffla-kernel-data"
	KERNEL="SAM"
else
	# CM
	BOEFFLA_PATH="/data/media/0/boeffla-kernel"
	BOEFFLA_DATA_PATH="/data/media/0/boeffla-kernel-data"
	KERNEL="CM"
fi

BOEFFLA_CONFIG="$BOEFFLA_PATH/boeffla-kernel.conf"
BOEFFLA_LOGFILE="$BOEFFLA_DATA_PATH/boeffla-kernel.log"


# check if Boeffla kernel path exists and if so, execute config file
if [ -d "$BOEFFLA_PATH" ] ; then

	# check and create or update the configuration file
	. /sbin/boeffla-configfile.inc

else
	BOEFFLA_CONFIG=""
fi

# If not yet exists, create a boeffla-kernel-data folder on sdcard 
# which is used for many purposes (set permissions and owners correctly)
if [ ! -d "$BOEFFLA_DATA_PATH" ] ; then
	/sbin/busybox mkdir $BOEFFLA_DATA_PATH
	/sbin/busybox chmod 775 $BOEFFLA_DATA_PATH
	/sbin/busybox chown 1023:1023 $BOEFFLA_DATA_PATH
fi

# maintain log file history
rm $BOEFFLA_LOGFILE.3
mv $BOEFFLA_LOGFILE.2 $BOEFFLA_LOGFILE.3
mv $BOEFFLA_LOGFILE.1 $BOEFFLA_LOGFILE.2
mv $BOEFFLA_LOGFILE $BOEFFLA_LOGFILE.1

# Initialize the log file (chmod to make it readable also via /sdcard link)
echo $(date) Boeffla-Kernel initialisation started > $BOEFFLA_LOGFILE
/sbin/busybox chmod 666 $BOEFFLA_LOGFILE
/sbin/busybox cat /proc/version >> $BOEFFLA_LOGFILE
echo "=========================" >> $BOEFFLA_LOGFILE

# Include version information about firmware in log file
/sbin/busybox grep ro.build.version /system/build.prop >> $BOEFFLA_LOGFILE
echo "=========================" >> $BOEFFLA_LOGFILE

# Fix potential issues and clean up
. /sbin/boeffla-fix-and-cleanup.inc

# Custom boot animation support only for Samsung Kernel,
# boeffla sound change delay changed only for Samsung Kernel
if [ "SAM" == "$KERNEL" ]; then
	. /sbin/boeffla-bootanimation.inc
	. /sbin/boeffla-sound-prepare.inc
fi


# Then set the options which change the stock kernel defaults
# to Boeffla-Kernel defaults

# Ext4 tweaks
. /sbin/boeffla-ext4.inc

# Sdcard buffer tweaks
. /sbin/boeffla-sdcard.inc

# AC and USB charging rate
. /sbin/boeffla-chargingrate.inc

# Android logger
. /sbin/boeffla-androidlogger.inc

# Kernel logger
. /sbin/boeffla-kernellogger.inc


# Now wait for the rom to finish booting up
# (by checking for any android process)
while ! /sbin/busybox pgrep android.process.acore ; do
  /sbin/busybox sleep 1
done
echo $(date) Rom boot trigger detected, continuing after 8 more seconds... >> $BOEFFLA_LOGFILE
/sbin/busybox sleep 8

# Governor
. /sbin/boeffla-governor.inc

# IO Scheduler
. /sbin/boeffla-scheduler.inc

# CPU max frequency
. /sbin/boeffla-cpumaxfrequency.inc

# CPU undervolting support
. /sbin/boeffla-cpuundervolt.inc

# GPU frequency
. /sbin/boeffla-gpufrequency.inc

# GPU undervolting support
. /sbin/boeffla-gpuundervolt.inc

# LED settings
. /sbin/boeffla-led.inc

# Touch boost switch / Touch wake
. /sbin/boeffla-touchboost-touchwake.inc

# MDNIE settings (sharpness fix)
. /sbin/boeffla-mdnie.inc

# System tweaks
. /sbin/boeffla-systemtweaks.inc

# zRam support
. /sbin/boeffla-zram.inc

# Support for additional network protocols (CIFS, NFS)
. /sbin/boeffla-network.inc

# Support for xbox controller
. /sbin/boeffla-xbox.inc

# exFat support
. /sbin/boeffla-exfat.inc

# Turn off debugging for certain modules
. /sbin/boeffla-disabledebugging.inc

# Auto root support
. /sbin/boeffla-autoroot.inc

# Configuration app support
. /sbin/boeffla-app.inc

# EFS backup
. /sbin/boeffla-efsbackup.inc

# Boeffla Sound (wait another 4 seconds first to cover for slow rom loading)
/sbin/busybox sleep 4
. /sbin/boeffla-sound.inc

# init.d support
. /sbin/boeffla-initd.inc

# Finished
echo $(date) Boeffla-Kernel initialisation completed >> $BOEFFLA_LOGFILE
