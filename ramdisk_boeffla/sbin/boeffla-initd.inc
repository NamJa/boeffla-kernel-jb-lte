# init.d support

if cd /system/etc/init.d >/dev/null 2>&1 ; then
    for file in * ; do
        if ! cat "$file" >/dev/null 2>&1 ; then continue ; fi
        echo $(date) init.d file $file started >> $BOEFFLA_LOGFILE
        /system/bin/sh "$file"
        echo $(date) init.d file $file executed >> $BOEFFLA_LOGFILE
    done
fi
