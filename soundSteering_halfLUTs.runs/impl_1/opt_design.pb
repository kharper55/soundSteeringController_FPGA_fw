
=
Command: %s
53*	vivadotcl2

opt_designZ4-113h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
Implementation2

xc7a100tZ17-347h px� 
p
0Got license for feature '%s' and/or device '%s'
310*common2
Implementation2

xc7a100tZ17-349h px� 
\
,Running DRC as a precondition to command %s
22*	vivadotcl2

opt_designZ4-22h px� 
@

Starting %s Task
103*constraints2
DRCZ18-103h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
C
DRC finished with %s
272*project2

0 ErrorsZ1-461h px� 
d
BPlease refer to the DRC report (report_drc) for more information.
274*projectZ1-462h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:01 ; elapsed = 00:00:00.922 . Memory (MB): peak = 1952.723 ; gain = 0.000h px� 
U

Starting %s Task
103*constraints2
Cache Timing InformationZ18-103h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
V
%s*common2=
;Ending Cache Timing Information Task | Checksum: 1b3421150
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:00 ; elapsed = 00:00:02 . Memory (MB): peak = 1988.027 ; gain = 35.305h px� 
O

Starting %s Task
103*constraints2
Logic OptimizationZ18-103h px� 
K

Phase %s%s
101*constraints2
1 2
InitializationZ18-101h px� 
_

Phase %s%s
101*constraints2
1.1 2"
 Core Generation And Design SetupZ18-101h px� 
\
%s*common2C
APhase 1.1 Core Generation And Design Setup | Checksum: 1b3421150
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.024 . Memory (MB): peak = 2378.680 ; gain = 0.000h px� 
a

Phase %s%s
101*constraints2
1.2 2$
"Setup Constraints And Sort NetlistZ18-101h px� 
^
%s*common2E
CPhase 1.2 Setup Constraints And Sort Netlist | Checksum: 1b3421150
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.074 . Memory (MB): peak = 2378.680 ; gain = 0.000h px� 
H
%s*common2/
-Phase 1 Initialization | Checksum: 1b3421150
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.084 . Memory (MB): peak = 2378.680 ; gain = 0.000h px� 
d

Phase %s%s
101*constraints2
2 2)
'Timer Update And Timing Data CollectionZ18-101h px� 
K

Phase %s%s
101*constraints2
2.1 2
Timer UpdateZ18-101h px� 
H
%s*common2/
-Phase 2.1 Timer Update | Checksum: 1b3421150
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:00 ; elapsed = 00:00:01 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
U

Phase %s%s
101*constraints2
2.2 2
Timing Data CollectionZ18-101h px� 
R
%s*common29
7Phase 2.2 Timing Data Collection | Checksum: 1b3421150
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:00 ; elapsed = 00:00:01 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
a
%s*common2H
FPhase 2 Timer Update And Timing Data Collection | Checksum: 1b3421150
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:00 ; elapsed = 00:00:01 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
E

Phase %s%s
101*constraints2
3 2

RetargetZ18-101h px� 
d
9Pulled %s inverters resulting in an inversion of %s pins
779*opt2
72
27Z31-1566h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
12
1Z31-138h px� 
9
Retargeted %s cell(s).
49*opt2
0Z31-49h px� 
B
%s*common2)
'Phase 3 Retarget | Checksum: 14aa873b6
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:00:02 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
4
Retarget | Checksum: 14aa873b6
*commonh px� 
g
.Phase %s created %s cells and removed %s cells267*opt2

Retarget2
2492
375Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2

Retarget2
3Z31-1021h px� 
Q

Phase %s%s
101*constraints2
4 2
Constant propagationZ18-101h px� 
Q
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02
0Z31-138h px� 
N
%s*common25
3Phase 4 Constant propagation | Checksum: 19a410570
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:00:03 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
@
+Constant propagation | Checksum: 19a410570
*commonh px� 
p
.Phase %s created %s cells and removed %s cells267*opt2
Constant propagation2
42
26Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Constant propagation2
1Z31-1021h px� 
B

