
?
Command: %s
53*	vivadotcl2
place_designZ4-113h px� 
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
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
D
DRC finished with %s
79*	vivadotcl2

0 ErrorsZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
^
,Running DRC as a precondition to command %s
22*	vivadotcl2
place_designZ4-22h px� 
>
Running DRC with %s threads
24*drc2
2Z23-27h px� 
Q
DRC finished with %s
79*	vivadotcl2
0 Errors, 21 WarningsZ4-198h px� 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px� 
k
BMultithreading enabled for place_design using a maximum of %s CPUs12*	placeflow2
2Z30-611h px� 
C

Starting %s Task
103*constraints2
PlacerZ18-103h px� 
R

Phase %s%s
101*constraints2
1 2
Placer InitializationZ18-101h px� 
d

Phase %s%s
101*constraints2
1.1 2'
%Placer Initialization Netlist SortingZ18-101h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0202

3246.4962
0.000Z17-268h px� 
a
%s*common2H
FPhase 1.1 Placer Initialization Netlist Sorting | Checksum: 199afdbd6
h px� 
�

%s
*constraints2a
_Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.030 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0202

3246.4962
0.000Z17-268h px� 
q

Phase %s%s
101*constraints2
1.2 24
2IO Placement/ Clock Placement/ Build Placer DeviceZ18-101h px� 
n
%s*common2U
SPhase 1.2 IO Placement/ Clock Placement/ Build Placer Device | Checksum: 1453f189f
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:02 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
Y

Phase %s%s
101*constraints2
1.3 2
Build Placer Netlist ModelZ18-101h px� 
V
%s*common2=
;Phase 1.3 Build Placer Netlist Model | Checksum: 1b6b2d165
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:04 ; elapsed = 00:00:10 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
V

Phase %s%s
101*constraints2
1.4 2
Constrain Clocks/MacrosZ18-101h px� 
S
%s*common2:
8Phase 1.4 Constrain Clocks/Macros | Checksum: 1b6b2d165
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:04 ; elapsed = 00:00:10 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
O
%s*common26
4Phase 1 Placer Initialization | Checksum: 1b6b2d165
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:04 ; elapsed = 00:00:10 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
M

Phase %s%s
101*constraints2
2 2
Global PlacementZ18-101h px� 
L

