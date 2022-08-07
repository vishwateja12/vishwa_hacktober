Carry Look Ahead
.include TSMC_180nm.txt
.param SUPPLY = 1.8
.param LAMBDA = 0.09u
.param width_N = 10*LAMBDA
.param width_P = 20*LAMBDA
.global vdd gnd

Vdd vdd gnd 'SUPPLY'

Vin_p1 P1 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)
Vin_g1 G1 gnd pwl (0 1.8v 50ns 1.8v 50ns 1.8v 100ns 1.8v)

Vin_p2 P2 gnd pwl (0 1.8v 50ns 1.8v 50ns 1.8v 100ns 1.8v)
Vin_g2 G2 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)

Vin_p3 P3 gnd pwl (0 1.8v 50ns 1.8v 50ns 1.8v 100ns 1.8v)
Vin_g3 G3 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)

Vin_p4 P4 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)
Vin_g4 G4 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)

Vin_c0 C0 gnd pwl (0 0v 50ns 0v 100ns 0v 100ns 0v)

.subckt AND A B Z Y Y_bar vdd gnd

M1 Y_bar A Z gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M2 Z B gnd gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M3 Y_bar A vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M4 Y_bar B vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M5 Y Y_bar gnd gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M6 Y Y_bar vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

.ends AND

.subckt OR A B Z Y Y_bar vdd gnd

M1 Y_bar A gnd gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M2 Y_bar B gnd gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M3 Y_bar A Z vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M4 Z B vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M5 Y Y_bar gnd gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M6 Y Y_bar vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

.ends OR

***** For C1 
X01 P1 C0 v1 Z01 Z01_bar vdd gnd AND
X02 G1 Z01 v2 C1 C1_bar vdd gnd OR

***** For C2
X03 P2 G1 v3 Z02 Z02_bar vdd gnd AND
X04 Z01 P2 v4 Z04 Z04_bar vdd gnd AND
X05 Z02 Z04 v5 Z05 Z05_bar vdd gnd OR
X06 G2 Z05 v6 C2 C2_bar vdd gnd OR

***** For C3
X07 P3 G2 v7 Z06 Z06_bar vdd gnd AND
X08 P3 Z02 v8 Z08 Z08_bar vdd gnd AND
X09 P3 Z04 v9 Z09 Z09_bar vdd gnd AND
X10 Z06 Z08 v10 Z11 Z11_bar vdd gnd OR
X11 Z09 Z11 v11 Z12 Z12_bar vdd gnd OR
X12 Z12 G3 v12 C3 C3_bar vdd gnd OR

***** For C4
X13 P4 Z09 v13 Z13 Z13_bar vdd gnd AND
X14 P4 Z08 v14 Z14 Z14_bar vdd gnd AND
X15 P4 Z06 v15 Z15 Z15_bar vdd gnd AND
X16 P4 G3 v16 Z16 Z16_bar vdd gnd AND
X17 Z13 Z14 v20 Z20 Z20_bar vdd gnd OR
X18 Z20 Z15 v21 Z21 Z21_bar vdd gnd OR
X19 Z21 Z16 v22 Z22 Z22_bar vdd gnd OR
X20 Z22 G4 v23 C4 C4_bar vdd gnd OR

.tran 0.1n 100ns

.control 
set hcopypscolor = 1
set color0 = white
set color1 = black

run
set curplottitle = "Sresthavadhani-2019102032-CLA"
plot v(P1) v(G1)+2 v(C0)+4 v(C1)+6
plot v(P2) v(G2)+2 v(C2)+4
plot v(P3) v(G3)+2 v(C3)+4
plot v(P4) v(G4)+2 v(C4)+4

.endc
