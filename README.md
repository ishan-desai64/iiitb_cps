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
$   git clone https://github.com/ishan-desai64/iiitb_cps
$   cd iiitb_cps
$   iverilog iiitb_cps iiitb_cps.v iiitb-cps_tb.v
$   ./a.out
$   gtkwave dump.vcd
```

## Synthesis of Verilog Code
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
# GLS - Gate Level Simulation
GLS is generating the simulation output by running test bench with netlist file generated from synthesis as design under test. Netlist is logically same as RTL code, therefore, same test bench can be used for it.

**Why GLS?**

The main reasons for running GLS are as follows:

  * To verify the power up and reset operation of the design and also to check that the design does not have any unintentional dependencies on initial conditions.
  * To give confidence in verification of low power structures, absent in RTL and added during synthesis. 
  * It is a probable method to catch multicycle paths if tests exercising them are available.
  * Power estimation is done on netlist for the power numbers. 
  * To verify DFT structures absent in RTL and added during or after synthesis. Scan chains are generally inserted after the gate level netlist has been created. Hence, gate level simulations are often used to determine whether scan chains are correct. GLS is also required to simulate ATPG patterns. 
  * Tester patterns (patterns to screen parts for functional or structural defects on tester) simulations are done on gate level netlist.
  * To help reveal glitches on edge sensitive signals due to combination logic. Using both worst and best-case timing may be necessary.
  * It is a probable method to check the critical timing paths of asynchronous designs that are skipped by STA.
  * To avoid simulation artifacts that can mask bugs at RTL level (because of no delays at RTL level).
  * Could give insight to constructs that can cause simulation-synthesis mismatch and can cause issues at the netlist level.
  * To check special logic circuits and design topology that may include feedback and/or initial state considerations, or circuit tricks. If a designer is concerned about some logic then this is good candidate for gate simulation. Typically, it is a good idea to check reset circuits in gate simulation. Also, to check if we have any uninitialized logic in the design which is not intended and can cause issues on silicon.
  * To check if design works at the desired frequency with actual delays in place.
  * It is a probable method to find out the need for synchronizers if absent in design. It will cause “x” propagation on timing violation on that flop.

Below picture gives an insight of the procedure. Here while using iverilog, you also include gate level verilog models to generate GLS simulation.

![image](https://user-images.githubusercontent.com/72696170/183296780-4bad9547-69e9-4cee-b791-acb5a38951bf.png)



# SIMULATION
Pre - synthesis simulation waveform:
![Screenshot from 2022-08-17 21-06-10](https://user-images.githubusercontent.com/70513539/185191281-f9b2f2ba-3362-43fd-b6aa-a299bad6f539.png)


Post - synthesis simulation waveform:
![Screenshot from 2022-08-17 21-41-56](https://user-images.githubusercontent.com/70513539/185191072-5dc9a4e1-bbde-4eef-bd92-a312a96e69a5.png)


#Stats
![Screenshot from 2022-08-17 21-47-03](https://user-images.githubusercontent.com/70513539/185190966-255f8aff-070d-49b3-9d6c-be069313b56b.png)



# FUTURE WORKS
* Installation of openlane.
* Floor planning.


## Contributors 

- **Archan Desai** 
- **Kunal Ghosh** 
- **Rakshit Bhatia**
- **Ishan Desai**
- 


## Acknowledgments

- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
- Archan Desai

## Contact Information

- Ishan Desai, Postgraduate Student, International Institute of Information Technology, Bangalore  ishan.desai64@gmail.com
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com









