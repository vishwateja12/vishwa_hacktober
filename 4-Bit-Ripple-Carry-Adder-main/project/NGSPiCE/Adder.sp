Adder 
.include TSMC_180nm.txt
.param SUPPLY = 1.8
.param LAMBDA = 0.09u
.param width_N = 10*LAMBDA
.param width_P = 20*LAMBDA
.global vdd gnd

Vdd vdd gnd 'SUPPLY'

Vin_a1 dA1 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)
Vin_b1 dB1 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)

Vin_a2 dA2 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)
Vin_b2 dB2 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)

Vin_a3 dA3 gnd pwl (0 1.8v 50ns 1.8v 50ns 0v 100ns 0v)
Vin_b3 dB3 gnd pwl (0 1.8v 50ns 1.8v 50ns 0v 100ns 0v)

Vin_a4 dA4 gnd pwl (0 1.8v 50ns 1.8v 50ns 0v 100ns 0v)
Vin_b4 dB4 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)

Vin_c0 C0 gnd pwl (0 0v 50ns 0v 50ns 0v 100ns 0v)


Vin_Clk Clk gnd pulse 0 1.8 2n 100ps 100ps 5ns 10ns

.subckt NOT A A_bar vdd gnd

M1 A_bar A gnd gnd CMOSN W = {width_N} L = {2*LAMBDA}
+ AS = {5*width_N*LAMBDA} PS = {10*LAMBDA + 2*width_N} AD = {5*width_N*LAMBDA} PD = {10*LAMBDA + 2*width_N}
 
M2 A_bar A vdd vdd CMOSP W = {width_P} L = {2*LAMBDA}
+ AS = {5*width_P*LAMBDA} PS = {10*LAMBDA + 2*width_P} AD = {5*width_P*LAMBDA} PD = {10*LAMBDA + 2*width_P}
 
.ends NOT

.subckt XOR A B A_bar B_bar Y vdd gnd 

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

.subckt AND A B Y vdd gnd

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

.subckt OR A B Y vdd gnd

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

.subckt flip D Clk Q vdd gnd
 
X201 D R Zz1 vdd gnd NAND
X202 P Clk Zz1 R vdd gnd NAND3
X203 Zz0 Clk P vdd gnd NAND
X204 Zz1 P Zz0 vdd gnd NAND
X205 P S Q vdd gnd NAND
X206 R Q S vdd gnd NAND

.ends flip

************Input flips************
X301 Da1 Clk A1 vdd gnd flip
X302 Da2 Clk A2 vdd gnd flip
X303 Da3 Clk A3 vdd gnd flip
X304 Da4 Clk A4 vdd gnd flip
X305 Db1 Clk B1 vdd gnd flip
X306 Db2 Clk B2 vdd gnd flip
X307 Db3 Clk B3 vdd gnd flip
X308 Db4 Clk B4 vdd gnd flip

*****************PG block*****************
X100 A1 A1_bar vdd gnd NOT
X200 A2 A2_bar vdd gnd NOT
X30 A3 A3_bar vdd gnd NOT
X40 A4 A4_bar vdd gnd NOT
X50 B1 B1_bar vdd gnd NOT
X60 B2 B2_bar vdd gnd NOT
X70 B3 B3_bar vdd gnd NOT
X80 B4 B4_bar vdd gnd NOT

X1 A1 B1 A1_bar B1_bar P1 vdd gnd XOR
X2 A1 B1 G1 vdd gnd AND

X3 A2 B2 A2_bar B2_bar P2 vdd gnd XOR
X4 A2 B2 G2 vdd gnd AND

X5 A3 B3 A3_bar B3_bar P3 vdd gnd XOR
X6 A3 B3 G3 vdd gnd AND

X7 A4 B4 A4_bar B4_bar P4 vdd gnd XOR
X8 A4 B4 G4 vdd gnd AND
*******************CLA block******************************

***** For C1 
X01 P1 C0 Z01 vdd gnd AND
X02 G1 Z01 C1 vdd gnd OR

***** For C2
X03 P2 G1 Z02 vdd gnd AND
X04 Z01 P2 Z04 vdd gnd AND
X05 Z02 Z04 Z05 vdd gnd OR
X06 G2 Z05 C2 vdd gnd OR

***** For C3
X07 P3 G2 Z06 vdd gnd AND
X08 P3 Z02 Z08 vdd gnd AND
X09 P3 Z04 Z09 vdd gnd AND
X10 Z06 Z08 Z11 vdd gnd OR
X11 Z09 Z11 Z12 vdd gnd OR
X12 Z12 G3 C3 vdd gnd OR

***** For C4
X13 P4 Z09 Z13 vdd gnd AND
X14 P4 Z08 Z14 vdd gnd AND
X15 P4 Z06 Z15 vdd gnd AND
X16 P4 G3 Z16 vdd gnd AND
X17 Z13 Z14 Z20 vdd gnd OR
X18 Z20 Z15 Z21 vdd gnd OR
X19 Z21 Z16 Z22 vdd gnd OR
X20 Z22 G4 C4 vdd gnd OR
************** SUM block*****************
X011 P1 P1_bar vdd gnd NOT
X012 P2 P2_bar vdd gnd NOT
X013 P3 P3_bar vdd gnd NOT
X014 P4 P4_bar vdd gnd NOT
X015 C0 C0_bar vdd gnd NOT
X016 C2 C2_bar vdd gnd NOT
X017 C3 C3_bar vdd gnd NOT
X018 C1 C1_bar vdd gnd NOT

X001 P1 C0 P1_bar C0_bar S1 vdd gnd XOR
X002 P2 C1 P2_bar C1_bar S2 vdd gnd XOR
X003 P3 C2 P3_bar C2_bar S3 vdd gnd XOR
X004 P4 C3 P4_bar C3_bar S4 vdd gnd XOR

*********************Output flips****************************
X309 S1 Clk S1_out vdd gnd flip
X310 S2 Clk S2_out vdd gnd flip
X311 S3 Clk S3_out vdd gnd flip
X312 S4 Clk S4_out vdd gnd flip

X313 C4 Clk C4_out vdd gnd flip

.tran 0.1n 100n

.measure tran tpda1
+TRIG v(A1) val = 'SUPPLY/2' RISE = 1
+TARG v(S1) val = 'SUPPLY/2' FALL = 1

.measure tran tpda2
+TRIG v(A2) val = 'SUPPLY/2' RISE = 1
+TARG v(S2) val = 'SUPPLY/2' RISE = 1

.measure tran tpda3
+TRIG v(A3) val = 'SUPPLY/2' RISE = 1
+TARG v(S3) val = 'SUPPLY/2' RISE = 1

.measure tran tpda4
+TRIG v(A4) val = 'SUPPLY/2' RISE = 1
+TARG v(S4) val = 'SUPPLY/2' RISE = 1



.control

set hcopypscolor = 1
set color0 = white
set color1 = black

run

plot v(Clk) v(Da1)+2 v(Db1)+4 v(A1)+6 v(B1)+8 v(S1)+10 v(S1_out)+12 
plot v(Clk) v(Da2)+2 v(Db2)+4 v(A2)+6 v(B2)+8 v(S2)+10 v(S2_out)+12 
plot v(Clk) v(Da3)+2 v(Db3)+4 v(A3)+6 v(B3)+8 v(S3)+10 v(S3_out)+12
plot v(Clk) v(Da4)+2 v(Db4)+4 v(A4)+6 v(B4)+8 v(S4)+10 v(S4_out)+12
plot v(Clk) v(C4)+2 v(C4_out)+4

.endc
