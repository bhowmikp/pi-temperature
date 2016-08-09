#!/bin/bash

FILENAME="html/temp.txt"
START_TIME="00:00:00"
INTERVAL=3600

# infinite loop
while true;
do
    # starts measuiring temperature from midnight
    if [ $(date +"%T") = $START_TIME ];then
        # clears previous days info
        echo -ne "" > $FILENAME

        # check for every hour
        for i in {1..24}
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

            sleep $INTERVAL
        done
    else
        # checks if correct time every second
        sleep 1
    fi;
done
