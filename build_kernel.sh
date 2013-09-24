#!/bin/bash

export ARCH=arm
GOOGLE_TC=/home/guni/kernel/arm-eabi-google-4.7.0/bin/arm-eabi-
LINARO_TC=/home/guni/kernel/arm-eabi-linaro-4.8.2/bin/arm-eabi-

BOEFFLA_RAMDISK="ramdisk_boeffla"
RAMDISK_PATH="ramdisk_lte"
RAMDISK_NAME="boot.img-ramdisk"
ZIMAGE="arch/arm/boot/zImage"
MODULES="modules"
TMP_PATH="tmp"
MKBOOT_PATH="mkboot"
OUTPUT_PATH="output"
CWM_PATH="cwm"
BASE_ADDR="0x10000000"
RAMDISK_ADDR="0x11000000"
KERNEL_VERSION="3.1stable"

RMV_MODULES=(commkm.ko mvpkm.ko pvtcpkm.ko)

print_error()
{
    echo "Usage: $1 operator toolchain_type"
    echo "$1 skt/kt/lgt google/linaro"
    exit
}

check_op()
{
    if [ ! $1 ]
    then
        retval="false"
    elif [ $1 == "skt" ] || [ $1 == "kt" ] || [ $1 == "lgt" ]
    then
        retval="true"
    else
        retval="false"
    fi
    echo $retval
}

check_toolchain()
{
    if [ ! $1 ]
    then
        retval="false"
    elif [ $1 == "google" ] || [ $1 == "linaro" ]
    then
        retval="true"
    else
        retval="false"
    fi
    echo $retval
}

check_zimage()
{
    if [ -e arch/arm/boot/zImage ]
    then
        echo Found zImage in kernel build path!
    else
        echo Did not find zImage in kernel build path! Build the kernel first!
        exit 0
    fi
}

check_kernel()
{
    if [ -d $1"/boot.img-ramdisk" ]
    then
        echo Found boot.img-ramdisk in $1 directory

        if [ -e $1"/zImage" ]
        then
            echo Found zImage in $1 directory
        else
            echo Did not find zImage in $1 directory
            exit 0
        fi
    else
        echo Did not find boot.img-ramdisk folder in $1 directory!
        exit 0
    fi
}

check_modules()
{
    if [ -d modules ]
    then
        echo Found modules folder!
    else
        echo Did not find modules folder!
        exit 0
    fi
}

build_mkboot()
{
    mkbootimg_src=mkbootimg.c
    mkbootimg_out=mkbootimg
    mkbootfs_file=mkbootfs
    mkbootimg_file=$mkbootimg_out

    if [ -e $1"/"$mkbootfs_file ]
    then
        echo "Found $mkbootfs_file"
    else
        echo
        echo "Compiling mkbootfs ..."
        cd $1
        gcc -o mkbootfs mkbootfs.c 2>/dev/null
        cd ..

        if [ -e $1"/"$mkbootfs_file ]
        then
            echo mkbootfs successfully compiled
        else
            echo "Error: mkbootfs not successfully compiled!"
            exit 0   
        fi
    fi

    if [ -e $1"/"$mkbootimg_file ]
    then
        rm -f $mkbootimg_file
    fi

    echo
    echo "Compiling mkbootimg ..."
    cd $1
    gcc -c rsa.c
    gcc -c sha.c
    gcc rsa.o sha.o $mkbootimg_src -w -o $mkbootimg_out
    rm *.o
    cd ..

    if [ -e $1"/"$mkbootimg_file ]
    then
        echo "$mkbootimg_out successfully compiled"
    else
        echo "Error: $mkbootimg_out not successfully compiled!"
        exit 0
    fi    

    cp $1"/"$mkbootfs_file $2
    cp $1"/"$mkbootimg_file $2
}

retval=$( check_op $1 )
OP="skt"                    # assign skt as default operator
if [ "$retval" == "true" ]
then
    OP=$1
else
    print_error $0
fi

retval=$( check_toolchain $2 )
TC="google"                 # assign google toolchain as default toolchain
if [ "$retval" == "true" ]
then
    TC=$2
else
    print_error $0
fi

if [ $TC == "google" ]
then
    export CROSS_COMPILE=$GOOGLE_TC
elif [ $TC == "linaro" ]
then
    export CROSS_COMPILE=$LINARO_TC
fi

DEFCONFIG="c1"$OP"_00_defconfig"

# Start build the kernel using four threads
make $DEFCONFIG
make -j4

check_zimage

