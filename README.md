Monitors the Raspberry Pi's temperature using the onboard sensor and puts that in a file.

Methods to execute code
=================================
a) If on PI with keyboard, mouse, monitor <br />
chmod +x temp.sh <br />
./temp.sh &

b) SSH/ Remote Desktop (Ex - Putty) <br />
chmod +x temp.sh <br />
nohup ./temp.sh &

To stop the program running in background enter following commands in terminal: <br />
jobs <br />
kill %[process number]

To view if code is still running in background enter following command in terminal: <br />
jobs <br />
   
Current Use
=================================
Currently this code creates a file on my server which can then be viewed much easily.
   
Future Plans
=================================
I want to use the raspberry to get the temperature of my room. Since I do not have a temperature sensor module I will try to calibrate the temperature reading from the onboard sensor to get an idea of the room temperature. This method will not be perfect but the idle raspberry temperature should be able to get a good estimate.
