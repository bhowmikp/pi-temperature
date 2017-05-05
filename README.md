# Pi_Temperature
Monitors the Raspberry Pi's(Model 3B) temperature using the onboard sensor and puts the information in a file. Temperature and cpu speed are recorded to determine, board usage is effecting temperrature. Intention of the project was to find a co-relation between the temperature of board and room temperature and then use the temperature of the board to predict room temperature.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 


### Installing

A step by step series of examples that tell you have to get a development env running

Say what the step will be

```
a) Enter following commands in terminal:
chmod +x temp.bash
./temp.bash &

To stop the program running in background enter following commands in terminal:
jobs
kill %[process number]

To view if code is still running in background enter following command in terminal: 
jobs
```

### Future Plans
I want to use the raspberry to get the temperature of my room. Since I do not have a temperature sensor module I will try to calibrate the temperature reading from the onboard sensor to get an idea of the room temperature. This method will not be perfect but the idle raspberry temperature should be able to get a good estimate.

## Authors

* **Prantar Bhowmik** - *Initial work* - [bhowmikp](https://github.com/bhowmikp)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE) file for details