# Copy all compiled kernel modules into modules directory
if [ ! -d $MODULES ]
then
    mkdir $MODULES
fi
find . -name "*.ko" | xargs cp -t $MODULES

# Uncompress ramdisk image into tmp directory
RAMDISK=$RAMDISK_PATH"/boot.img-ramdisk_"$OP".gz"
if [ ! -e $TMP_PATH ]
then
    `mkdir $TMP_PATH`
fi

echo `tar xvfz $RAMDISK -C $TMP_PATH > /dev/null`

TMP_RAMDISK=$TMP_PATH"/"$OP
if [ -d $TMP_RAMDISK ]
then
    echo "Done uncompressing "$OP" ramdisk!"
fi

# Remove and copy new boeffla specific configuration files into corresponding directory
`rm -rf $TMP_RAMDISK"/res"`
`cp -R $BOEFFLA_RAMDISK"/res" $TMP_RAMDISK`
`rm -rf $TMP_RAMDISK"/sbin/boeffla-*"`
`rm -rf $TMP_RAMDISK"/sbin/busybox"`

for f in $BOEFFLA_RAMDISK"/sbin/"*
do
    cp $f $TMP_RAMDISK"/sbin/"
done

for f in $TMP_RAMDISK"/sbin/"*
do
    chmod 750 $f
done

# Search and replace and add boeffla activation script into init

# Copy zImage and kernel modules and remove unnecessary modules
mv $TMP_RAMDISK $TMP_PATH"/"$RAMDISK_NAME  # rename ramdisk folder

check_zimage
echo Copy zImage from build path to tmp
`cp $ZIMAGE $TMP_PATH`

check_modules
echo Copy all kernel modules from build path to tmp
`rm -rf $TMP_PATH"/"$RAMDISK_NAME"/lib/modules"`
`cp -R $MODULES $TMP_PATH"/"$RAMDISK_NAME"/lib"`
echo Remove some unnecessary modules from tmp
for idx in "${RMV_MODULES[@]}"
do
    rm -rf $TMP_PATH"/"$RAMDISK_NAME"/lib/modules/"$idx
done

check_kernel $TMP_PATH

# Build mkboot executable binary from source
build_mkboot $MKBOOT_PATH $TMP_PATH

# Build the kernel into boot.img
cd $TMP_PATH
echo "Creating ramdisk cpio archive ..."
./mkbootfs boot.img-ramdisk | gzip > ramdisk.gz

echo "Building boot.img ..."

ramdisk_params=""
if [ "$RAMDISK_ADDR" != "" ]
then
  ramdisk_params="--ramdiskaddr $RAMDISK_ADDR"
fi

./mkbootimg --kernel zImage --ramdisk ramdisk.gz -o boot.img --base $BASE_ADDR $ramdisk_params

cd ..

# Move built boot.img into output directory and rename to corresponding op

if [ -d $OUTPUT_PATH"/"$TC ]
then
    echo "Found output directory!"
    if [ -e $OUTPUT_PATH"/"$TC"/boot_"$OP".img" ]
    then
        rm -rf $OUTPUT_PATH"/"$TC"/boot_"$OP".img"
    fi

    if [ -e $OUTPUT_PATH"/"$TC"/boeffla_kernel_"$KERNEL_VERSION"_"$OP".zip" ]
    then
        rm -rf $OUTPUT_PATH"/"$TC"/boeffla_kernel_"$KERNEL_VERSION"_"$OP".zip"
    fi
else
    mkdir -p $OUTPUT_PATH"/"$TC
fi

if [ -e $TMP_PATH"/boot.img" ]
then
    echo
    echo "boot.img created"
    echo "Moving boot.img to output directory..."
    rm -rf $OUTPUT_PATH"/"$TC"/boot_"$OP".img"
    mv $TMP_PATH"/boot.img" $OUTPUT_PATH"/"$TC"/boot_"$OP".img"
fi

# Pack boot.img as CWM flashable zip file and move to output directory

`cp $OUTPUT_PATH"/"$TC"/boot_"$OP".img" $CWM_PATH"/boot.img"`
cd $CWM_PATH
echo `zip -r -9 "../"$OUTPUT_PATH"/"$TC"/boeffla_kernel_"$KERNEL_VERSION"_"$OP".zip" * > /dev/null`
cd ..

# Clean all temporary files...
rm -rf $TMP_PATH
rm -rf $CWM_PATH"/boot.img"
rm -rf $MODULES
rm -rf $MKBOOT_PATH"/mkbootfs"
rm -rf $MKBOOT_PATH"/mkbootimg"
