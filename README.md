# iiitb_cps
This Project is on car parking system.
# Introduction
At this moment due to increases in vehicle’s traffic,
parking is one of the biggest issue people are facing 
especially in metro city across the world. In this project I
have created a car parking system using Verilog HDL.

# State Diagram
In this system we are using 5 states which are as follows
1) IDLE: This is initial state of the system.
2) WAIT_PASSWORD: This state will reach 
when vehicle is at the gate and password request 
has generated.
3) RIGHT PASSWORD: This state is for if
password given is right.
4) WRONG PASSWORD: Thisstate is for if given 
is wrong and it will request password another 
time.
5) STOP: If there is another car inside then is state 
will generate.
![Car Parking System](https://user-images.githubusercontent.com/70513539/182803214-cc2d78b4-3ab4-4587-bfd6-a50657b7da2b.jpg)
## About iverilog 
Icarus Verilog is an implementation of the Verilog hardware description language.
## About GTKWave
GTKWave is a fully featured GTK+ v1. 2 based wave viewer for Unix and Win32 which reads Ver Structural Verilog Compiler generated AET files as well as standard Verilog VCD/EVCD files and allows their viewing
### Installing iverilog and GTKWave

#### For Ubuntu

Open your terminal and type the following to install iverilog and GTKWave
```
$   sudo apt get update
$   sudo apt get install iverilog gtkwave
```


### Functional Simulation
To clone the Repository and download the Netlist files for Simulation, enter the following commands in your terminal.
```
$   sudo apt install -y git
$   git clone 
$   cd iiitb_cps
$   iverilog
$   ./a.out
$   gtkwave dump.vcd

### Simulation Result
![iiitb_cps_output_waveform](https://user-images.githubusercontent.com/70513539/182803650-8e0282fe-a5d1-4b52-994b-d64dc0fdf06d.PNG)

## synthesis of Verilog Code
#### About Yosys
Yosys is a framework for Verilog RTL synthesis. It currently has extensive Verilog-2005 support and provides a basic set of synthesis algorithms for various application domains
```
$   sudo apt-get update
$   sudo apt-get -y install yosys
```
to synthesize
```
$   yosys -s yosys_run.sh
```
## Contributors 

- **Ishan Desai* 
- **Kunal Ghosh** 
- 



## Acknowledgments


- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
- Archan Desai

## Contact Information

- Ishan Desai, Postgraduate Student, International Institute of Information Technology, Bangalore  ishan.desai64@gmail.com
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com









