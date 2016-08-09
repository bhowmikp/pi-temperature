Monitors the Raspberry Pi's temperature using the onboard sensor and puts that in a file.

Methods to execute code
=================================
a) bash temp.sh &

b) chmod +x temp.sh <br />
   ./temp.sh &
   
Current Use
=================================
Currently this code creates a file on my server which I can then monitor.
   
Future Plans
=================================
I want to use the raspberry my to get the temperature of my room. Since I do not have a temperature sensor module I will try to calibrate the numbers from the onboard sensor to get an idea of the room temperature. The method will not be perfect but the idle raspberry temperature should be able to get a good estimate.