Phase %s%s
101*constraints2
5 2
SweepZ18-101h px� 
?
%s*common2&
$Phase 5 Sweep | Checksum: 17ffa0fa4
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:01 ; elapsed = 00:00:04 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
1
Sweep | Checksum: 17ffa0fa4
*commonh px� 
c
.Phase %s created %s cells and removed %s cells267*opt2
Sweep2
02
2146Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Sweep2
2Z31-1021h px� 
N

Phase %s%s
101*constraints2
6 2
BUFG optimizationZ18-101h px� 
�
4Inserted BUFG %s to drive %s load(s) on clock net %s141*opt29
7msys_i/serial_adc_pwm_top_0/U0/fsm/rom_strobe_BUFG_inst2
6424
2msys_i/serial_adc_pwm_top_0/U0/fsm/rom_strobe_BUFGZ31-194h px� 
�
4Inserted BUFG %s to drive %s load(s) on clock net %s141*opt27
5msys_i/mdm_1/U0/Use_E2.BSCAN_I/Dbg_Update_0_BUFG_inst2
4022
0msys_i/mdm_1/U0/Use_E2.BSCAN_I/Dbg_Update_0_BUFGZ31-194h px� 
E
!Inserted %s BUFG(s) on clock nets140*opt2
2Z31-193h px� 
K
%s*common22
0Phase 6 BUFG optimization | Checksum: 1d6bbfb6c
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
=
(BUFG optimization | Checksum: 1d6bbfb6c
*commonh px� 
�
EPhase %s created %s cells of which %s are BUFGs and removed %s cells.395*opt2
BUFG optimization2
22
22
0Z31-662h px� 
X

Phase %s%s
101*constraints2
7 2
Shift Register OptimizationZ18-101h px� 
�
+Can not pull register out from %s due to %s588*opt2<
:msys_i/axi_iic_0/U0/X_IIC/READ_FIFO_I/FIFO_RAM[0].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2<
:msys_i/axi_iic_0/U0/X_IIC/READ_FIFO_I/FIFO_RAM[1].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2<
:msys_i/axi_iic_0/U0/X_IIC/READ_FIFO_I/FIFO_RAM[2].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2<
:msys_i/axi_iic_0/U0/X_IIC/READ_FIFO_I/FIFO_RAM[3].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2<
:msys_i/axi_iic_0/U0/X_IIC/READ_FIFO_I/FIFO_RAM[4].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2<
:msys_i/axi_iic_0/U0/X_IIC/READ_FIFO_I/FIFO_RAM[5].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2<
:msys_i/axi_iic_0/U0/X_IIC/READ_FIFO_I/FIFO_RAM[6].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2<
:msys_i/axi_iic_0/U0/X_IIC/READ_FIFO_I/FIFO_RAM[7].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2B
@msys_i/axi_iic_0/U0/X_IIC/WRITE_FIFO_CTRL_I/FIFO_RAM[0].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2B
@msys_i/axi_iic_0/U0/X_IIC/WRITE_FIFO_CTRL_I/FIFO_RAM[1].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2=
;msys_i/axi_iic_0/U0/X_IIC/WRITE_FIFO_I/FIFO_RAM[0].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2=
;msys_i/axi_iic_0/U0/X_IIC/WRITE_FIFO_I/FIFO_RAM[1].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2=
;msys_i/axi_iic_0/U0/X_IIC/WRITE_FIFO_I/FIFO_RAM[2].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2=
;msys_i/axi_iic_0/U0/X_IIC/WRITE_FIFO_I/FIFO_RAM[3].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2=
;msys_i/axi_iic_0/U0/X_IIC/WRITE_FIFO_I/FIFO_RAM[4].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2=
;msys_i/axi_iic_0/U0/X_IIC/WRITE_FIFO_I/FIFO_RAM[5].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2=
;msys_i/axi_iic_0/U0/X_IIC/WRITE_FIFO_I/FIFO_RAM[6].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2=
;msys_i/axi_iic_0/U0/X_IIC/WRITE_FIFO_I/FIFO_RAM[7].SRL16E_I2
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2_
]msys_i/mdm_1/U0/MDM_Core_I1/JTAG_CONTROL_I/Use_Config_SRL16E.SRL16E_1/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2_
]msys_i/mdm_1/U0/MDM_Core_I1/JTAG_CONTROL_I/Use_Config_SRL16E.SRL16E_2/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2^
\msys_i/mdm_1/U0/MDM_Core_I1/JTAG_CONTROL_I/Use_ID_SRL16E.SRL16E_ID_1/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2^
\msys_i/mdm_1/U0/MDM_Core_I1/JTAG_CONTROL_I/Use_ID_SRL16E.SRL16E_ID_2/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Serial_Dbg_Intf.SRL16E_1/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Serial_Dbg_Intf.SRL16E_2/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Serial_Dbg_Intf.SRL16E_3/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Serial_Dbg_Intf.SRL16E_4/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Serial_Dbg_Intf.The_Cache_Addresses[1].SRL16E_Cache_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Serial_Dbg_Intf.The_Cache_Addresses[2].SRL16E_Cache_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Serial_Dbg_Intf.The_Cache_Addresses[5].SRL16E_Cache_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Serial_Dbg_Intf.The_Cache_Addresses[6].SRL16E_Cache_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][0]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][1]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][2]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][3]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][4]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][5]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][6]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_RX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][7]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][0]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][1]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][2]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][3]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][4]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][5]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][6]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/axi_uartlite_0/U0/UARTLITE_CORE_I/UARTLITE_TX_I/SRL_FIFO_I/I_SRL_FIFO_RBU_F/DYNSHREG_F_I/INFERRED_GEN.data_reg[15][7]_srl162
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[0].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[10].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[11].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[12].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[13].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[14].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[15].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[16].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[17].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[18].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[19].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[1].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[20].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[21].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[22].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[23].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[24].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[25].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[26].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[27].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[28].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[29].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[2].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[30].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[31].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[3].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[4].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[5].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[6].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[7].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[8].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Decode_I/PreFetch_Buffer_I/PreFetch_Buffers[9].SRL16E_I/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Using_PC_Breakpoints.All_PC_Brks[0].Serial_Interface_1.address_hit_I/Compare[0].SRLC16E_I/Use_unisim.MB_SRL16CE_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Using_PC_Breakpoints.All_PC_Brks[0].Serial_Interface_1.address_hit_I/Compare[1].SRLC16E_I/Use_unisim.MB_SRL16CE_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Using_PC_Breakpoints.All_PC_Brks[0].Serial_Interface_1.address_hit_I/Compare[2].SRLC16E_I/Use_unisim.MB_SRL16CE_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Using_PC_Breakpoints.All_PC_Brks[0].Serial_Interface_1.address_hit_I/Compare[3].SRLC16E_I/Use_unisim.MB_SRL16CE_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Using_PC_Breakpoints.All_PC_Brks[0].Serial_Interface_1.address_hit_I/Compare[4].SRLC16E_I/Use_unisim.MB_SRL16CE_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Using_PC_Breakpoints.All_PC_Brks[0].Serial_Interface_1.address_hit_I/Compare[5].SRLC16E_I/Use_unisim.MB_SRL16CE_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Using_PC_Breakpoints.All_PC_Brks[0].Serial_Interface_1.address_hit_I/Compare[6].SRLC16E_I/Use_unisim.MB_SRL16CE_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Implement_Debug_Logic.Master_Core.Debug_Area/Using_PC_Breakpoints.All_PC_Brks[0].Serial_Interface_1.address_hit_I/Compare[7].SRLC16E_I/Use_unisim.MB_SRL16CE_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[0].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[10].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[11].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[12].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[13].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[14].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[15].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[16].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[17].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[18].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[19].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[1].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[20].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
+Can not pull register out from %s due to %s588*opt2�
�msys_i/microblaze_0/U0/MicroBlaze_Core_I/Area.Core/Data_Flow_I/PC_Module_I/All_Bits.Using_FPGA.PC_GEN[21].PC_Bit_I/PC_OF_Buffer/Use_unisim.MB_SRL16E_I12
none static srl address bitsZ31-1131h px� 
�
�Message '%s' appears more than %s times and has been disabled. User can change this message limit to see more message instances.
14*common2
Opt 31-11312
100Z17-14h px� 
�
dSRL Remap converted %s SRLs to %s registers and converted %s registers of register chains to %s SRLs546*opt2
02
02
02
0Z31-1064h px� 
U
%s*common2<
:Phase 7 Shift Register Optimization | Checksum: 1d6bbfb6c
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
G
2Shift Register Optimization | Checksum: 1d6bbfb6c
*commonh px� 
v
.Phase %s created %s cells and removed %s cells267*opt2
Shift Register Optimization2
02
0Z31-389h px� 
T

