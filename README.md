
# iiitb_cps
This Project is done as a part of course project in subject known as "Physical Design of ASIC".In this project we will complete RTL design to GDS with the help of OpenLane using SKYwater PDKs

## Introduction
At this moment due to increases in vehicle’s traffic,
parking is one of the biggest issue people are facing 
especially in metro city across the world. In this project I
have created a car parking system using Verilog HDL.

## State Diagram
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
## GLS - Gate Level Simulation
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



## SIMULATION

Pre - synthesis simulation waveform: 

![Screenshot from 2022-08-17 21-06-10](https://user-images.githubusercontent.com/70513539/185191281-f9b2f2ba-3362-43fd-b6aa-a299bad6f539.png)


Post - synthesis simulation waveform:

![Screenshot from 2022-08-17 21-41-56](https://user-images.githubusercontent.com/70513539/185191072-5dc9a4e1-bbde-4eef-bd92-a312a96e69a5.png)


#Stats

![Screenshot from 2022-08-17 21-47-03](https://user-images.githubusercontent.com/70513539/185190966-255f8aff-070d-49b3-9d6c-be069313b56b.png)

## Physical Design using SKYwater 130 PDK:

In this module we will see various ASIC Design flows such as
1) RTL Design
2) Synthesis
3) FloorPlan
4) Placement
5) Clock Tree Synthesis(CTS)
6) Routing
7) SignOff
8) Tapeout

We have already completed first two parts of ASIC Design flow RTL design and Synthesis,from now we will complete remaining steps with the help of 
OpenLane and Magic softwares.

### OpenLane
OpenLane is an automated RTL to GDSII flow based on several components including OpenROAD, Yosys, Magic, Netgen, CVC, SPEF-Extractor, CU-GR, Klayout and a number of custom scripts for design exploration and optimization. The flow performs full ASIC implementation steps from RTL all the way down to GDSII. To know more go to https://github.com/The-OpenROAD-Project/OpenLane

#### OpenLane Installation
To download OpenLane Software follow this below given steps:
1) Download Docker from here https://docs.docker.com/engine/install/ubuntu/
2) Download python3 if it is not already downloaded using following command
```
$   apt install -y build-essential python3 python3-venv python3-pip
```
3) Go to Home directory and write this commands there
```
$   git clone https://github.com/The-OpenROAD-Project/OpenLane.git
$   cd OpenLane/
$   sudo make
```
4) To test 
```
$ sudo make test
```
## Magic

Magic is a venerable VLSI layout tool, written in the 1980's at Berkeley by John Ousterhout, now famous primarily for writing the scripting interpreter language Tcl. Due largely in part to its liberal Berkeley open-source license, magic has remained popular with universities and small companies. The open-source license has allowed VLSI engineers with a bent toward programming to implement clever ideas and help magic stay abreast of fabrication technology. However, it is the well thought-out core algorithms which lend to magic the greatest part of its popularity. Magic is widely cited as being the easiest tool to use for circuit layout, even for people who ultimately rely on commercial tools for their product design flow. More about magic at http://opencircuitdesign.com/magic/index.html

#### Installation Steps
1) Type this following command in home directory to downlaod
```
$   sudo apt-get install m4
$   sudo apt-get install tcsh
$   sudo apt-get install csh
$   sudo apt-get install libx11-dev
$   sudo apt-get install tcl-dev tk-dev
$   sudo apt-get install libcairo2-dev
$   sudo apt-get install mesa-common-dev libglu1-mesa-dev
$   sudo apt-get install libncurses-dev

```
2) Type following command to download in home directory

```
$   git clone https://github.com/RTimothyEdwards/magic
$   cd magic/
$   ./configure
$   sudo make
$   sudo make install

```
### i) Preperation
To get Layout first use followig steps
```
1) Create folder iiitb_cps in OpenLane
2) Create src folder in iiitb_cps
3) copy file iiitb_cps.v in src
4) create config.jason file in iiitb_cps folder

```
To open magic layout type following command in OpenLane directory
```
sudo make mount
./flow.tcl -interactive
```
This above written command will create a space where type following command
```
prep -design iiitb_cps 
set lefs [glob $::env(DESIGN_DIR)/src/*.lef]
add_lefs -src $lefs
```
### 1) Synthesis
To get synthesis types following command
```
run_synthesis
```
To get report do following steps
1) Go to iiitb_cps in OpenLane
2) Go to 'runs' folder which is created after running above command 
3) Go to logs folder and open synthesis folder
4) open 32-synthesis log

