# ********************************
# Kernel specific initialisation
# ********************************

if [ -d "/lib/modules" ] ; then
	# CM Kernel
	LIBPATH="/lib/modules"
else
	# Samsung Kernel
	LIBPATH="/system/lib/modules"
fi


# *******************
# List of values
# *******************

if [ "lov_gov_profiles" == "$1" ]; then
	echo "pegasusq - boeffla moderate;pegasusq - boeffla battery saving;pegasusq - boeffla 1 core;pegasusq - boeffla 2 cores;pegasusq - speedmod;zzmoove - optimal;zzmoove - battery;zzmoove - performance"
	exit 0
fi

if [ "lov_cpu_volt_profiles" == "$1" ]; then
	echo "undervolt -25mV;undervolt -50mV;undervolt -75mV;undervolt -100mV;undervolt light;undervolt medium;undervolt heavy"
	exit 0
fi

if [ "lov_gpu_freq_profiles" == "$1" ]; then
	echo "54 only;160 only;160/266;266/350;54/108/160/266;108/160/266/350;160/266/350/440 (default);266/350/440/533;350/440/533/600;440/533/600/700"
	exit 0
fi

if [ "lov_gpu_volt_profiles" == "$1" ]; then
	echo "undervolt -25mV;undervolt -50mV;undervolt -75mV;undervolt -100mV;undervolt light;undervolt medium;undervolt heavy;overvolt +25mV;overvolt +50mV;overvolt +75mV;overvolt +100mV"
	exit 0
fi

if [ "lov_gpu_freq" == "$1" ]; then
	echo "54;108;160;266;350;440;533;600;700"
	exit 0
fi

if [ "lov_eq_gain_profiles" == "$1" ]; then
	echo "Baseland;Bass extreme;Bass treble;Classic;Dance;Eargasm;Metal/Rock;Pleasant;Treble"
	exit 0
fi

if [ "lov_system_tweaks" == "$1" ]; then
	echo "Off;Boeffla tweaks;Speedmod tweaks"
	exit 0
fi

if [ "lov_presets" == "$1" ]; then
	# Note, the ^ sign will be translated into newline for this setting
	echo "Power extreme~"
	echo "Gov: lulzactiveq / no profile"
	echo "^Sched: row / row"
	echo "^CPU: 1600 / no uv"
	echo "^GPU: 440-700 / +50mV;"
	
	echo "Power~"
	echo "Gov: zzmoove / zzmoove-performance"
	echo "^Sched: row / row"
	echo "^CPU: 1500 / no uv"
	echo "^GPU: 266-533 / no uv;"
	
	echo "Standard~"
	echo "Gov: pegasusq / no profile"
	echo "^Sched: cfq / cfq"
	echo "^CPU: 1400 / no uv"
	echo "^GPU: 160-440 / no uv;"
	
	echo "Battery friendly~"
	echo "Gov: pegasusq / boeffla-moderate"
	echo "^Sched: cfq / cfq"
	echo "^CPU: 1400 / -25mV"
	echo "^GPU: 160/266 / -25mV;"
	
	echo "Battery saving~"
	echo "Gov: zzmoove / zzmoove-battery"
	echo "^Sched: cfq / cfq"
	echo "^CPU: 1000 / light uv"
	echo "^GPU: 160/266 / light uv;"
	
	exit 0
fi


# ************************************
# Configuration values (for profiles)
# ************************************

