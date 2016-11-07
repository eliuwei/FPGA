#------------------GLOBAL--------------------#
set_global_assignment -name FAMILY "Cyclone IV E"
set_global_assignment -name DEVICE EP4CE6F17C8
set_global_assignment -name RESERVE_ALL_UNUSED_PINS "AS INPUT TRI-STATED"
set_global_assignment -name ENABLE_INIT_DONE_OUTPUT OFF

set_global_assignment -name RESERVE_ALL_UNUSED_PINS_WEAK_PULLUP "AS INPUT TRI-STATED"
set_global_assignment -name CYCLONEII_RESERVE_NCEO_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_DATA0_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_DATA1_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_FLASH_NCE_AFTER_CONFIGURATION "USE AS REGULAR IO"
set_global_assignment -name RESERVE_DCLK_AFTER_CONFIGURATION "USE AS REGULAR IO"

#复位引脚
set_location_assignment	PIN_E15	-to RSTn

#时钟引脚
set_location_assignment	PIN_E1	-to CLK

#LED对应的引脚
set_location_assignment	PIN_G15	-to LED[0]
set_location_assignment	PIN_F16	-to LED[1]
set_location_assignment	PIN_F15	-to LED[2]
set_location_assignment	PIN_D16	-to LED[3]

#串口对应的引脚
set_location_assignment	PIN_M2	-to RX_Pin_In
set_location_assignment	PIN_G1	-to TX_Pin_Out


#PS2对应的引脚
set_location_assignment	PIN_F1	-to PS2_Data_Pin_In
set_location_assignment	PIN_G2	-to PS2_CLK_Pin_In

#数码管
##
set_location_assignment	PIN_B7	-to DIG[0]
set_location_assignment	PIN_A8	-to DIG[1]
set_location_assignment	PIN_A6	-to DIG[2]
set_location_assignment	PIN_B5	-to DIG[3]
set_location_assignment	PIN_B6	-to DIG[4]
set_location_assignment	PIN_A7	-to DIG[5]
set_location_assignment	PIN_B8	-to DIG[6]
set_location_assignment	PIN_A5	-to DIG[7]
#
set_location_assignment	PIN_B1	-to SEL[0]
set_location_assignment	PIN_A2	-to SEL[1]
set_location_assignment	PIN_B3  -to SEL[2]
set_location_assignment	PIN_A3	-to SEL[3]
set_location_assignment	PIN_B4	-to SEL[4] 
set_location_assignment	PIN_A4	-to SEL[5]





