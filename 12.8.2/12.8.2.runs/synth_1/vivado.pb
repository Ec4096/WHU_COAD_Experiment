
s
Command: %s
53*	vivadotcl2B
.synth_design -top task2 -part xc7a100tcsg324-12default:defaultZ4-113h px� 
:
Starting synth_design
149*	vivadotclZ4-321h px� 
�
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-347h px� 
�
0Got license for feature '%s' and/or device '%s'
310*common2
	Synthesis2default:default2
xc7a100t2default:defaultZ17-349h px� 
�
%s*synth2�
wStarting RTL Elaboration : Time (s): cpu = 00:00:01 ; elapsed = 00:00:03 . Memory (MB): peak = 430.410 ; gain = 97.832
2default:defaulth px� 
�
synthesizing module '%s'%s4497*oasys2
task22default:default2
 2default:default2M
7E:/Vivado_file/12.8.2/12.8.2.srcs/sources_1/new/task2.v2default:default2
1552default:default8@Z8-6157h px� 
�
synthesizing module '%s'%s4497*oasys2
alu2default:default2
 2default:default2M
7E:/Vivado_file/12.8.2/12.8.2.srcs/sources_1/new/task2.v2default:default2
1332default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
alu2default:default2
 2default:default2
12default:default2
12default:default2M
7E:/Vivado_file/12.8.2/12.8.2.srcs/sources_1/new/task2.v2default:default2
1332default:default8@Z8-6155h px� 
�
synthesizing module '%s'%s4497*oasys2
seg7x162default:default2
 2default:default2M
7E:/Vivado_file/12.8.2/12.8.2.srcs/sources_1/new/task2.v2default:default2
272default:default8@Z8-6157h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
seg7x162default:default2
 2default:default2
22default:default2
12default:default2M
7E:/Vivado_file/12.8.2/12.8.2.srcs/sources_1/new/task2.v2default:default2
272default:default8@Z8-6155h px� 
�
'done synthesizing module '%s'%s (%s#%s)4495*oasys2
task22default:default2
 2default:default2
