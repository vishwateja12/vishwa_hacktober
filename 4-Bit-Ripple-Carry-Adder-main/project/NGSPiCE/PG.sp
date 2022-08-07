Propagate and Generate
.include TSMC_180nm.txt
.param SUPPLY = 1.8
.param LAMBDA = 0.09u
.param width_N = 10*LAMBDA
.param width_P = 20*LAMBDA
.global vdd gnd

Vdd vdd gnd 'SUPPLY'

Vin_a1 A1 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)
Vin_b1 B1 gnd pwl (0 1.8v 50ns 1.8v 50ns 0v 100ns 0v)

Vin_a2 A2 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)
Vin_b2 B2 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)

Vin_a3 A3 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)
Vin_b3 B3 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)

Vin_a4 A4 gnd pwl (0 1.8v 50ns 1.8v 50ns 0v 100ns 0v)
Vin_b4 B4 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)

.subckt NOT A A_bar vdd gnd

M1 A_bar A gnd gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}
 
M2 A_bar A vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}
 
.ends NOT

.subckt XOR A B A_bar B_bar P Q R S Y vdd gnd 

M1 R B_bar gnd gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M2 Y A P vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M3 Y A_bar R gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M4 P B_bar vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M5 S B gnd gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M6 Y B Q vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

M7 Y A S gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}

M8 Q A_bar vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}

.ends XOR

.subckt AND A B Z Y_bar Y vdd gnd

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

X10 A1 A1_bar vdd gnd NOT
X20 A2 A2_bar vdd gnd NOT
X30 A3 A3_bar vdd gnd NOT
X40 A4 A4_bar vdd gnd NOT
X50 B1 B1_bar vdd gnd NOT
X60 B2 B2_bar vdd gnd NOT
X70 B3 B3_bar vdd gnd NOT
X80 B4 B4_bar vdd gnd NOT

X1 A1 B1 A1_bar B1_bar l1  m1 n1 r1 P1 vdd gnd XOR
X2 A1 B1 Z1 G1_bar G1 vdd gnd AND

X3 A2 B2 A2_bar B2_bar l2 m2 n2 r2 P2 vdd gnd XOR
X4 A2 B2 Z2 G2_bar G2 vdd gnd AND

X5 A3 B3 A3_bar B3_bar l3 m3 n3 r3 P3 vdd gnd XOR
X6 A3 B3 Z3 G3_bar G3 vdd gnd AND

X7 A4 B4 A4_bar B4_bar l4 m4 n4 r4 P4 vdd gnd XOR
X8 A4 B4 Z4 G4_bar G4 vdd gnd AND

.tran 0.1n 100n

.control

set hcopypscolor = 1
set color0 = white
set color1 = black

run
set curplottitle = "Sresthavadhani-2019102032-PG"
plot v(A1) v(B1)+2 v(P1)+4 v(G1)+6

plot v(A2) v(B2)+2 v(P2)+4 v(G2)+6

plot v(A3) v(B3)+2 v(P3)+4 v(G3)+6

plot v(A4) v(B4)+2 v(P4)+4 v(G4)+6

.endc
