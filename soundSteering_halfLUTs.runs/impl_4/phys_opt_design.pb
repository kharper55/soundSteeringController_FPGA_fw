
B
Command: %s
53*	vivadotcl2
phys_opt_designZ4-113h px� 
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
R

Starting %s Task
103*constraints2
Initial Update TimingZ18-103h px� 


%s
*constraints2_
]Time (s): cpu = 00:00:05 ; elapsed = 00:00:06 . Memory (MB): peak = 3271.828 ; gain = 236.750h px� 
�
^PhysOpt_Tcl_Interface Runtime Before Starting Physical Synthesis Task | CPU: %ss |  WALL: %ss
566*	vivadotcl2
5.002
6.86Z4-1435h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0202

3272.1132
0.285Z17-268h px� 
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
-2.4612
	-1969.046Z32-619h px� 
[
%s*common2B
@Phase 1 Physical Synthesis Initialization | Checksum: 1938904c5
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 3276.426 ; gain = 4.312h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4612
	-1969.046Z32-619h px� 
V

Phase %s%s
101*constraints2
2 2
DSP Register OptimizationZ18-101h px� 
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
S
%s*common2:
8Phase 2 DSP Register Optimization | Checksum: 1938904c5
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:02 ; elapsed = 00:00:05 . Memory (MB): peak = 3276.426 ; gain = 4.312h px� 
W

Phase %s%s
101*constraints2
3 2
Critical Path OptimizationZ18-101h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.4612
	-1969.046Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[33]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[33]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2d
/msys_i/clk_wiz_0/inst/clk_out1_msys_clk_wiz_0_0/msys_i/clk_wiz_0/inst/clk_out1_msys_clk_wiz_0_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2�
Vmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[8]Vmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[8]2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[33]_i_1_comp	_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[33]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[33]_i_5_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[33]_i_5_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3932
	-1968.873Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[20]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[20]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2�
Wmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[18]Wmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[18]2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_1_comp	_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3832
	-1968.863Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_5_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_5_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_16_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_16_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_45_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_45_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_104_n_0dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_104_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_296_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_296_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
212
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_716_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_716_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3742
	-1968.832Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[38]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[38]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2�
Vmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[7]Vmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[7]2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[38]_i_1_comp	_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[38]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[38]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[38]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3522
	-1968.697Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3522
	-1968.689Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[44]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[44]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2�
Vmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[3]Vmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[3]2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[44]_i_1_comp	_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[44]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[44]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[44]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3512
	-1968.584Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[8]Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[8]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2�
Wmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[26]Wmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[26]2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_1_comp	^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_5_n_0]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_5_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3502
	-1968.570Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[18]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[18]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2�
Wmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[19]Wmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[19]2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_1_comp	_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_2_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_2_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3502
	-1968.569Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[58]Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[58]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[58]_i_4_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[58]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[58]_i_14_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[58]_i_14_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[58]_i_37_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[58]_i_37_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[58]_i_83_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[58]_i_83_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[58]_i_187_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[58]_i_187_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3492
	-1968.503Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_11_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_11_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_29_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_29_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_60_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_60_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3472
	-1968.459Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[47]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[47]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2�
|msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_9|msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_92�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[47]_i_1_comp	_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[47]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[47]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[47]_i_4_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3472
	-1968.280Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[14]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[14]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2�
|msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_0|msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_02�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[14]_i_1_comp	_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[14]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[14]_i_2_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[14]_i_2_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3442
	-1968.228Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_715_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_715_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Wmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[18]Wmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[18]8Z32-702h px� 
�
'Processed net %s. Replicated %s times.
81*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1980]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1980]2
88Z32-81h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1980]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1980]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3432
	-1968.290Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[3]Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[3]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
amsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[3]_i_4_n_0amsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[3]_i_4_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
222
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[3]_i_13_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[3]_i_13_n_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3422
	-1968.180Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Fmsys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/shift_enFmsys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/shift_en8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
[msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/s_axi_aresetn_0[msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/s_axi_aresetn_02�
\msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/shift_en_reg_i_1	\msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/shift_en_reg_i_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
[msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/s_axi_aresetn_0[msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/s_axi_aresetn_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3422
	-1968.162Z32-619h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
[msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/s_axi_aresetn_0[msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/s_axi_aresetn_02�
\msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/shift_en_reg_i_1	\msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/shift_en_reg_i_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
[msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/s_axi_aresetn_0[msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/s_axi_aresetn_08Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3422
	-1968.137Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
[msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/s_axi_aresetn_0[msys_i/serial_adc_pwm_top_0/U0/datapath/adc_serial_peripheral/cycle_counter/s_axi_aresetn_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2j
2msys_i/rst_clk_wiz_0_100M/U0/peripheral_aresetn[0]2msys_i/rst_clk_wiz_0_100M/U0/peripheral_aresetn[0]2�
@msys_i/rst_clk_wiz_0_100M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N	@msys_i/rst_clk_wiz_0_100M/U0/ACTIVE_LOW_PR_OUT_DFF[0].FDRE_PER_N8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2msys_i/rst_clk_wiz_0_100M/U0/peripheral_aresetn[0]2msys_i/rst_clk_wiz_0_100M/U0/peripheral_aresetn[0]8Z32-735h px� 
t
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3422
	-1702.958Z32-619h px� 
�
'Processed net %s. Replicated %s times.
81*physynth2j
2msys_i/rst_clk_wiz_0_100M/U0/peripheral_aresetn[0]2msys_i/rst_clk_wiz_0_100M/U0/peripheral_aresetn[0]2
28Z32-81h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2j
2msys_i/rst_clk_wiz_0_100M/U0/peripheral_aresetn[0]2msys_i/rst_clk_wiz_0_100M/U0/peripheral_aresetn[0]8Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3422

-893.235Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[20]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[20]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2d
/msys_i/clk_wiz_0/inst/clk_out1_msys_clk_wiz_0_0/msys_i/clk_wiz_0/inst/clk_out1_msys_clk_wiz_0_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_5_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_5_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_16_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_16_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_45_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_45_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_104_n_0dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_104_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_297_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_297_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_720_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_720_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3372

-893.223Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[8]Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[8]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_4_n_0]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_12_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_12_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[8]_i_33_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[8]_i_33_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_74_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_74_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3362

-893.210Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[34]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[34]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
192
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[34]_i_5_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[34]_i_5_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3352

-893.074Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[13]Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[13]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[13]_i_5_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[13]_i_5_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
232
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[13]_i_19_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[13]_i_19_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3322

-893.057Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[55]Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[55]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[55]_i_4_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[55]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[55]_i_14_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[55]_i_14_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[55]_i_38_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[55]_i_38_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[55]_i_85_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[55]_i_85_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[55]_i_191_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[55]_i_191_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3312

-893.012Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[22]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[22]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[22]_i_4_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[22]_i_4_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
192
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_13_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_13_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3302

-893.010Z32-619h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_720_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_720_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3302

-893.007Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[9]Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[9]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[9]_i_2_n_0]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[9]_i_2_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
amsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[9]_i_8_n_0amsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[9]_i_8_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[9]_i_28_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[9]_i_28_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[9]_i_66_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[9]_i_66_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3302

-892.978Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[25]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[25]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[25]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[25]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[25]_i_12_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[25]_i_12_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[25]_i_31_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[25]_i_31_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[25]_i_63_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[25]_i_63_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3292

-892.876Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_5_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_5_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[22]_i_15_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[22]_i_15_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_39_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_39_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[22]_i_90_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[22]_i_90_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_204_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_204_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3282

-892.842Z32-619h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3282

-892.842Z32-619h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:012
00:00:00.3432

3276.4262
0.000Z17-268h px� 
T
%s*common2;
9Phase 3 Critical Path Optimization | Checksum: 11f55187c
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:05 ; elapsed = 00:00:10 . Memory (MB): peak = 3276.426 ; gain = 4.312h px� 
W

Phase %s%s
101*constraints2
4 2
Critical Path OptimizationZ18-101h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3282

-892.842Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[40]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[40]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2d
/msys_i/clk_wiz_0/inst/clk_out1_msys_clk_wiz_0_0/msys_i/clk_wiz_0/inst/clk_out1_msys_clk_wiz_0_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2�
Vmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[5]Vmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[5]2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[40]_i_1_comp	_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[40]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[40]_i_2_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[40]_i_2_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3282

-892.826Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[53]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[53]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[53]_i_4_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[53]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[53]_i_13_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[53]_i_13_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[53]_i_35_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[53]_i_35_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[53]_i_80_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[53]_i_80_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[53]_i_174_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[53]_i_174_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3272

-892.727Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[20]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[20]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_5_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_5_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_16_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_16_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_45_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_45_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_104_n_0dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_104_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_296_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_296_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_716_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_716_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Wmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[18]Wmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next[18]8Z32-702h px� 
�
'Processed net %s. Replicated %s times.
81*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1983]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1983]2
98Z32-81h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1983]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1983]8Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3262

-892.722Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[52]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[52]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[52]_i_3_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[52]_i_3_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[52]_i_13_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[52]_i_13_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[52]_i_38_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[52]_i_38_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[52]_i_79_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[52]_i_79_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3242

-892.676Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[8]Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[8]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_5_n_0]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_5_n_02�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_5_comp_1	`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_5_comp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_5_n_0]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_5_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3222

-892.671Z32-619h px� 
�
'Processed net %s. Replicated %s times.
81*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1981]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1981]2
98Z32-81h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1981]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[1981]8Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3222

-892.655Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[7]Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[7]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[7]_i_4_n_0]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[7]_i_4_n_08Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2�
]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[7]_i_4_n_0]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[7]_i_4_n_02�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[7]_i_4_comp	^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[7]_i_4_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[7]_i_14_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[7]_i_14_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3212

-892.496Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[36]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[36]8Z32-702h px� 
�
[Processed net %s. Critical path length was reduced through logic transformation on cell %s.374*physynth2�
}msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_12}msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/DEVICE_7SERIES.NO_BMM_INFO.SP.SIMPLE_PRIM36.ram_122�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[36]_i_1_comp	_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[36]_i_1_comp8Z32-710h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[36]_i_2_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[36]_i_2_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3192

-892.394Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_4_n_0]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_4_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_12_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[8]_i_12_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3192

-892.292Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[62]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[62]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[62]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[62]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[62]_i_12_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[62]_i_12_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[62]_i_33_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[62]_i_33_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[62]_i_78_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[62]_i_78_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[62]_i_194_n_0dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[62]_i_194_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[62]_i_503_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[62]_i_503_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3182

-892.266Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[13]Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[13]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2d
/msys_i/clk_wiz_0/inst/clk_out1_msys_clk_wiz_0_0/msys_i/clk_wiz_0/inst/clk_out1_msys_clk_wiz_0_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
232
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[13]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[13]_i_4_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3182

-892.230Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[48]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[48]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
222
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[48]_i_5_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[48]_i_5_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3182

-892.176Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[57]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[57]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[57]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[57]_i_4_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[57]_i_12_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[57]_i_12_n_02�
[msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[57]_i_12	[msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[57]_i_128Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[57]_i_12_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[57]_i_12_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3162

-891.971Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[45]Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[45]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[45]_i_5_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[45]_i_5_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[45]_i_20_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[45]_i_20_n_02�
[msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[45]_i_20	[msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[45]_i_208Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[45]_i_20_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[45]_i_20_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3152

-891.930Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[42]Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[42]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[42]_i_4_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[42]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[42]_i_14_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[42]_i_14_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[42]_i_35_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[42]_i_35_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[42]_i_78_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[42]_i_78_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[42]_i_176_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[42]_i_176_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3122

-891.867Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[40]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[40]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[40]_i_2_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[40]_i_2_n_02�
amsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[40]_i_2_comp_1	amsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[40]_i_2_comp_18Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[40]_i_2_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[40]_i_2_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3122

-891.764Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[60]Gmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg[60]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_2_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_2_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[60]_i_8_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[60]_i_8_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[60]_i_25_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[60]_i_25_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_55_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_55_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_117_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_117_n_08Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_336_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_336_n_02�
\msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_336	\msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_3368Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_336_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_336_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3062

-891.750Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[20]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[20]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_5_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_5_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_16_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_16_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_45_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_45_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_102_n_0dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[20]_i_102_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_293_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[20]_i_293_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3052

-891.736Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[18]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[18]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_11_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_11_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_29_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_29_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_59_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_59_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_129_n_0dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_129_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_323_n_0dmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[18]_i_323_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_711_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[18]_i_711_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.3012

-891.717Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[9]Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[9]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[9]_i_4_n_0]msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[9]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[9]_i_11_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[9]_i_11_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[9]_i_30_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[9]_i_30_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[9]_i_70_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[9]_i_70_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2982

-891.608Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_337_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[60]_i_337_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Ymsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next__0[3]Ymsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_next__0[3]8Z32-702h px� 
�
(Processed net %s.  Re-placed instance %s337*physynth2�
Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[287]Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[287]2�
Mmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg_reg[287]	Mmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg_reg[287]8Z32-663h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[287]Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/shiftreg[287]8Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2972

-891.562Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[28]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[28]8Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
212
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[28]_i_4_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[28]_i_4_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2962

-891.533Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[2]Imsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[2]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
amsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[2]_i_4_n_0amsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[2]_i_4_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[2]_i_13_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[2]_i_13_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[2]_i_35_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[2]_i_35_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[2]_i_80_n_0bmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[2]_i_80_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[2]_i_174_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[2]_i_174_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2952

-891.434Z32-619h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[22]Jmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/pwm_reg__0[22]8Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_5_n_0^msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_5_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[22]_i_15_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[22]_i_15_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_39_n_0_msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_39_n_08Z32-702h px� 
�
BPorcessed net %s. Optimizations did not improve timing on the net.366*physynth2�
cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[22]_i_90_n_0cmsys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg_reg[22]_i_90_n_08Z32-702h px� 
_
!Optimized %s %s.  Swapped %s %s.
322*physynth2
12
net2
242
pinsZ32-608h px� 
�
;Processed net %s. Optimization improves timing on the net.
394*physynth2�
`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_205_n_0`msys_i/serial_adc_pwm_top_0/U0/datapath/steering_peripheral/timeDelays_LUT/pwm_reg[22]_i_205_n_08Z32-735h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2952

-891.433Z32-619h px� 
s
(%s %s Timing Summary | WNS=%s | TNS=%s |333*physynth2
	Estimated2
 2
-2.2952

-891.433Z32-619h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.3152

3276.4262
0.000Z17-268h px� 
T
%s*common2;
9Phase 4 Critical Path Optimization | Checksum: 148aad9aa
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:07 ; elapsed = 00:00:14 . Memory (MB): peak = 3276.426 ; gain = 4.312h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0192

3276.4262
0.000Z17-268h px� 
x
>Post Physical Optimization Timing Summary | WNS=%s | TNS=%s |
318*physynth2
-2.2952

-891.433Z32-603h px� 
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
�-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  Optimization   |  WNS Gain (ns)  |  TNS Gain (ns)  |  Added Cells  |  Removed Cells  |  Optimized Cells/Nets  |  Dont Touch  |  Iterations  |  Elapsed   |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 
�
�|  DSP Register   |          0.000  |          0.000  |            0  |              0  |                     0  |           0  |           1  |  00:00:00  |
|  Critical Path  |          0.166  |       1077.613  |           28  |              0  |                    52  |           0  |           2  |  00:00:08  |
|  Total          |          0.166  |       1077.613  |           28  |              0  |                    52  |           0  |           3  |  00:00:08  |
-------------------------------------------------------------------------------------------------------------------------------------------------------------
*commonh px� 


*commonh px� 


*commonh px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Netlist sorting complete. 2

00:00:002
00:00:00.0202

3276.4262
0.000Z17-268h px� 
P
%s*common27
5Ending Physical Synthesis Task | Checksum: 1b428f9a4
h px� 
}

%s
*constraints2]
[Time (s): cpu = 00:00:08 ; elapsed = 00:00:15 . Memory (MB): peak = 3276.426 ; gain = 4.312h px� 
H
Releasing license: %s
83*common2
ImplementationZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
4272
1342
02
0Z4-41h px� 
O
%s completed successfully
29*	vivadotcl2
phys_opt_designZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
phys_opt_design: 2

00:00:132

00:00:222

3276.4262	
241.348Z17-268h px� 
H
&Writing timing data to binary archive.266*timingZ38-480h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write ShapeDB Complete: 2

00:00:012
00:00:00.2552

3276.4262
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PlaceDB: 2

00:00:052

00:00:032

3276.4262
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote PulsedLatchDB: 2

00:00:002

00:00:002

3276.4262
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
00:00:00.0572

3276.4262
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Netlist Cache: 2

00:00:002
00:00:00.1102

3276.4262
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Wrote Device Cache: 2

00:00:002
00:00:00.0042

3276.4262
0.000Z17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
Write Physdb Complete: 2

00:00:052

00:00:042

3276.4262
0.000Z17-268h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2k
iC:/Users/kharp/Desktop/soundSteering_halfLUTs/soundSteering_halfLUTs.runs/impl_4/msys_wrapper_physopt.dcpZ17-1381h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2
write_checkpoint: 2

00:00:072

00:00:102

3276.4262
0.000Z17-268h px� 


End Record