32default:default2
12default:default2M
7E:/Vivado_file/12.8.2/12.8.2.srcs/sources_1/new/task2.v2default:default2
1552default:default8@Z8-6155h px� 
|
!design %s has unconnected port %s3331*oasys2
task22default:default2
sw_i[14]2default:defaultZ8-3331h px� 
|
!design %s has unconnected port %s3331*oasys2
task22default:default2
sw_i[13]2default:defaultZ8-3331h px� 
|
!design %s has unconnected port %s3331*oasys2
task22default:default2
sw_i[11]2default:defaultZ8-3331h px� 
{
!design %s has unconnected port %s3331*oasys2
task22default:default2
sw_i[1]2default:defaultZ8-3331h px� 
�
%s*synth2�
xFinished RTL Elaboration : Time (s): cpu = 00:00:01 ; elapsed = 00:00:05 . Memory (MB): peak = 486.234 ; gain = 153.656
2default:defaulth px� 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:01 ; elapsed = 00:00:05 . Memory (MB): peak = 486.234 ; gain = 153.656
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 1 : Time (s): cpu = 00:00:01 ; elapsed = 00:00:05 . Memory (MB): peak = 486.234 ; gain = 153.656
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
Loading part %s157*device2$
xc7a100tcsg324-12default:defaultZ21-403h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
>

Processing XDC Constraints
244*projectZ1-262h px� 
=
Initializing timing engine
348*projectZ1-569h px� 
m
Parsing XDC File [%s]
179*designutils2,
E:/Vivado_file/icf.xdc2default:default8Z20-179h px� 
�
No nets matched '%s'.
507*	planAhead2!
sw_i_IBUF[15]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
52default:default8@Z12-507h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
52default:default8@Z17-55h px�
�
No nets matched '%s'.
507*	planAhead2
	BTNC_IBUF2default:default2,
E:/Vivado_file/icf.xdc2default:default2
62default:default8@Z12-507h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
62default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led_o[0]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
472default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
472default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led_o[1]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
482default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
482default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led_o[2]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
492default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
492default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led_o[3]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
502default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
502default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led_o[4]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
512default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
512default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led_o[5]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
522default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
522default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led_o[6]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
532default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
532default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led_o[7]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
542default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
542default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led_o[8]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
552default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
552default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
led_o[9]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
562default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
562default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	led_o[10]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
572default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
572default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	led_o[11]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
582default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
582default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	led_o[12]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
592default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
592default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	led_o[13]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
602default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
602default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	led_o[14]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
612default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
612default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
	led_o[15]2default:default2,
E:/Vivado_file/icf.xdc2default:default2
622default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
622default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2

CPU_RESETN2default:default2,
E:/Vivado_file/icf.xdc2default:default2
662default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
662default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
BTNC2default:default2,
E:/Vivado_file/icf.xdc2default:default2
672default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
672default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
BTNU2default:default2,
E:/Vivado_file/icf.xdc2default:default2
682default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
682default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
BTNL2default:default2,
E:/Vivado_file/icf.xdc2default:default2
692default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
692default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
BTNR2default:default2,
E:/Vivado_file/icf.xdc2default:default2
702default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
702default:default8@Z17-55h px�
�
No ports matched '%s'.
584*	planAhead2
BTND2default:default2,
E:/Vivado_file/icf.xdc2default:default2
712default:default8@Z12-584h px�
�
"'%s' expects at least one object.
55*common2 
set_property2default:default2,
E:/Vivado_file/icf.xdc2default:default2
712default:default8@Z17-55h px�
v
Finished Parsing XDC File [%s]
178*designutils2,
E:/Vivado_file/icf.xdc2default:default8Z20-178h px� 
�
�Implementation specific constraints were found while reading constraint file [%s]. These constraints will be ignored for synthesis but will be used in implementation. Impacted constraints are listed in the file [%s].
233*project2*
E:/Vivado_file/icf.xdc2default:default2+
.Xil/task2_propImpl.xdc2default:defaultZ1-236h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
823.4302default:default2
0.0002default:defaultZ17-268h px� 
H
&Completed Processing XDC Constraints

245*projectZ1-263h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
823.4802default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
823.4802default:default2
0.0002default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common24
 Constraint Validation Runtime : 2default:default2
00:00:002default:default2 
00:00:00.0042default:default2
823.4802default:default2
0.0002default:defaultZ17-268h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
~Finished Constraint Validation : Time (s): cpu = 00:00:04 ; elapsed = 00:00:18 . Memory (MB): peak = 823.480 ; gain = 490.902
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
V
%s
*synth2>
*Start Loading Part and Timing Information
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Loading part: xc7a100tcsg324-1
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Loading Part and Timing Information : Time (s): cpu = 00:00:04 ; elapsed = 00:00:18 . Memory (MB): peak = 823.480 ; gain = 490.902
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Z
%s
*synth2B
.Start Applying 'set_property' XDC Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished applying 'set_property' XDC Constraints : Time (s): cpu = 00:00:04 ; elapsed = 00:00:18 . Memory (MB): peak = 823.480 ; gain = 490.902
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
}HDL ADVISOR - The operator resource <%s> is shared. To prevent sharing consider applying a KEEP on the output of the operator4233*oasys2
adder2default:default2M
7E:/Vivado_file/12.8.2/12.8.2.srcs/sources_1/new/task2.v2default:default2
1412default:default8@Z8-5818h px� 
�
^ROM "%s" won't be mapped to RAM because address size (%s) is larger than maximum supported(%s)3997*oasys2
Zero02default:default2
322default:default2
252default:defaultZ8-5545h px� 
�
TROM size for "%s" is below threshold of ROM address width. It will be mapped to LUTs4039*oasys2
o_seg_r2default:defaultZ8-5587h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished RTL Optimization Phase 2 : Time (s): cpu = 00:00:04 ; elapsed = 00:00:18 . Memory (MB): peak = 823.480 ; gain = 490.902
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     32 Bit       Adders := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      2 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               64 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 3     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     32 Bit        Muxes := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	  18 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   8 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 2     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Finished RTL Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Y
%s
*synth2A
-Start RTL Hierarchical Component Statistics 
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Hierarchical RTL Component report 
2default:defaulth p
x
� 
:
%s
*synth2"
Module task2 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      2 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                2 Bit    Registers := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   4 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      2 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
� 
8
%s
*synth2 
Module alu 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     32 Bit       Adders := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input     32 Bit        Muxes := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   3 Input     32 Bit        Muxes := 2     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      1 Bit        Muxes := 1     
2default:defaulth p
x
� 
<
%s
*synth2$
Module seg7x16 
2default:defaulth p
x
� 
K
%s
*synth23
Detailed RTL Component Info : 
2default:defaulth p
x
� 
:
%s
*synth2"
+---Adders : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      3 Bit       Adders := 1     
2default:defaulth p
x
� 
=
%s
*synth2%
+---Registers : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	               64 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                8 Bit    Registers := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	                3 Bit    Registers := 1     
2default:defaulth p
x
� 
9
%s
*synth2!
+---Muxes : 
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   2 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	  18 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
� 
Z
%s
*synth2B
.	   8 Input      8 Bit        Muxes := 1     
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
[
%s
*synth2C
/Finished RTL Hierarchical Component Statistics
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s
*synth2k
WPart Resources:
DSPs: 240 (col length:80)
BRAMs: 270 (col length: RAMB18 80 RAMB36 40)
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Part Resource Summary
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
W
%s
*synth2?
+Start Cross Boundary and Area Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
]
%s
*synth2E
1Warning: Parallel synthesis criteria is not met 
2default:defaulth p
x
� 
�
^ROM "%s" won't be mapped to RAM because address size (%s) is larger than maximum supported(%s)3997*oasys2
u_alu/Zero02default:default2
322default:default2
252default:defaultZ8-5545h px� 
|
!design %s has unconnected port %s3331*oasys2
task22default:default2
sw_i[14]2default:defaultZ8-3331h px� 
|
!design %s has unconnected port %s3331*oasys2
task22default:default2
sw_i[13]2default:defaultZ8-3331h px� 
|
!design %s has unconnected port %s3331*oasys2
task22default:default2
sw_i[11]2default:defaultZ8-3331h px� 
{
!design %s has unconnected port %s3331*oasys2
task22default:default2
sw_i[1]2default:defaultZ8-3331h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[62]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[54]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[46]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[38]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[61]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[53]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[45]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[37]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[60]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[52]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[44]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[36]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[57]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[49]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[41]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[33]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[29]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[25]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[25]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[21]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[21]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[17]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[17]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[13]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[13]2default:default2
FDC2default:default21
u_seg7x16/i_data_store_reg[9]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys21
u_seg7x16/i_data_store_reg[9]2default:default2
FDC2default:default21
u_seg7x16/i_data_store_reg[5]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys21
u_seg7x16/i_data_store_reg[5]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[27]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[59]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[51]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[43]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[35]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[27]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[19]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[19]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[11]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[11]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[28]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[56]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[48]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[40]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[32]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[28]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[24]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[24]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[20]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[20]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[16]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[16]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[12]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[12]2default:default2
FDC2default:default21
u_seg7x16/i_data_store_reg[8]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys21
u_seg7x16/i_data_store_reg[8]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[30]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[58]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[50]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[42]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[34]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[63]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[30]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[26]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[26]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[22]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[22]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[18]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[18]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[14]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[14]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[10]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[10]2default:default2
FDC2default:default21
u_seg7x16/i_data_store_reg[6]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys21
u_seg7x16/i_data_store_reg[6]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[31]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[63]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[55]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[55]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[47]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[47]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[39]2default:defaultZ8-3886h px� 
�
6propagating constant %s across sequential element (%s)3333*oasys2
02default:default24
 \u_seg7x16/i_data_store_reg[39] 2default:defaultZ8-3333h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[31]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[23]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[23]2default:default2
FDC2default:default22
u_seg7x16/i_data_store_reg[15]2default:defaultZ8-3886h px� 
�
"merging instance '%s' (%s) to '%s'3436*oasys22
u_seg7x16/i_data_store_reg[15]2default:default2
FDC2default:default21
u_seg7x16/i_data_store_reg[7]2default:defaultZ8-3886h px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Cross Boundary and Area Optimization : Time (s): cpu = 00:00:05 ; elapsed = 00:00:19 . Memory (MB): peak = 823.480 ; gain = 490.902
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
R
%s
*synth2:
&Start Applying XDC Timing Constraints
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Applying XDC Timing Constraints : Time (s): cpu = 00:00:06 ; elapsed = 00:00:26 . Memory (MB): peak = 825.324 ; gain = 492.746
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
F
%s
*synth2.
Start Timing Optimization
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
|Finished Timing Optimization : Time (s): cpu = 00:00:06 ; elapsed = 00:00:26 . Memory (MB): peak = 834.957 ; gain = 502.379
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-
Start Technology Mapping
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
{Finished Technology Mapping : Time (s): cpu = 00:00:06 ; elapsed = 00:00:26 . Memory (MB): peak = 837.801 ; gain = 505.223
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
?
%s
*synth2'
Start IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
Q
%s
*synth29
%Start Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
T
%s
*synth2<
(Finished Flattening Before IO Insertion
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
H
%s
*synth20
Start Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Finished Final Netlist Cleanup
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
uFinished IO Insertion : Time (s): cpu = 00:00:07 ; elapsed = 00:00:27 . Memory (MB): peak = 837.801 ; gain = 505.223
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
D
%s
*synth2,

Report Check Netlist: 
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|      |Item              |Errors |Warnings |Status |Description       |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
u
%s
*synth2]
I|1     |multi_driven_nets |      0|        0|Passed |Multi driven nets |
2default:defaulth p
x
� 
u
%s
*synth2]
I+------+------------------+-------+---------+-------+------------------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
O
%s
*synth27
#Start Renaming Generated Instances
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Instances : Time (s): cpu = 00:00:07 ; elapsed = 00:00:27 . Memory (MB): peak = 837.801 ; gain = 505.223
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
E
%s
*synth2-

Report RTL Partitions: 
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
+| |RTL Partition |Replication |Instances |
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
W
%s
*synth2?
++-+--------------+------------+----------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
L
%s
*synth24
 Start Rebuilding User Hierarchy
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Rebuilding User Hierarchy : Time (s): cpu = 00:00:07 ; elapsed = 00:00:27 . Memory (MB): peak = 837.801 ; gain = 505.223
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Renaming Generated Ports
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Ports : Time (s): cpu = 00:00:07 ; elapsed = 00:00:27 . Memory (MB): peak = 837.801 ; gain = 505.223
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
M
%s
*synth25
!Start Handling Custom Attributes
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Handling Custom Attributes : Time (s): cpu = 00:00:07 ; elapsed = 00:00:27 . Memory (MB): peak = 837.801 ; gain = 505.223
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
J
%s
*synth22
Start Renaming Generated Nets
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Renaming Generated Nets : Time (s): cpu = 00:00:07 ; elapsed = 00:00:27 . Memory (MB): peak = 837.801 ; gain = 505.223
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
K
%s
*synth23
Start Writing Synthesis Report
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
A
%s
*synth2)