Phase %s%s
101*constraints2
8 2
Post Processing NetlistZ18-101h px� 
Q
%s*common28
6Phase 8 Post Processing Netlist | Checksum: 1ee440925
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
C
.Post Processing Netlist | Checksum: 1ee440925
*commonh px� 
r
.Phase %s created %s cells and removed %s cells267*opt2
Post Processing Netlist2
02
0Z31-389h px� 
�
�In phase %s, %s netlist objects are constrained preventing optimization. Please run opt_design with -debug_log to get more detail. 510*opt2
Post Processing Netlist2
2Z31-1021h px� 
I

Phase %s%s
101*constraints2
9 2
FinalizationZ18-101h px� 
j

Phase %s%s
101*constraints2
9.1 2-
+Finalizing Design Cores and Updating ShapesZ18-101h px� 
g
%s*common2N
LPhase 9.1 Finalizing Design Cores and Updating Shapes | Checksum: 14f5f1757
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
]

Phase %s%s
101*constraints2
9.2 2 
Verifying Netlist ConnectivityZ18-101h px� 
O

Starting %s Task
103*constraints2
Connectivity CheckZ18-103h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.110 . Memory (MB): peak = 2408.305 ; gain = 0.000h px� 
Z
%s*common2A
?Phase 9.2 Verifying Netlist Connectivity | Checksum: 14f5f1757
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
F
%s*common2-
+Phase 9 Finalization | Checksum: 14f5f1757
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
/
Opt_design Change Summary
*commonh px� 
/
=========================
*commonh px� 


