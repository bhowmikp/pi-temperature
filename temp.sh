#!/bin/bash

FILENAME="file.txt"

# infinite loop
while true;
do
    # starts measuiring temperature from midnight
    if [ $(date +"%T") = "04:09:00" ];then
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
            COUNT=`expr $CURR_CPU - $MIN_CPU`

            # determine cpu usage
            if [ $COUNT -eq 0 ];then
                echo -ne " - IDLE" >> $FILENAME
            elif [ $COUNT -gt 0 ] && [ $COUNT -lt 2000 ];then
                echo -ne " - MILD USE" >> $FILENAME
            else
                echo -ne " - HIGH USE" >> $FILENAME
            fi;

            # current cpu speed
            echo -ne " - Current CPU speed: $CURR_CPU kHz\n" >> $FILENAME

            sleep 3600
        done
    else
        # checks if correct time every second
        sleep 1
    fi;
done