You will see following results

![Screenshot from 2022-08-30 20-57-59](https://user-images.githubusercontent.com/70513539/187478005-787bc114-9446-4ee2-99bc-a87dacfc8f83.png)

### 2) Floorplan

In the VLSI physical design, floorplanning is an essential design step, as it determines the size, shape, and locations of modules in a chip and as such it estimates the total chip area, the interconnects, and, delay. Computationally, VLSI floorplanning is an NP hard problem.

Type following command to get floorplan result

```
run_floorplan
```
To see results of floorplan got to 
```
OpenLane-->iiitb_cps-->runs-->results-->floorplan
```
Type following command to get results
```
magic -T /home/ishan/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def read iiitb_cps.def &
```
#Result

![Screenshot from 2022-08-30 20-57-59](https://user-images.githubusercontent.com/70513539/187479851-f3c8a4c0-3f86-4acb-8143-543c97b26848.png)

### 3) Placement
Placement is the process of finding a suitable physical location for each cell in the block.
Timing
power area
optimization
Routable design
Minimum cell density 
pin density(Reduce the congestion  due to cells and pins) 
Minimum timing DRC’s

Type following command to get Placement result

```
run_placement
```
To see results of floorplan got to 
```
OpenLane-->iiitb_cps-->runs-->results-->placement
```
Type following command to get results
```
magic -T /home/ishan/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def read iiitb_cps.def &
```
#Result

![Screenshot from 2022-08-30 15-37-42](https://user-images.githubusercontent.com/70513539/187410827-9b4a5cbe-a951-4167-88ce-15ac559dcaf6.png)


![Screenshot from 2022-08-30 15-50-04](https://user-images.githubusercontent.com/70513539/187412879-87677109-3d89-4eb5-92fc-d500b91de42a.png)


### 4) Clock Tree Synthesis

Clock Tree Synthesis is a technique for distributing the clock equally among all sequential parts of a VLSI design. The purpose of Clock Tree Synthesis is to reduce skew and delay. Clock Tree Synthesis is provided the placement data as well as the clock tree limitations as input.

Type following command to get Placement result

```
run_placement
```
To see results of floorplan got to 
```
OpenLane-->iiitb_cps-->runs-->results-->cts
```
#Result

![Screenshot from 2022-08-30 21-17-43](https://user-images.githubusercontent.com/70513539/187482534-903e6184-61c4-4bb7-a10e-233d55312821.png)

#### Power report

![Screenshot from 2022-08-30 21-20-41](https://user-images.githubusercontent.com/70513539/187483032-771ae517-3e51-4b43-9d81-ee3d89a4e359.png)

### 5) Routing

Making physical connections between signal pins using metal layers are called Routing. Routing is the stage after CTS and optimization where exact paths for the interconnection of standard cells and macros and I/O pins are determined.

Type following command to get Routing result
```
run_routing
```
To see results of floorplan got to 
```
OpenLane-->iiitb_cps-->runs-->results-->routing
```
Type following command to get results
```
magic -T /home/ishan/OpenLane/pdks/sky130A/libs.tech/magic/sky130A.tech lef read ../../tmp/merged.nom.lef def read iiitb_cps.def &
```
#Result

![Screenshot from 2022-08-30 21-22-30](https://user-images.githubusercontent.com/70513539/187483507-78be14bb-2c11-48dd-bb69-9d0bae2f0d74.png)


## FUTURE WORKS
* Signoff
* Tapeout


## Contributors 

- **Archan Desai** 
- **Kunal Ghosh** 
- **Rakshit Bhatia**
- **Ishan Desai**



## Acknowledgments

- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd.
- Archan Desai

## Contact Information

- Ishan Desai, Postgraduate Student, International Institute of Information Technology, Bangalore  ishan.desai64@gmail.com
- Kunal Ghosh, Director, VSD Corp. Pvt. Ltd. kunalghosh@gmail.com









