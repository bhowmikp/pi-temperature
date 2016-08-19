#!/bin/bash

FILENAME="temp.txt"
START_TIME="00:00:00"

# enter in seconds
INTERVAL=900

# readjust to sync time. enter in iteration. better keep time under so it works everyday
READJUST_TIME_EVERY=3

# infinite loop
while true;
do
    # help keep pi keep track of time properly. start checking time from this iteration
    KEEP_TIME_SYNC=4

    # starts measuiring temperature from midnight
    if [ $(date +"%T") = $START_TIME ];then
	# clears previous days info
	echo -ne "" > $FILENAME

	number_of_loop=`expr $((( 60 * 60 * 24 ) / $INTERVAL ))`

	# check for every hour
	for (( i=1; i<=$number_of_loop; i++ ))
        do
	    # enter local time
            echo -ne  $(date +"%T") >> $FILENAME
            echo -ne " - " >> $FILENAME

	    # enter temperature
            echo -ne $(/opt/vc/bin/vcgencmd measure_temp) >> $FILENAME

	    # cpu speed
	    CURR_CPU=$(sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq)
	    MIN_CPU=$(sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_min_freq)
	    MAX_CPU=$(sudo cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_max_freq)
	    CURR_CPU_PERCENT=`expr $(((( CURR_CPU - MIN_CPU ) / (MAX_CPU - MIN_CPU )) * 100))`

	    echo -ne " - Current CPU usage: $CURR_CPU_PERCENT% - Current CPU speed: $CURR_CPU kHz\n" >> $FILENAME

	    # sometimes pi adds a second. This helps metigate its effects
	    if [ $KEEP_TIME_SYNC == $i ];then
		delay=`expr $(( $INTERVAL - 1 ))`
		KEEP_TIME_SYNC=`expr $(( KEEP_TIME_SYNC + READJUST_TIME_EVERY ))`
	    else
		delay=$INTERVAL
	    fi;

            sleep $delay
        done
        # show script has completed running
        echo -ne "EOF" >> $FILENAME
    else
	# checks if correct time every second
	sleep 1
    fi;
done
