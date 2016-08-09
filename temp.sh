#!/bin/bash

file_name="file.txt"

while true;
do
    if [ $(date +"%T") = "00:00:00" ];
    then
        echo -ne "" > $file_name
        for i in {1..24}
        do
            echo -ne  $(date +"%T") >> $file_name
            echo -ne " - " >> $file_name
            /opt/vc/bin/vcgencmd measure_temp >> $file_name
            sleep 3600
        done
    else
        sleep 1
    fi;
done