*commonh px� 


*commonh px� 
�
z-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Phase                        |  #Cells created  |  #Cells Removed  |  #Constrained objects preventing optimizations  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Retarget                     |             249  |             375  |                                              3  |
|  Constant propagation         |               4  |              26  |                                              1  |
|  Sweep                        |               0  |            2146  |                                              2  |
|  BUFG optimization            |               2  |               0  |                                              0  |
|  Shift Register Optimization  |               0  |               0  |                                              0  |
|  Post Processing Netlist      |               0  |               0  |                                              2  |
-------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
P
%s*common27
5Ending Logic Optimization Task | Checksum: 14f5f1757
h px� 
~

%s
*constraints2^
\Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 2408.305 ; gain = 29.625h px� 
b
2Building netlist checker database with flags, 0x%s23991*constraints2
8Z18-11670h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2*
(Done building netlist checker database: 2

00:00:002
00:00:00.0162

2408.3052
0.000Z17-268h px� 
O

Starting %s Task
103*constraints2
Power OptimizationZ18-103h px� 
a
7Will skip clock gating for clocks with period < %s ns.
114*pwropt2
2.00Z34-132h px� 
�
$Power model is not available for %s
23*power2�
)STARTUP_7SERIES_GEN.STARTUP2_7SERIES_inst	�msys_i/axi_quad_spi_0/U0/NO_DUAL_QUAD_MODE.QSPI_NORMAL/QSPI_LEGACY_MD_GEN.QSPI_CORE_INTERFACE_I/LOGIC_FOR_MD_12_GEN.SCK_MISO_STARTUP_USED.QSPI_STARTUP_BLOCK_I/STARTUP_7SERIES_GEN.STARTUP2_7SERIES_inst8Z33-23h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
=
Applying IDT optimizations ...
9*pwroptZ34-9h px� 
?
Applying ODC optimizations ...
10*pwroptZ34-10h px� 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px� 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px� 