Report BlackBoxes: 
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
| |BlackBox name |Instances |
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
J
%s
*synth22
+-+--------------+----------+
2default:defaulth p
x
� 
A
%s*synth2)

Report Cell Usage: 
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|      |Cell   |Count |
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
D
%s*synth2,
|1     |BUFG   |     1|
2default:defaulth px� 
D
%s*synth2,
|2     |CARRY4 |    11|
2default:defaulth px� 
D
%s*synth2,
|3     |LUT1   |     4|
2default:defaulth px� 
D
%s*synth2,
|4     |LUT2   |     2|
2default:defaulth px� 
D
%s*synth2,
|5     |LUT3   |    13|
2default:defaulth px� 
D
%s*synth2,
|6     |LUT4   |     3|
2default:defaulth px� 
D
%s*synth2,
|7     |LUT5   |     8|
2default:defaulth px� 
D
%s*synth2,
|8     |LUT6   |    16|
2default:defaulth px� 
D
%s*synth2,
|9     |FDCE   |    54|
2default:defaulth px� 
D
%s*synth2,
|10    |FDPE   |     8|
2default:defaulth px� 
D
%s*synth2,
|11    |IBUF   |    14|
2default:defaulth px� 
D
%s*synth2,
|12    |OBUF   |    16|
2default:defaulth px� 
D
%s*synth2,
+------+-------+------+
2default:defaulth px� 
E
%s
*synth2-

