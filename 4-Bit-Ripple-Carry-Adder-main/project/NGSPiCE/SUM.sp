Sum
.include TSMC_180nm.txt
.param SUPPLY = 1.8
.param LAMBDA = 0.09u
.param width_N = 10*LAMBDA
.param width_P = 20*LAMBDA
.global vdd gnd

Vdd vdd gnd 'SUPPLY'

Vin_p1 P1 gnd pwl (0 1.8v 50ns 1.8v 50ns 0v 100ns 0v)
Vin_p2 P2 gnd pwl (0 1.8v 50ns 1.8v 50ns 0v 100ns 0v)
Vin_p3 P3 gnd pwl (0 1.8v 50ns 1.8v 50ns 0v 100ns 0v)
Vin_p4 P4 gnd pwl (0 1.8v 50ns 1.8v 50ns 0v 100ns 0v)

Vin_c2 C2 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)
Vin_c3 C3 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)
Vin_c4 C4 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)
Vin_c1 C1 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)


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

X011 P1 P1_bar vdd gnd NOT
X012 P2 P2_bar vdd gnd NOT
X013 P3 P3_bar vdd gnd NOT
X014 P4 P4_bar vdd gnd NOT
X015 C1 C1_bar vdd gnd NOT
X016 C2 C2_bar vdd gnd NOT
X017 C3 C3_bar vdd gnd NOT
X018 C4 C4_bar vdd gnd NOT

X001 P1 C1 P1_bar C1_bar l1 m1 n1 r1 S1 vdd gnd XOR
X002 P2 C2 P2_bar C2_bar l2 m2 n2 r2 S2 vdd gnd XOR
X003 P3 C3 P3_bar C3_bar l3 m3 n3 r3 S3 vdd gnd XOR
X004 P4 C4 P4_bar C4_bar l4 m4 n4 r4 S4 vdd gnd XOR

.tran 0.1n 100n

.control
set hcopypscolor =1
set color0 = white
set color1 = black

run
set curplottitle = "sresthavadhani-2019102032-Sum"
plot v(P1) v(C1)+2 v(S1)+4
plot v(P2) v(C2)+2 v(S2)+4
plot v(P3) v(C3)+2 v(S3)+4
plot v(P4) v(C4)+2 v(S4)+4

.endc