Phase %s%s
101*constraints2
2.1 2
FloorplanningZ18-101h px� 
I
%s*common20
.Phase 2.1 Floorplanning | Checksum: 1737390fe
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:06 ; elapsed = 00:00:13 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
`

Phase %s%s
101*constraints2
2.2 2#
!Update Timing before SLR Path OptZ18-101h px� 
]
%s*common2D
BPhase 2.2 Update Timing before SLR Path Opt | Checksum: 149a39a9d
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:07 ; elapsed = 00:00:16 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
_

Phase %s%s
101*constraints2
2.3 2"
 Post-Processing in FloorplanningZ18-101h px� 
\
%s*common2C
APhase 2.3 Post-Processing in Floorplanning | Checksum: 149a39a9d
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:07 ; elapsed = 00:00:16 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
T

Phase %s%s
101*constraints2
2.4 2
Global Placement CoreZ18-101h px� 
g

Phase %s%s
101*constraints2
2.4.1 2(
&UpdateTiming Before Physical SynthesisZ18-101h px� 
d
%s*common2K
IPhase 2.4.1 UpdateTiming Before Physical Synthesis | Checksum: 2ad2710c0
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:23 ; elapsed = 00:00:54 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
]

Phase %s%s
101*constraints2
2.4.2 2
Physical Synthesis In PlacerZ18-101h px� 
x
FFound %s LUTNM shape to break, %s LUT instances to create LUTNM shape
553*physynth2
202
638Z32-1035h px� 
�
YBreak lutnm for timing: one critical %s, two critical %s, total %s, new lutff created %s
561*physynth2
02
202
202
0Z32-1044h px� 
�
^End %s Pass. Optimized %s %s. Breaked %s %s, combined %s existing %s and moved %s existing %s
576*physynth2
12
2782
nets or LUTs2
202
LUTs2
2582
LUTs2
02
LUTZ32-1138h px� 
p
=Pass %s. Identified %s candidate %s for fanout optimization.
76*physynth2
12
12
netZ32-76h px� 
�
'Processed net %s. Replicated %s times.
81*physynth2f
0msys_i/rst_clk_wiz_0_100M/U0/peripheral_reset[0]0msys_i/rst_clk_wiz_0_100M/U0/peripheral_reset[0]2
208Z32-81h px� 
g
$Optimized %s %s. Created %s new %s.
216*physynth2
12
net2
202
	instancesZ32-232h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12
12
net or cell2
202
cells2
02
cell2
02
cellZ32-775h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0602

3246.4962
0.000Z17-268h px� 
j
FNo candidate cells for DSP register optimization found in the design.
274*physynthZ32-456h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22
02
net or cell2
02
cell2
02
cell2
02
cellZ32-775h px� 
i
DNo candidate cells found for Shift Register to Pipeline optimization564*physynthZ32-1123h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
22
02
net or cell2
02
cell2
02
cell2
02
cellZ32-775h px� 
^
9No candidate cells found for Shift Register optimization.631*physynthZ32-1401h px� 
h
DNo candidate cells for SRL register optimization found in the design349*physynthZ32-677h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12
02
net or cell2
02
cell2
02
cell2
02
cellZ32-775h px� 
i
ENo candidate cells for BRAM register optimization found in the design297*physynthZ32-526h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12
02
net or cell2
02
cell2
02
cell2
02
cellZ32-775h px� 
j
FNo candidate cells for URAM register optimization found in the design
437*physynthZ32-846h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12
02
net or cell2
02
cell2
02
cell2
02
cellZ32-775h px� 
j
FNo candidate cells for URAM register optimization found in the design
437*physynthZ32-846h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12
02
net or cell2
02
cell2
02
cell2
02
cellZ32-775h px� 
o
KNo candidate nets found for dynamic/static region interface net replication521*physynthZ32-949h px� 
�
aEnd %s Pass. Optimized %s %s. Created %s new %s, deleted %s existing %s and moved %s existing %s
415*physynth2
12
02
net or cell2
02
cell2
02
cell2
02
cellZ32-775h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:012
00:00:00.0202

3246.4962
0.000Z17-268h px� 
B
-
Summary of Physical Synthesis Optimizations
*commonh px� 
B
-============================================
*commonh px� 


*commonh px� 


*commonh px� 
�
�-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Optimization                                     |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  LUT Combining                                    |           20  |            258  |                   278  |           0  |           1  |  00:00:00  |
|  Retime                                           |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Very High Fanout                                 |           20  |              0  |                     1  |           0  |           1  |  00:00:00  |
|  DSP Register                                     |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Shift Register to Pipeline                       |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Shift Register                                   |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  BRAM Register                                    |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  URAM Register                                    |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Dynamic/Static Region Interface Net Replication  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Total                                            |           40  |            258  |                   279  |           0  |           9  |  00:00:01  |
-----------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
Z
%s*common2A
?Phase 2.4.2 Physical Synthesis In Placer | Checksum: 1a8108fa4
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:25 ; elapsed = 00:00:58 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
Q
%s*common28
6Phase 2.4 Global Placement Core | Checksum: 297e28bee
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:27 ; elapsed = 00:01:03 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
J
%s*common21
/Phase 2 Global Placement | Checksum: 297e28bee
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:27 ; elapsed = 00:01:03 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
M

Phase %s%s
101*constraints2
3 2
Detail PlacementZ18-101h px� 
Y

Phase %s%s
101*constraints2
3.1 2
Commit Multi Column MacrosZ18-101h px� 
V
%s*common2=
;Phase 3.1 Commit Multi Column Macros | Checksum: 2a1073768
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:29 ; elapsed = 00:01:06 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
[

Phase %s%s
101*constraints2
3.2 2
Commit Most Macros & LUTRAMsZ18-101h px� 
X
%s*common2?
=Phase 3.2 Commit Most Macros & LUTRAMs | Checksum: 1a9803f40
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:31 ; elapsed = 00:01:14 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
U

Phase %s%s
101*constraints2
3.3 2
Area Swap OptimizationZ18-101h px� 
R
%s*common29
7Phase 3.3 Area Swap Optimization | Checksum: 1a622fa62
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:31 ; elapsed = 00:01:15 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
]

Phase %s%s
101*constraints2
3.4 2 
Pipeline Register OptimizationZ18-101h px� 
Z
%s*common2A
?Phase 3.4 Pipeline Register Optimization | Checksum: 1c632819d
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:31 ; elapsed = 00:01:15 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
P

Phase %s%s
101*constraints2
3.5 2
Fast OptimizationZ18-101h px� 
M
%s*common24
2Phase 3.5 Fast Optimization | Checksum: 1ff36a003
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:34 ; elapsed = 00:01:22 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
[

Phase %s%s
101*constraints2
3.6 2
Small Shape Detail PlacementZ18-101h px� 
X
%s*common2?
=Phase 3.6 Small Shape Detail Placement | Checksum: 187161ce0
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:37 ; elapsed = 00:01:33 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
Q

Phase %s%s
101*constraints2
3.7 2
Re-assign LUT pinsZ18-101h px� 
N
%s*common25
3Phase 3.7 Re-assign LUT pins | Checksum: 128257bb0
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:38 ; elapsed = 00:01:36 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
]

Phase %s%s
101*constraints2
3.8 2 
Pipeline Register OptimizationZ18-101h px� 
Z
%s*common2A
?Phase 3.8 Pipeline Register Optimization | Checksum: 255e3066c
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:38 ; elapsed = 00:01:36 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
P

Phase %s%s
101*constraints2
3.9 2
Fast OptimizationZ18-101h px� 
M
%s*common24
2Phase 3.9 Fast Optimization | Checksum: 193f2aba3
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:40 ; elapsed = 00:01:46 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
J
%s*common21
/Phase 3 Detail Placement | Checksum: 193f2aba3
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:41 ; elapsed = 00:01:46 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
e

Phase %s%s
101*constraints2
4 2*
(Post Placement Optimization and Clean-UpZ18-101h px� 
W

Phase %s%s
101*constraints2
4.1 2
Post Commit OptimizationZ18-101h px� 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px� 
�
�User defined clock exists on pin %s%s%s%s%s%s and will prevent any subsequent automatic derivation of generated clocks on that pin. If the user defined clock specifies '-add', any existing auto-derived clocks on that pin are retained.
3*timing2\
+msys_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT0+msys_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT02
 [See 2�
|C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/constrs_2/imports/constraints/_i_bitgen_common.xdc|C:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.srcs/constrs_2/imports/constraints/_i_bitgen_common.xdc2
:2

11112
]8Z38-3h px� 
�
�User defined clock exists on pin %s%s%s%s%s%s and will prevent any subsequent automatic derivation of generated clocks on that pin. If the user defined clock specifies '-add', any existing auto-derived clocks on that pin are retained.
3*timing2\
+msys_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT1+msys_i/clk_wiz_0/inst/mmcm_adv_inst/CLKOUT12
 2
 2
 2
 2
 8Z38-3h px� 
\

Phase %s%s
101*constraints2
4.1.1 2
Post Placement OptimizationZ18-101h px� 
V
APost Placement Optimization Initialization | Checksum: 1cbdac3a8
*commonh px� 
Q

Phase %s%s
101*constraints2

4.1.1.1 2
BUFG InsertionZ18-101h px� 
O

Starting %s Task
103*constraints2
Physical SynthesisZ18-103h px� 
^

Phase %s%s
101*constraints2
1 2#
!Physical Synthesis InitializationZ18-101h px� 
n
EMultithreading enabled for phys_opt_design using a maximum of %s CPUs380*physynth2
2Z32-721h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-9.4782
	-2499.459Z32-619h px� 
[
%s*common2B
@Phase 1 Physical Synthesis Initialization | Checksum: 1c9a86e17
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:01 ; elapsed = 00:00:02 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
�
PProcessed net %s, BUFG insertion was skipped due to placement/routing conflicts.32*	placeflow20
.msys_i/serial_adc_pwm_top_0/U0/datapath/p_0_inZ46-33h px� 
�
�BUFG insertion identified %s candidate nets. Inserted BUFG: %s, Replicated BUFG Driver: %s, Skipped due to Placement/Routing Conflicts: %s, Skipped due to Timing Degradation: %s, Skipped due to netlist editing failed: %s.43*	placeflow2
12
02
02
12
02
0Z46-56h px� 
P
%s*common27
5Ending Physical Synthesis Task | Checksum: 1c9a86e17
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:03 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
N
%s*common25
3Phase 4.1.1.1 BUFG Insertion | Checksum: 1cbdac3a8
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:46 ; elapsed = 00:01:58 . Memory (MB): peak = 3246.496 ; gain = 0.000h px� 
e

Phase %s%s
101*constraints2

4.1.1.2 2$
"Post Placement Timing OptimizationZ18-101h px� 
�
hPost Placement Timing Summary WNS=%s. For the most accurate timing information please run report_timing.610*place2
-9.042Z30-746h px� 
a
%s*common2H
FPhase 4.1.1.2 Post Placement Timing Optimization | Checksum: ec05e45d
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:51 ; elapsed = 00:02:10 . Memory (MB): peak = 3250.648 ; gain = 4.152h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:51 ; elapsed = 00:02:10 . Memory (MB): peak = 3250.648 ; gain = 4.152h px� 
S
%s*common2:
8Phase 4.1 Post Commit Optimization | Checksum: ec05e45d
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:51 ; elapsed = 00:02:10 . Memory (MB): peak = 3250.648 ; gain = 4.152h px� 
U

Phase %s%s
101*constraints2
4.2 2
Post Placement CleanupZ18-101h px� 
Q
%s*common28
6Phase 4.2 Post Placement Cleanup | Checksum: ec05e45d
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:51 ; elapsed = 00:02:11 . Memory (MB): peak = 3250.648 ; gain = 4.152h px� 
O

Phase %s%s
101*constraints2
4.3 2
Placer ReportingZ18-101h px� 
[

Phase %s%s
101*constraints2
4.3.1 2
Print Estimated CongestionZ18-101h px� 
�
'Post-Placement Estimated Congestion %s
38*	placeflow2�
�
 ____________________________________________________
|           | Global Congestion | Short Congestion  |
| Direction | Region Size       | Region Size       |
|___________|___________________|___________________|
|      North|              32x32|                4x4|
|___________|___________________|___________________|
|      South|              32x32|                8x8|
|___________|___________________|___________________|
|       East|              32x32|                8x8|
|___________|___________________|___________________|
|       West|                4x4|                4x4|
|___________|___________________|___________________|
Z30-612h px� 
W
%s*common2>
<Phase 4.3.1 Print Estimated Congestion | Checksum: ec05e45d
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:51 ; elapsed = 00:02:11 . Memory (MB): peak = 3250.648 ; gain = 4.152h px� 
K
%s*common22
0Phase 4.3 Placer Reporting | Checksum: ec05e45d
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:51 ; elapsed = 00:02:11 . Memory (MB): peak = 3250.648 ; gain = 4.152h px� 
V

Phase %s%s
101*constraints2
4.4 2
Final Placement CleanupZ18-101h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0212

3250.6482
0.000Z17-268h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:51 ; elapsed = 00:02:11 . Memory (MB): peak = 3250.648 ; gain = 4.152h px� 
b
%s*common2I
GPhase 4 Post Placement Optimization and Clean-Up | Checksum: 153e128b8
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:51 ; elapsed = 00:02:11 . Memory (MB): peak = 3250.648 ; gain = 4.152h px� 
C
%s*common2*
(Ending Placer Task | Checksum: f76331ae
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:51 ; elapsed = 00:02:12 . Memory (MB): peak = 3250.648 ; gain = 4.152h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1362
1452
22
0Z4-41h px� 
L
%s completed successfully
29*	vivadotcl2
place_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
place_design: 2

00:00:522

00:02:132

3250.6482
4.152Z17-268h px� 
U
%s4*runtcl29
7Executing : report_io -file msys_wrapper_io_placed.rpt
h px� 
�
kreport_io: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.046 . Memory (MB): peak = 3250.648 ; gain = 0.000
*commonh px� 
�
%s4*runtcl2r
pExecuting : report_utilization -file msys_wrapper_utilization_placed.rpt -pb msys_wrapper_utilization_placed.pb
h px� 
r
%s4*runtcl2V
TExecuting : report_control_sets -verbose -file msys_wrapper_control_sets_placed.rpt
h px� 
�
ureport_control_sets: Time (s): cpu = 00:00:00 ; elapsed = 00:00:00.057 . Memory (MB): peak = 3250.648 ; gain = 0.000
*commonh px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:002
00:00:00.2242

3250.6482
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PlaceDB: 2

00:00:052

00:00:032

3250.6482
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

3250.6482
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
00:00:00.0522

3250.6482
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Netlist Cache: 2

00:00:002
00:00:00.0922

3250.6482
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Device Cache: 2

00:00:002
00:00:00.0042

3250.6482
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write Physdb Complete: 2

00:00:062

00:00:032

3250.6482
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2j
hC:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.runs/impl_5/msys_wrapper_placed.dcpZ17-1381h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
write_checkpoint: 2

00:00:082

00:00:102

3250.6482
0.000Z17-268h px� 


End Record