if [ "conf_presets" == "$1" ]; then
	if [ "Power extreme" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "lulzactiveq;None;"
		echo "row;row;"
		echo "1600000;None;"
		echo "440/533/600/700;overvolt +50mV"
	fi
	if [ "Power" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "zzmoove;zzmoove - performance;"
		echo "row;row;"
		echo "1500000;None;"
		echo "266/350/440/533;None"
	fi
	if [ "Standard" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "pegasusq;None;"
		echo "cfq;cfq;"
		echo "1400000;None;"
		echo "None;None"
	fi
	if [ "Battery friendly" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "pegasusq;pegasusq - boeffla moderate;"
		echo "cfq;cfq;"
		echo "1400000;undervolt -25mV;"
		echo "160/266;undervolt -25mV"
	fi
	if [ "Battery saving" ==  "$2" ]; then
		# gov, gov prof, sched int, sched ext, cpu max, cpu uv, gpu freq, gpu uv
		echo "zzmoove;zzmoove - battery;"
		echo "cfq;cfq;"
		echo "1000000;undervolt light;"
		echo "160/266;undervolt light"
	fi
	exit 0
fi


if [ "conf_gpu_freq" == "$1" ]; then
	if [ "54 only" == "$2" ]; then
		echo "54;54;54;54"
	fi
	if [ "160 only" == "$2" ]; then
		echo "160;160;160;160"
	fi
	if [ "160/266" == "$2" ]; then
		echo "160;160;266;266"
	fi
	if [ "266/350" == "$2" ]; then
		echo "266;266;350;350"
	fi
	if [ "54/108/160/266" == "$2" ]; then
		echo "54;108;160;266"
	fi
	if [ "108/160/266/350" == "$2" ]; then
		echo "108 160 266 350"
	fi
	if [ "160/266/350/440 (default)" == "$2" ]; then
		echo "160;266;350;440"
	fi
	if [ "266/350/440/533" == "$2" ]; then
		echo "266;350;440;533"
	fi
	if [ "350/440/533/600" == "$2" ]; then
		echo "350;440;533;600"
	fi
	if [ "440/533/600/700" == "$2" ]; then
		echo "440;533;600;700"
	fi
	exit 0
fi


if [ "conf_gpu_volt" == "$1" ]; then
	if [ "undervolt -25mV" == "$2" ]; then
		echo "-25000;-25000;-25000;-25000"
	fi
	if [ "undervolt -50mV" == "$2" ]; then
		echo "-50000;-50000;-50000;-50000"
	fi
	if [ "undervolt -75mV" == "$2" ]; then
		echo "-75000;-75000;-75000;-75000"
	fi
	if [ "undervolt -100mV" == "$2" ]; then
		echo "-100000;-100000;-100000;-100000"
	fi
	if [ "undervolt light" == "$2" ]; then
		echo "-25000;-25000;-50000;-50000"
	fi
	if [ "undervolt medium" == "$2" ]; then
		echo "-50000;-50000;-75000;-75000"
	fi
	if [ "undervolt heavy" == "$2" ]; then
		echo "-75000;-75000;-100000;-100000"
	fi
	if [ "overvolt +25mV" == "$2" ]; then
		echo "25000;25000;25000;25000"
	fi
	if [ "overvolt +50mV" == "$2" ]; then
		echo "50000;50000;50000;50000"
	fi
	if [ "overvolt +75mV" == "$2" ]; then
		echo "75000;75000;75000;75000"
	fi
	if [ "overvolt +100mV" == "$2" ]; then
		echo "100000;100000;100000;100000"
	fi
	exit 0
fi

if [ "conf_cpu_volt" == "$1" ]; then
	if [ "undervolt -25mV" == "$2" ]; then
		echo "-25;-25;-25;-25;-25;-25;-25;-25;-25;-25;-25;-25;-25;-25;-25"
	fi
	if [ "undervolt -50mV" == "$2" ]; then
		echo "-50;-50;-50;-50;-50;-50;-50;-50;-50;-50;-50;-50;-50;-50;-50"
	fi
	if [ "undervolt -75mV" == "$2" ]; then
		echo "-75;-75;-75;-75;-75;-75;-75;-75;-75;-75;-75;-75;-75;-75;-75"
	fi
	if [ "undervolt -100mV" == "$2" ]; then
		echo "-100;-100;-100;-100;-100;-100;-100;-100;-100;-100;-100;-100;-100;-100;-100"
	fi
	if [ "undervolt light" == "$2" ]; then
		echo "0;0;0;0;0;0;-25;-25;-25;-25;-25;-50;-50;-50;-50"
	fi
	if [ "undervolt medium" == "$2" ]; then
		echo "-25;-25;-25;-25;-25;-25;-50;-50;-50;-50;-50;-75;-75;-75;-75"
	fi
	if [ "undervolt heavy" == "$2" ]; then
		echo "-50;-50;-50;-50;-50;-50;-75;-75;-75;-75;-75;-100;-100;-100;-100"
	fi
	exit 0
fi

if [ "conf_eq_gains" == "$1" ]; then
	if [ "Eargasm" ==  "$2" ]; then
		echo "12;8;4;2;3"
	fi
	if [ "Pleasant" ==  "$2" ]; then
		echo "4;3;2;2;3"
	fi
	if [ "Classic" ==  "$2" ]; then
		echo "0;0;0;-3;-5"
	fi
	if [ "Bass treble" ==  "$2" ]; then
		echo "10;7;0;2;5"
	fi
	if [ "Bass extreme" ==  "$2" ]; then
		echo "12;8;3;-1;1"
	fi
	if [ "Treble" ==  "$2" ]; then
		echo "-5;1;0;4;3"
	fi
	if [ "Baseland" ==  "$2" ]; then
		echo "8;7;4;3;3"
	fi
	if [ "Dance" ==  "$2" ]; then
		echo "4;0;-6;0;3"
	fi
	if [ "Metal/Rock" ==  "$2" ]; then
		echo "4;3;0;-4;3"
	fi
	exit 0
fi

# *******************
# Parameters
# *******************

if [ "param_readahead" == "$1" ]; then
	# Internal sd (min/max/steps)
	echo "128;3072;128;"
	# External sd (min/max/steps)
	echo "128;3072;128"
	exit 0
fi

if [ "param_boeffla_sound" == "$1" ]; then
	# Headphone min/max, Speaker min/max
	echo "20;63;57;63;"
	# Equalizer min/max
	echo "-12;12;"
	# Microphone gain min/max
	echo "0;31;"
	# Stereo expansion min/max
	echo "0;31"
	exit 0
fi

if [ "param_cpu_uv" == "$1" ]; then
	# CPU UV min/max/steps
	echo "600;1500;25"
	exit 0
fi

if [ "param_gpu_uv" == "$1" ]; then
	# GPU UV min/max/steps
	echo "600000;1200000;25000"
	exit 0
fi

if [ "param_led" == "$1" ]; then
	# LED speed min/max/steps
	echo "1;5;1;"
	# LED brightness min/max/steps
	echo "5;130;5"
	exit 0
fi

if [ "param_touchwake" == "$1" ]; then
	# Touchwake min/max/steps
	echo "0;600000;5000"
	exit 0
fi

if [ "param_early_suspend_delay" == "$1" ]; then
	# Early suspend delay min/max/steps
	echo "0;700;25"
	exit 0
fi

if [ "param_zram" == "$1" ]; then
	# zRam size min/max/steps
	echo "104857600;838860800;20971520"
	exit 0
fi

if [ "param_charge_rates" == "$1" ]; then
	# AC charge min/max/steps
	echo "600;1500;25;"
	# USB charge min/max/steps
	echo "0;1200;25"
	exit 0
fi

if [ "param_lmk" == "$1" ]; then
	# LMK size min/max/steps
	echo "5;300;1"
	exit 0
fi


# *******************
# Get settings
# *******************

if [ "get_ums" == "$1" ]; then
	if [ "`/sbin/busybox grep 179 /sys/devices/platform/s3c-usbgadget/gadget/lun0/file`" ]; then
		echo "1"
	else
		echo "0"
	fi
	exit 0
fi


if [ "get_tunables" == "$1" ]; then
	if [ -d /sys/devices/system/cpu/cpufreq/$2 ]; then
		cd /sys/devices/system/cpu/cpufreq/$2
		for file in *
		do
			content="`/sbin/busybox cat $file`"
			/sbin/busybox echo -ne "$file~$content;"
		done
	fi
fi


if [ "get_kernel_version" == "$1" ]; then
	/sbin/busybox cat /proc/version
	exit 0
fi


if [ "get_kernel_target" == "$1" ]; then
	/sbin/busybox cat /res/bc/kernel_target
	exit 0
fi


# *******************
# Applying settings
# *******************

if [ "apply_governor_profile" == "$1" ]; then
	if [ "pegasusq - standard" == "$2" ]; then
		# cpu2
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "200000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "200000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "200" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "200" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "200000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "20" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "85" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "37" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step
	fi


	if [ "pegasusq - boeffla 1 core" == "$2" ]; then
		# cpu2
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "3000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "3000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "4000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "4000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "5000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "5000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "20" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "85" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "37" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step
	fi

	if [ "pegasusq - boeffla 2 cores" == "$2" ]; then
		# cpu2
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "200000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "4000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "4000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "5000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "5000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "20" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "85" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "37" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step
	fi

	if [ "pegasusq - speedmod" == "$2" ]; then
		# cpu2
		echo "500000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "800000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "600000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "200" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "200" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "800000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "600000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "85" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "37" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step
	fi

	if [ "pegasusq - boeffla battery saving" == "$2" ]; then
		# cpu2
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "500" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "500" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "550" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "550" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "1400000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "600" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "600" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "5" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "95" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "25" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step
	fi

	if [ "pegasusq - boeffla moderate" == "$2" ]; then
		# cpu2
		echo "800000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1
		echo "700000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1
		echo "100" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0
		# cpu3
		echo "1100000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1
		echo "1000000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1
		echo "300" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0
		# cpu4
		echo "1300000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1
		echo "1200000" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0
		echo "400" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1
		echo "400" > /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0

		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate
		echo "10" > /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate
		echo "85" > /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold
		echo "37" > /sys/devices/system/cpu/cpufreq/pegasusq/freq_step

	fi

	if [ "zzmoove - standard" == "$2" ]; then
		# sampling rate and sampling down
		echo "100000" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_max_momentum
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_momentum_sensitivity
		# freq scaling and hotplugging
		echo "70" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep
		echo "68" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1
		echo "68" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2
		echo "68" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3
		echo "52" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep
		echo "55" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1
		echo "55" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2
		echo "55" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep
		# freqency stepping and limit
		echo "5" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit
		echo "700000" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit_sleep
		# fast scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling_sleep
		# early demand
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/early_demand
		echo "25" >/sys/devices/system/cpu/cpufreq/zzmoove/grad_up_threshold
		# nice load
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load
		# LCDFreq scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_enable
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_cores
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_up_delay
		echo "20" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_down_delay
		echo "500000" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_freq
	fi

	if [ "zzmoove - battery" == "$2" ]; then
		# sampling rate and sampling down
		echo "180000" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_max_momentum
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_momentum_sensitivity
		# freq scaling and hotplugging
		echo "95" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1
		echo "80" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2
		echo "98" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3
		echo "40" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep
		echo "45" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1
		echo "55" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2
		echo "65" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep
		# freqency stepping and limit
		echo "10" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit
		echo "800000" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit_sleep
		# fast scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling
		echo "2" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling_sleep
		# early demand
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/early_demand
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/grad_up_threshold
		# nice load
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load
		# LCDFreq scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_enable
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_cores
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_up_delay
		echo "5" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_down_delay
		echo "500000" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_freq
	fi

	if [ "zzmoove - optimal" == "$2" ]; then
		# sampling rate and sampling down
		echo "45000" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor
		echo "20" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_max_momentum
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_momentum_sensitivity
		# freq scaling and hotplugging
		echo "67" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep
		echo "68" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1
		echo "78" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2
		echo "88" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3
		echo "52" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep
		echo "45" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1
		echo "55" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2
		echo "65" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep
		# freqency stepping and limit
		echo "5" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit
		echo "800000" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit_sleep
		# fast scaling
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling
		echo "2" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling_sleep
		# early demand
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/early_demand
		echo "25" >/sys/devices/system/cpu/cpufreq/zzmoove/grad_up_threshold
		# nice load
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load
		# LCDFreq scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_enable
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_cores
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_up_delay
		echo "5" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_down_delay
		echo "500000" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_freq
	fi

	if [ "zzmoove - performance" == "$2" ]; then
		# sampling rate and sampling down
		echo "40000" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier
		echo "4" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor
		echo "50" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_max_momentum
		echo "25" >/sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_momentum_sensitivity
		# freq scaling and hotplugging
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep
		echo "70" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up
		echo "100" >/sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep
		echo "65" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1
		echo "75" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2
		echo "85" >/sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3
		echo "20" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold
		echo "60" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep
		echo "25" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1
		echo "35" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2
		echo "45" >/sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep
		# freqency stepping and limit
		echo "25" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit
		echo "800000" >/sys/devices/system/cpu/cpufreq/zzmoove/freq_limit_sleep
		# fast scaling
		echo "2" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling
		echo "2" >/sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling_sleep
		# early demand
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/early_demand
		echo "15" >/sys/devices/system/cpu/cpufreq/zzmoove/grad_up_threshold
		# nice load
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load
		# LCDFreq scaling
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_enable
		echo "0" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_cores
		echo "1" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_up_delay
		echo "5" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_down_delay
		echo "500000" >/sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_freq
	fi

	if [ "lulzactiveq - standard" == "$2" ]; then
		echo "20" >/sys/devices/system/cpu/cpufreq/lulzactiveq/cpu_down_rate
		echo "10" >/sys/devices/system/cpu/cpufreq/lulzactiveq/cpu_up_rate
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/debug_mode
		echo "50" >/sys/devices/system/cpu/cpufreq/lulzactiveq/dec_cpu_load
		echo "40000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/down_sample_time
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/dvfs_debug
		echo "1600000 1500000 1400000 1300000 1200000 1100000 1000000 900000 800000 700000 600000 500000 400000 300000 200000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/freq_table
		echo "1400000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hispeed_freq
		echo "500000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_1_1 
		echo "200000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_2_0 
		echo "500000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_2_1 
		echo "400000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_3_0 
		echo "800000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_3_1 
		echo "500000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_freq_4_0 
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_lock
		echo "200" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_1_1 
		echo "200" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_2_0 
		echo "300" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_2_1 
		echo "300" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_3_0 
		echo "400" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_3_1 
		echo "400" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_rq_4_0 
		echo "50000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/hotplug_sampling_rate
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/ignore_nice_load
		echo "85" >/sys/devices/system/cpu/cpufreq/lulzactiveq/inc_cpu_load
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/max_cpu_lock
		echo "0" >/sys/devices/system/cpu/cpufreq/lulzactiveq/min_cpu_lock
		echo "1" >/sys/devices/system/cpu/cpufreq/lulzactiveq/pump_down_step
		echo "2" >/sys/devices/system/cpu/cpufreq/lulzactiveq/pump_up_step
		echo "11" >/sys/devices/system/cpu/cpufreq/lulzactiveq/screen_off_min_step
		echo "1" >/sys/devices/system/cpu/cpufreq/lulzactiveq/up_nr_cpus
		echo "20000" >/sys/devices/system/cpu/cpufreq/lulzactiveq/up_sample_time
	fi

	if [ "ondemand - standard" == "$2" ]; then
		echo "3" >/sys/devices/system/cpu/cpufreq/ondemand/down_differential
		echo "100" >/sys/devices/system/cpu/cpufreq/ondemand/freq_step
		echo "0" >/sys/devices/system/cpu/cpufreq/ondemand/ignore_nice_load
		echo "0" >/sys/devices/system/cpu/cpufreq/ondemand/io_is_busy
		echo "0" >/sys/devices/system/cpu/cpufreq/ondemand/powersave_bias
		echo "1" >/sys/devices/system/cpu/cpufreq/ondemand/sampling_down_factor
		echo "100000" >/sys/devices/system/cpu/cpufreq/ondemand/sampling_rate
		echo "10000" >/sys/devices/system/cpu/cpufreq/ondemand/sampling_rate_min
		echo "95" >/sys/devices/system/cpu/cpufreq/ondemand/up_threshold
	fi
	
	exit 0
fi

if [ "apply_system_tweaks" == "$1" ]; then
	if [ "Off" == "$2" ]; then
		echo "16384" > /proc/sys/fs/inotify/max_queued_events
		echo "77749" > /proc/sys/fs/file-max
		echo "128" > /proc/sys/fs/inotify/max_user_instances
		echo "8192" > /proc/sys/fs/inotify/max_user_watches
		echo "45" > /proc/sys/fs/lease-break-time

		echo "8192" > /proc/sys/kernel/msgmax
		echo "1250" > /proc/sys/kernel/msgmni
		echo "1" > /proc/sys/kernel/panic
		echo "64" > /proc/sys/kernel/random/read_wakeup_threshold
		echo "128" > /proc/sys/kernel/random/write_wakeup_threshold
		echo "6666666" > /proc/sys/kernel/sched_latency_ns
		echo "1333332" > /proc/sys/kernel/sched_wakeup_granularity_ns
		echo "1500000" > /proc/sys/kernel/sched_min_granularity_ns
		echo "250 32000 32 128" > /proc/sys/kernel/sem
		echo "33554432" > /proc/sys/kernel/shmmax
		echo "12151" > /proc/sys/kernel/threads-max

		echo "131071" > /proc/sys/net/core/rmem_max
		echo "2097152" > /proc/sys/net/core/wmem_max
		echo "524288 1048576 2097152" > /proc/sys/net/ipv4/tcp_rmem
		echo "0" > /proc/sys/net/ipv4/tcp_tw_recycle
		echo "262144 524288 1048576" > /proc/sys/net.ipv4/tcp_wmem

		echo "5" > /proc/sys/vm/dirty_background_ratio
		echo "200" > /proc/sys/vm/dirty_expire_centisecs
		echo "20" > /proc/sys/vm/dirty_ratio
		echo "500" > /proc/sys/vm/dirty_writeback_centisecs
		echo "3638" > /proc/sys/vm/min_free_kbytes
		echo "60" > /proc/sys/vm/swappiness
		echo "100" > /proc/sys/vm/vfs_cache_pressure
		echo "0" > /proc/sys/vm/drop_caches

		echo "5" > /proc/sys/net/ipv4/tcp_syn_retries
		echo "5" > /proc/sys/net/ipv4/tcp_synack_retries
		echo "60" > /proc/sys/net/ipv4/tcp_fin_timeout
	fi

	if [ "Boeffla tweaks" == "$2" ]; then
		echo "32000" > /proc/sys/fs/inotify/max_queued_events
		echo "524288" > /proc/sys/fs/file-max
		echo "256" > /proc/sys/fs/inotify/max_user_instances
		echo "10240" > /proc/sys/fs/inotify/max_user_watches
		echo "10" > /proc/sys/fs/lease-break-time

		echo "65536" > /proc/sys/kernel/msgmax
		echo "2048" > /proc/sys/kernel/msgmni
		echo "10" > /proc/sys/kernel/panic
		echo "128" > /proc/sys/kernel/random/read_wakeup_threshold
		echo "256" > /proc/sys/kernel/random/write_wakeup_threshold
		echo "18000000" > /proc/sys/kernel/sched_latency_ns
		echo "3000000" > /proc/sys/kernel/sched_wakeup_granularity_ns
		echo "1500000" > /proc/sys/kernel/sched_min_granularity_ns
		echo "500 512000 64 2048" > /proc/sys/kernel/sem
		echo "268435456" > /proc/sys/kernel/shmmax
		echo "524288" > /proc/sys/kernel/threads-max

		echo "524288" > /proc/sys/net/core/rmem_max
		echo "524288" > /proc/sys/net/core/wmem_max
		echo "6144 87380 524288" > /proc/sys/net/ipv4/tcp_rmem
		echo "1" > /proc/sys/net/ipv4/tcp_tw_recycle
		echo "6144 87380 524288" > /proc/sys/net.ipv4/tcp_wmem

		echo "70" > /proc/sys/vm/dirty_background_ratio
		echo "250" > /proc/sys/vm/dirty_expire_centisecs
		echo "90" > /proc/sys/vm/dirty_ratio
		echo "500" > /proc/sys/vm/dirty_writeback_centisecs
		echo "4096" > /proc/sys/vm/min_free_kbytes
		echo "60" > /proc/sys/vm/swappiness
		echo "10" > /proc/sys/vm/vfs_cache_pressure
		echo "3" > /proc/sys/vm/drop_caches

		echo "5" > /proc/sys/net/ipv4/tcp_syn_retries
		echo "5" > /proc/sys/net/ipv4/tcp_synack_retries
		echo "60" > /proc/sys/net/ipv4/tcp_fin_timeout
	fi

	if [ "Speedmod tweaks" == "$2" ]; then
		echo "16384" > /proc/sys/fs/inotify/max_queued_events
		echo "77749" > /proc/sys/fs/file-max
		echo "128" > /proc/sys/fs/inotify/max_user_instances
		echo "8192" > /proc/sys/fs/inotify/max_user_watches
		echo "45" > /proc/sys/fs/lease-break-time

		echo "8192" > /proc/sys/kernel/msgmax
		echo "1250" > /proc/sys/kernel/msgmni
		echo "1" > /proc/sys/kernel/panic
		echo "64" > /proc/sys/kernel/random/read_wakeup_threshold
		echo "128" > /proc/sys/kernel/random/write_wakeup_threshold
		echo "6666666" > /proc/sys/kernel/sched_latency_ns
		echo "1333332" > /proc/sys/kernel/sched_wakeup_granularity_ns
		echo "1500000" > /proc/sys/kernel/sched_min_granularity_ns
		echo "250 32000 32 128" > /proc/sys/kernel/sem
		echo "33554432" > /proc/sys/kernel/shmmax
		echo "12151" > /proc/sys/kernel/threads-max

		echo "131071" > /proc/sys/net/core/rmem_max
		echo "2097152" > /proc/sys/net/core/wmem_max
		echo "524288 1048576 2097152" > /proc/sys/net/ipv4/tcp_rmem
		echo "0" > /proc/sys/net/ipv4/tcp_tw_recycle
		echo "262144 524288 1048576" > /proc/sys/net.ipv4/tcp_wmem

		echo "5" > /proc/sys/vm/dirty_background_ratio
		echo "200" > /proc/sys/vm/dirty_expire_centisecs
		echo "20" > /proc/sys/vm/dirty_ratio
		echo "1500" > /proc/sys/vm/dirty_writeback_centisecs
		echo "12288" > /proc/sys/vm/min_free_kbytes
		echo "0" > /proc/sys/vm/swappiness
		echo "100" > /proc/sys/vm/vfs_cache_pressure
		echo "0" > /proc/sys/vm/drop_caches

		echo "2" > /proc/sys/net/ipv4/tcp_syn_retries
		echo "2" > /proc/sys/net/ipv4/tcp_synack_retries
		echo "10" > /proc/sys/net/ipv4/tcp_fin_timeout
	fi
	exit 0
fi

if [ "apply_eq_bands" == "$1" ]; then
	echo "1 4027 1031 0 276" > /sys/class/misc/boeffla_sound/eq_bands
	echo "2 8076 61555 456 456" > /sys/class/misc/boeffla_sound/eq_bands
	echo "3 7256 62323 2644 1368" > /sys/class/misc/boeffla_sound/eq_bands
	echo "4 5774 63529 1965 4355" > /sys/class/misc/boeffla_sound/eq_bands
	echo "5 1380 1369 0 16384" > /sys/class/misc/boeffla_sound/eq_bands
	exit 0
fi

if [ "apply_ext4_tweaks" == "$1" ]; then
	if [ "1" == "$2" ]; then
		/sbin/busybox sync
		/sbin/busybox mount -o remount,commit=20,noatime /dev/block/mmcblk0p8 /cache
		/sbin/busybox sync
		/sbin/busybox mount -o remount,commit=20,noatime /dev/block/mmcblk0p12 /data
		/sbin/busybox sync
	fi

	if [ "0" == "$2" ]; then
		/sbin/busybox sync
		/sbin/busybox mount -o remount,commit=0,noatime /dev/block/mmcblk0p8 /cache
		/sbin/busybox sync
		/sbin/busybox mount -o remount,commit=0,noatime /dev/block/mmcblk0p12 /data
		/sbin/busybox sync
	fi
	exit 0
fi

if [ "apply_zram" == "$1" ]; then
	if [ "1" == "$2" ]; then
		/sbin/busybox swapoff /dev/block/zram0
		echo "1" > /sys/block/zram0/reset
		echo "1" > /sys/block/zram0/initstate
		/sbin/busybox swapon /dev/block/zram0
		echo "70" > /proc/sys/vm/swappiness
	fi

	if [ "0" == "$2" ]; then
		/sbin/busybox swapoff /dev/block/zram0
		echo "1" > /sys/block/zram0/reset
		echo "0" > /sys/block/zram0/initstate
	fi
	exit 0
fi

if [ "apply_cifs" == "$1" ]; then
	if [ "1" == "$2" ]; then
		insmod $LIBPATH/cifs.ko
	fi

	if [ "0" == "$2" ]; then
		rmmod $LIBPATH/cifs.ko	
	fi
	exit 0
fi

if [ "apply_nfs" == "$1" ]; then
	if [ "1" == "$2" ]; then
		insmod $LIBPATH/sunrpc.ko
		insmod $LIBPATH/auth_rpcgss.ko
		insmod $LIBPATH/lockd.ko
		insmod $LIBPATH/nfs.ko
	fi

	if [ "0" == "$2" ]; then
		rmmod $LIBPATH/nfs.ko
		rmmod $LIBPATH/lockd.ko
		rmmod $LIBPATH/auth_rpcgss.ko
		rmmod $LIBPATH/sunrpc.ko
	fi
	exit 0
fi

if [ "apply_xbox" == "$1" ]; then
	if [ "1" == "$2" ]; then
		insmod $LIBPATH/xpad.ko
	fi

	if [ "0" == "$2" ]; then
		rmmod $LIBPATH/xpad.ko
	fi
	exit 0
fi

if [ "apply_exfat" == "$1" ]; then
	if [ "1" == "$2" ]; then
		insmod $LIBPATH/exfat_core.ko
		insmod $LIBPATH/exfat_fs.ko
	fi

	if [ "0" == "$2" ]; then
		rmmod $LIBPATH/exfat_fs.ko
		rmmod $LIBPATH/exfat_core.ko
	fi
	exit 0
fi

if [ "apply_ums" == "$1" ]; then
	if [ "1" == "$2" ]; then
		/sbin/busybox umount -l /mnt/extSdCard/
		/system/bin/setprop persist.sys.usb.config mass_storage,adb
		echo /dev/block/vold/179:49 > /sys/devices/platform/s3c-usbgadget/gadget/lun0/file
	fi

	if [ "0" == "$2" ]; then
		echo "" > /sys/devices/platform/s3c-usbgadget/gadget/lun0/file
		/system/bin/vold
		/system/bin/setprop persist.sys.usb.config mtp,adb
	fi
	exit 0
fi


# *******************
# Actions
# *******************

if [ "action_debug_info_file" == "$1" ]; then
	echo $(date) Full debug log file start > $2
	echo -e "\n============================================\n" >> $2

	echo -e "\n**** Boeffla-Kernel version\n" >> $2
	cat /proc/version >> $2

	echo -e "\n**** Firmware information\n" >> $2
	/sbin/busybox grep ro.build.version /system/build.prop >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** Boeffla-Kernel config\n" >> $2
	cat /sdcard/boeffla-kernel/boeffla-kernel.conf  >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** Boeffla-Kernel log\n" >> $2
	cat /sdcard/boeffla-kernel-data/boeffla-kernel.log >> $2

	echo -e "\n**** Boeffla-Kernel log 1\n" >> $2
	cat /sdcard/boeffla-kernel-data/boeffla-kernel.log.1 >> $2

	echo -e "\n**** Boeffla-Kernel log 2\n" >> $2
	cat /sdcard/boeffla-kernel-data/boeffla-kernel.log.2 >> $2

	echo -e "\n**** Boeffla-Kernel log 3\n" >> $2
	cat /sdcard/boeffla-kernel-data/boeffla-kernel.log.3 >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** Boeffla-Config app log\n" >> $2
	cat /sdcard/boeffla-kernel-data/bc.log >> $2

	echo -e "\n**** Boeffla-Config app log 1\n" >> $2
	cat /sdcard/boeffla-kernel-data/bc.log.1 >> $2

	echo -e "\n**** Boeffla-Config app log 2\n" >> $2
	cat /sdcard/boeffla-kernel-data/bc.log.2 >> $2

	echo -e "\n**** Boeffla-Config app log 3\n" >> $2
	cat /sdcard/boeffla-kernel-data/bc.log.3 >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** boeffla_sound\n" >> $2
	cat /sys/class/misc/boeffla_sound/boeffla_sound >> $2

	echo -e "\n**** headphone_volume\n" >> $2
	cat /sys/class/misc/boeffla_sound/headphone_volume >> $2

	echo -e "\n**** speaker_volume\n" >> $2
	cat /sys/class/misc/boeffla_sound/speaker_volume >> $2

	echo -e "\n**** speaker_tuning\n" >> $2
	cat /sys/class/misc/boeffla_sound/speaker_tuning >> $2

	echo -e "\n**** privacy_mode\n" >> $2
	cat /sys/class/misc/boeffla_sound/privacy_mode >> $2

	echo -e "\n**** equalizer\n" >> $2
	cat /sys/class/misc/boeffla_sound/eq >> $2

	echo -e "\n**** eq_gains\n" >> $2
	cat /sys/class/misc/boeffla_sound/eq_gains >> $2

	echo -e "\n**** eq_gains_alt\n" >> $2
	cat /sys/class/misc/boeffla_sound/eq_gains_alt >> $2

	echo -e "\n**** eq_bands\n" >> $2
	cat /sys/class/misc/boeffla_sound/eq_bands >> $2

	echo -e "\n**** dac_direct\n" >> $2
	cat /sys/class/misc/boeffla_sound/dac_direct >> $2

	echo -e "\n**** dac_oversampling\n" >> $2
	cat /sys/class/misc/boeffla_sound/dac_oversampling >> $2

	echo -e "\n**** fll_tuning\n" >> $2
	cat /sys/class/misc/boeffla_sound/fll_tuning >> $2

	echo -e "\n**** stereo_expansion\n" >> $2
	cat /sys/class/misc/boeffla_sound/stereo_expansion >> $2

	echo -e "\n**** mono_downmix\n" >> $2
	cat /sys/class/misc/boeffla_sound/mono_downmix >> $2

	echo -e "\n**** mic_level_general\n" >> $2
	cat /sys/class/misc/boeffla_sound/mic_level_general >> $2

	echo -e "\n**** mic_level_call\n" >> $2
	cat /sys/class/misc/boeffla_sound/mic_level_call >> $2

	echo -e "\n**** debug_level\n" >> $2
	cat /sys/class/misc/boeffla_sound/debug_level >> $2

	echo -e "\n**** debug_info\n" >> $2
	cat /sys/class/misc/boeffla_sound/debug_info >> $2

	echo -e "\n**** version\n" >> $2
	cat /sys/class/misc/boeffla_sound/version >> $2

	echo "\n============================================\n" >> $2

	echo -e "\n**** Loaded modules:\n" >> $2
	lsmod >> $2

	echo -e "\n**** Max CPU frequency:\n" >> $2
	cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq >> $2

	echo -e "\n**** CPU undervolting:\n" >> $2
	cat /sys/devices/system/cpu/cpu0/cpufreq/UV_mV_table >> $2

	echo -e "\n**** GPU frequencies:\n" >> $2
	cat /sys/class/misc/gpu_clock_control/gpu_control >> $2

	echo -e "\n**** GPU undervolting:\n" >> $2
	cat /sys/class/misc/gpu_voltage_control/gpu_control >> $2

	echo -e "\n**** Root:\n" >> $2
	ls /system/xbin/su >> $2
	ls /system/app/Superuser.apk >> $2

	echo -e "\n**** Mounts:\n" >> $2
	mount | /sbin/busybox grep /data >> $2
	mount | /sbin/busybox grep /cache >> $2

	echo -e "\n**** SD Card read ahead:\n" >> $2
	cat /sys/block/mmcblk0/bdi/read_ahead_kb >> $2
	cat /sys/block/mmcblk1/bdi/read_ahead_kb >> $2

	echo -e "\n**** System tweaks (vfs_cache_pressure/dirty_background_ratio/dirty_ratio/drop_caches:\n" >> $2
	cat /proc/sys/vm/vfs_cache_pressure >> $2
	cat /proc/sys/vm/dirty_background_ratio >> $2
	cat /proc/sys/vm/dirty_ratio >> $2
	cat /proc/sys/vm/drop_caches >> $2

	echo -e "\n**** Touch boost switch:\n" >> $2
	cat /sys/class/misc/touchboost_switch/touchboost_switch >> $2

	echo -e "\n**** Touch boost frequency:\n" >> $2
	cat /sys/class/misc/touchboost_switch/touchboost_freq >> $2

	echo -e "\n**** Touch wake:\n" >> $2
	cat /sys/class/misc/touchwake/enabled >> $2
	cat /sys/class/misc/touchwake/delay >> $2

	echo -e "\n**** Early suspend:\n" >> $2
	cat /sys/kernel/early_suspend/early_suspend_delay >> $2

	echo -e "\n**** Charging levels (ac/usb):\n" >> $2
	cat /sys/kernel/charge_levels/charge_level_ac >> $2
	cat /sys/kernel/charge_levels/charge_level_usb >> $2

	echo -e "\n**** Governor:\n" >> $2
	cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor >> $2

	echo -e "\n**** Scheduler:\n" >> $2
	cat /sys/block/mmcblk0/queue/scheduler >> $2
	cat /sys/block/mmcblk1/queue/scheduler >> $2

	echo -e "\n**** Kernel Logger:\n" >> $2
	cat /sys/kernel/printk_mode/printk_mode >> $2

	echo -e "\n**** Android Logger:\n" >> $2
	cat /sys/kernel/logger_mode/logger_mode >> $2

	echo -e "\n**** Sharpness fix:\n" >> $2
	cat /sys/class/misc/mdnie_preset/mdnie_preset >> $2

	echo -e "\n**** LED fading:\n" >> $2
	cat /sys/class/sec/led/led_fade >> $2

	echo -e "\n**** LED intensity:\n" >> $2
	cat /sys/class/sec/led/led_intensity >> $2

	echo -e "\n**** LED speed:\n" >> $2
	cat /sys/class/sec/led/led_speed >> $2

	echo -e "\n**** LED slope:\n" >> $2
	cat /sys/class/sec/led/led_slope >> $2

	echo -e "\n**** zRam disk size:\n" >> $2
	cat /sys/block/zram0/disksize >> $2

	echo -e "\n**** zRam compressed data size:\n" >> $2
	cat /sys/block/zram0/compr_data_size >> $2

	echo -e "\n**** zRam original data size:\n" >> $2
	cat /sys/block/zram0/orig_data_size >> $2

	echo -e "\n**** Uptime:\n" >> $2
	cat /proc/uptime >> $2

	echo -e "\n**** Frequency usage table:\n" >> $2
	cat /sys/devices/system/cpu/cpu0/cpufreq/stats/time_in_state >> $2

	echo -e "\n**** Memory:\n" >> $2
	/sbin/busybox free -m >> $2

	echo -e "\n**** Meminfo:\n" >> $2
	cat /proc/meminfo >> $2

	echo -e "\n**** Swap:\n" >> $2
	cat /proc/swaps >> $2

	echo -e "\n**** Low memory killer:\n" >> $2
	cat /sys/module/lowmemorykiller/parameters/minfree >> $2

	echo -e "\n**** Swappiness:\n" >> $2
	cat /proc/sys/vm/swappiness >> $2

	echo -e "\n**** Storage:\n" >> $2
	/sbin/busybox df >> $2

	echo -e "\n**** Mounts:\n" >> $2
	/sbin/busybox mount >> $2

	echo -e "\n**** pegasusq tuneables\n" >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_1_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_1_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_2_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_2_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_3_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_freq_4_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_3_1 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/hotplug_rq_4_0 >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/cpu_down_rate >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/cpu_up_rate >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/up_threshold >> $2
	cat /sys/devices/system/cpu/cpufreq/pegasusq/freq_step >> $2

	echo -e "\n**** zzmoove tuneables\n" >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/sampling_rate_sleep_multiplier >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_factor >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_max_momentum >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/sampling_down_momentum_sensitivity >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/smooth_up >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/smooth_up_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug1 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug2 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/up_threshold_hotplug3 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug1 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug2 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/down_threshold_hotplug3 >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/disable_hotplug >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/hotplug_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/freq_step >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/freq_step_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/freq_limit >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/freq_limit_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/fast_scaling_sleep >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/early_demand >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/grad_up_threshold >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/ignore_nice_load >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_enable >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_cores >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_up_delay >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_down_delay >> $2
	cat /sys/devices/system/cpu/cpufreq/zzmoove/lcdfreq_kick_in_freq >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** /data/app folder\n" >> $2
	ls -l /data/app >> $2

	echo -e "\n**** /system/app folder\n" >> $2
	ls -l /system/app >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** /system/etc/init.d folder\n" >> $2
	ls -l /system/etc/init.d >> $2

	echo -e "\n**** /etc/init.d folder\n" >> $2
	ls -l /etc/init.d >> $2

	echo -e "\n**** /data/init.d folder\n" >> $2
	ls -l /data/init.d >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** last_kmsg\n" >> $2
	cat /proc/last_kmsg  >> $2

	echo -e "\n============================================\n" >> $2

	echo -e "\n**** dmesg\n" >> $2
	dmesg  >> $2

	echo -e "\n============================================\n" >> $2
	echo $(date) Full debug log file end >> $2
	exit 0
fi

if [ "action_reboot" == "$1" ]; then
	/sbin/busybox sync
	/sbin/busybox sleep 1s
	/system/bin/reboot
	exit 0
fi

if [ "action_reboot_cwm" == "$1" ]; then
	/sbin/busybox sync
	/sbin/busybox sleep 1s
	/system/bin/reboot recovery
	exit 0
fi

if [ "action_reboot_download" == "$1" ]; then
	/sbin/busybox sync
	/sbin/busybox sleep 1s
	/system/bin/reboot download
	exit 0
fi

if [ "action_wipe_caches_reboot" == "$1" ]; then
	/sbin/busybox rm -rf /cache/*
	/sbin/busybox rm -rf /data/dalvik-cache/*
	/sbin/busybox sync
	/sbin/busybox sleep 1s
	/system/bin/reboot
	exit 0
fi

if [ "action_wipe_clipboard_cache" == "$1" ]; then
	/sbin/busybox rm -rf /data/clipboard/*
	/sbin/busybox sync
	exit 0
fi

if [ "action_clean_initd" == "$1" ]; then
	/sbin/busybox tar cvz -f $2 /system/etc/init.d
	/sbin/busybox mount -o remount,rw -t ext4 /dev/block/mmcblk0p9 /system
	/sbin/busybox rm /system/etc/init.d/*
	/sbin/busybox mount -o remount,ro -t ext4 /dev/block/mmcblk0p9 /system
	exit 0
fi

if [ "action_fix_permissions" == "$1" ]; then
	/sbin/busybox sh /res/bc/fix_permissions
	/sbin/busybox sync
	exit 0
fi

if [ "action_fstrim" == "$1" ]; then
	echo -e "Trim /data"
	/res/bc/fstrim -v /data
	echo -e ""
	echo -e "Trim /cache"
	/res/bc/fstrim -v /cache
	echo -e ""
	echo -e "Trim /system"
	/res/bc/fstrim -v /system
	echo -e ""
	/sbin/busybox sync
	exit 0
fi


if [ "flash_kernel" == "$1" ]; then
	/sbin/busybox dd if=$2 of=/dev/block/mmcblk0p5
	exit 0
fi

if [ "extract_kernel" == "$1" ]; then
	/sbin/busybox tar -xvf $2 -C $3
	exit 0
fi

if [ "flash_recovery" == "$1" ]; then
	/sbin/busybox dd if=$2 of=/dev/block/mmcblk0p6
	exit 0
fi

if [ "extract_recovery" == "$1" ]; then
	/sbin/busybox tar -xvf $2 -C $3
	exit 0
fi

if [ "flash_cm_kernel" == "$1" ]; then
	/sbin/busybox dd if=$2/boot.img of=/dev/block/mmcblk0p5
	/sbin/busybox mount -o remount,rw -t ext4 /dev/block/mmcblk0p9 /system
	/sbin/busybox rm -f /system/lib/modules/*
	/sbin/busybox cp $2/system/lib/modules/* /system/lib/modules
	/sbin/busybox chmod 644 /system/lib/modules/*
	/sbin/busybox mount -o remount,ro -t ext4 /dev/block/mmcblk0p9 /system
	exit 0
fi

if [ "extract_cm_kernel" == "$1" ]; then
	/sbin/busybox unzip $2 -d $3
	exit 0
fi
