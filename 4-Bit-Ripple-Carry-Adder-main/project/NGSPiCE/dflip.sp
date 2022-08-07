D-flip flop

.include TSMC_180nm.txt
.param SUPPLY = 1.8
.param LAMBDA = 0.09u
.param width_N = 10*LAMBDA
.param width_P = 20*LAMBDA
.global vdd gnd

Vdd vdd gnd 'SUPPLY'
Vin_d D gnd pwl (0 0v 3ns 0v 3ns 1.8v 100ns 1.8v)
*Vin_d D gnd pulse 0 1.8 2ns 100ps 100ps 3ns 6ns
Vin_Clk Clk gnd pulse 1.8 0 0ns 100ps 100ps 5ns 10ns

.subckt NAND A B Y vdd gnd 

M1 Y A vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M2 Y B vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M3 Y A Z gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M4 Z B gnd gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

.ends NAND

.subckt NAND3 A B C Y vdd gnd

M1 Y A vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M2 Y B vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M3 Y C vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M4 Y A Z1 gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M5 Z1 B Z2 gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M6 Z2 C gnd gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

.ends NAND3

X1 D R Zz1 vdd gnd NAND
X2 P Clk Zz1 R vdd gnd NAND3
X3 Zz0 Clk P vdd gnd NAND
X4 Zz1 P Zz0 vdd gnd NAND
X5 P S Q vdd gnd NAND
X6 R Q S vdd gnd NAND


.tran 0.1n 50n

.measure tran tpd1
+TRIG v(clk) val = 'SUPPLY/2' RISE = 1
+TARG v(Q) val = 'SUPPLY/2' RISE = 1

.control
set hcopypscolor = 1
set color0 = white
set color1 = black

run
set curplottitle = "Sresthavadhani-2019102032-flip"
plot v(Clk) v(D)+2  v(Q)+4
hardcopy dflip.eps v(Clk) v(D)+2 v(Q)+4
.endc