Report Instance Areas: 
2default:defaulth p
x
� 
R
%s
*synth2:
&+------+------------+--------+------+
2default:defaulth p
x
� 
R
%s
*synth2:
&|      |Instance    |Module  |Cells |
2default:defaulth p
x
� 
R
%s
*synth2:
&+------+------------+--------+------+
2default:defaulth p
x
� 
R
%s
*synth2:
&|1     |top         |        |   150|
2default:defaulth p
x
� 
R
%s
*synth2:
&|2     |  u_seg7x16 |seg7x16 |    78|
2default:defaulth p
x
� 
R
%s
*synth2:
&+------+------------+--------+------+
2default:defaulth p
x
� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
�
%s*synth2�
�Finished Writing Synthesis Report : Time (s): cpu = 00:00:07 ; elapsed = 00:00:27 . Memory (MB): peak = 837.801 ; gain = 505.223
2default:defaulth px� 
~
%s
*synth2f
R---------------------------------------------------------------------------------
2default:defaulth p
x
� 
r
%s
*synth2Z
FSynthesis finished with 0 errors, 0 critical warnings and 4 warnings.
2default:defaulth p
x
� 
�
%s
*synth2�
~Synthesis Optimization Runtime : Time (s): cpu = 00:00:04 ; elapsed = 00:00:17 . Memory (MB): peak = 837.801 ; gain = 167.977
2default:defaulth p
x
� 
�
%s
*synth2�
Synthesis Optimization Complete : Time (s): cpu = 00:00:07 ; elapsed = 00:00:27 . Memory (MB): peak = 837.801 ; gain = 505.223
2default:defaulth p
x
� 
B
 Translating synthesized netlist
