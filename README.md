Latest UTD source + build (Vivado 2023.x?) for FPGA (Trenz TE0725-03 breakout with Artix 7) on the controller PCB (no chnages since 04/30/2024). 

FPGA contains an area minimized MicroBlaze soft processor core for implementing SPI bus comms to controller MCU. 
FPGA contains custom RTL logic which integrates with simple and available Vivado IP.
FPGA custom RTL communicates with MicroBlaze core via AXI-lite bus using necessary Vivado IP core.
FPGA implements all signal processing functionality necessary for implementing phased array operation, PWM generation, as well as other glue logic.
FPGA employs use of nearly all resources on the chip (XC7A100T-2CSG324I), some timing failures remain but rebuild can take 2-5 hours and fail. Optimization and minimization needed.