*pwropth px� 
S

Starting %s Task
103*constraints2
PowerOpt Patch EnablesZ18-103h px� 
�
�WRITE_MODE attribute of %s BRAM(s) out of a total of %s has been updated to save power.
    Run report_power_opt to get a complete listing of the BRAMs updated.
129*pwropt2
02
107Z34-162h px� 
R
+Structural ODC has moved %s WE to EN ports
155*pwropt2
1Z34-201h px� 
u
CNumber of BRAM Ports augmented: %s newly gated: %s Total Ports: %s
65*pwropt2
42
722
214Z34-65h px� 
T
%s*common2;
9Ending PowerOpt Patch Enables Task | Checksum: 1779ed5bf
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.572 . Memory (MB): peak = 3007.383 ; gain = 0.000h px� 
P
%s*common27
5Ending Power Optimization Task | Checksum: 1779ed5bf
h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:09 ; elapsed = 00:00:18 . Memory (MB): peak = 3007.383 ; gain = 599.078h px� 
J

Starting %s Task
103*constraints2
Final CleanupZ18-103h px� 
O

Starting %s Task
103*constraints2
Logic OptimizationZ18-103h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
P
%s*common27
5Ending Logic Optimization Task | Checksum: 14f9f0367
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:04 . Memory (MB): peak = 3007.383 ; gain = 0.000h px� 
b
2Building netlist checker database with flags, 0x%s23991*constraints2
8Z18-11670h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2*
(Done building netlist checker database: 2

00:00:002
00:00:00.0222

3007.3832
0.000Z17-268h px� 
K
%s*common22
0Ending Final Cleanup Task | Checksum: 14f9f0367
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:03 ; elapsed = 00:00:06 . Memory (MB): peak = 3007.383 ; gain = 0.000h px� 
P

Starting %s Task
103*constraints2
Netlist ObfuscationZ18-103h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0212

3007.3832
0.000Z17-268h px� 
Q
%s*common28
6Ending Netlist Obfuscation Task | Checksum: 14f9f0367
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.032 . Memory (MB): peak = 3007.383 ; gain = 0.000h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
702
1342
02
0Z4-41h px� 
J
%s completed successfully
29*	vivadotcl2

opt_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
opt_design: 2

00:00:162

00:00:352

3007.3832

1054.660Z17-268h px� 
�
%s4*runtcl2x
vExecuting : report_drc -file msys_wrapper_drc_opted.rpt -pb msys_wrapper_drc_opted.pb -rpx msys_wrapper_drc_opted.rpx
h px� 
�
Command: %s
53*	vivadotcl2k
ireport_drc -file msys_wrapper_drc_opted.rpt -pb msys_wrapper_drc_opted.pb -rpx msys_wrapper_drc_opted.rpxZ4-113h px� 
>
IP Catalog is up to date.1232*coregenZ19-1839h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
�
#The results of DRC are in file %s.
586*	vivadotcl2�
kC:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.runs/impl_1/msys_wrapper_drc_opted.rptkC:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.runs/impl_1/msys_wrapper_drc_opted.rpt8Z2-168h px� 
J
%s completed successfully
29*	vivadotcl2

report_drcZ4-42h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PlaceDB: 2

00:00:002
00:00:00.0032

3007.3832
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

3007.3832
0.000Z17-268h px� 
=
Writing XDEF routing.
211*designutilsZ20-211h px� 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px� 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote RouteStorage: 2

00:00:002
00:00:00.0832

3007.3832
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Netlist Cache: 2

00:00:002

00:00:002

3007.3832
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Device Cache: 2

00:00:002
00:00:00.0052

3007.3832
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write Physdb Complete: 2

00:00:002
00:00:00.0972

3007.3832
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.2382

3007.3832
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2g
eC:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.runs/impl_1/msys_wrapper_opt.dcpZ17-1381h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
write_checkpoint: 2

00:00:032

00:00:072

3007.3832
0.000Z17-268h px� 


End Record