350*projectZ1-571h px� 
f
-Analyzing %s Unisim elements for replacement
17*netlist2
112default:defaultZ29-17h px� 
j
2Unisim Transformation completed in %s CPU seconds
28*netlist2
02default:defaultZ29-28h px� 
K
)Preparing netlist for logic optimization
349*projectZ1-570h px� 
u
)Pushed %s inverter(s) to %s load pin(s).
98*opt2
02default:default2
02default:defaultZ31-138h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
847.1022default:default2
0.0002default:defaultZ17-268h px� 
~
!Unisim Transformation Summary:
%s111*project29
%No Unisim elements were transformed.
2default:defaultZ1-111h px� 
U
Releasing license: %s
83*common2
	Synthesis2default:defaultZ17-83h px� 
�
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
802default:default2
322default:default2
242default:default2
02default:defaultZ4-41h px� 
^
%s completed successfully
29*	vivadotcl2 
synth_design2default:defaultZ4-42h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
synth_design: 2default:default2
00:00:082default:default2
00:00:292default:default2
847.1022default:default2
527.5162default:defaultZ17-268h px� 
�
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2
00:00:002default:default2
847.1022default:default2
0.0002default:defaultZ17-268h px� 
K
"No constraints selected for write.1103*constraintsZ18-5210h px� 
�
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2G
3E:/Vivado_file/12.8.2/12.8.2.runs/synth_1/task2.dcp2default:defaultZ17-1381h px� 
�
%s4*runtcl2t
`Executing : report_utilization -file task2_utilization_synth.rpt -pb task2_utilization_synth.pb
2default:defaulth px� 
�
Exiting %s at %s...
206*common2
Vivado2default:default2,
Sun Dec  8 20:39:59 20242default:defaultZ17-206h px� 


End Record