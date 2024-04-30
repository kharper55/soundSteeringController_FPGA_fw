/******************************************************************************
* Copyright (C) 2023 Advanced Micro Devices, Inc. All Rights Reserved.
* SPDX-License-Identifier: MIT
******************************************************************************/
/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

 //##############################
 // REGENERATE THE PLATFORM EVERY TIME YOU RE-EXPORT THE HARWARE FROM VIVADO! ASSIGN MSYS_WRAPPER.XSA TO NEW PLATFORM COMPONENT

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"

#include "xspi.h"		/* SPI device driver */
#include "xinterrupt_wrap.h"
#include "xil_exception.h"
#include "app_utility.h"

/************************** Constant Definitions *****************************/

#define BUFFER_SIZE		4 // 4 byte SPI transactions
int Count = 0;

#define IP_BASE_ADDR    XPAR_SERIAL_ADC_PWM_TOP_0_BASEADDR
        
/************************** Function Prototypes ******************************/
static void SpiHandler(void *CallBackRef, u32 StatusEvent, unsigned int ByteCount);

/************************** Variable Definitions *****************************/
static XSpi  SpiInstance;   /* Instance of the SPI device */

/*
 * The following variables are used to read/write from the  Spi device, these
 * are global to avoid having large buffers on the stack.
 */
u8 ReadBuffer[BUFFER_SIZE] = {0x00, 0x00, 0x00, 0x00}; // low bytes should contain az,el respectively
u8 WriteBuffer[BUFFER_SIZE] = {0xDE, 0xAD, 0xBE, 0xEF};

/*
 * The following variables are shared between non-interrupt processing and
 * interrupt processing such that they must be global.
 */
static volatile int TransferInProgress;
volatile uint32_t rx_count = 0;

static void generic_delay(int delay) {
    int start;
    int end = delay * 2000;
    for (start = 0; start < end; start++) {}
}

// Write to register
void set_custom_ip_register(int baseaddr, int offset, int value) {
    Xil_Out32(baseaddr + offset, value);
}

int get_custom_ip_register(int baseaddr, int offset) {
    int temp = 0;
    temp = Xil_In32(baseaddr + offset);
    return (temp);
}

/*
// Write safe to register
void update_custom_ip_register(int baseaddr, int offset, int value) {
    uint32_t temp = get_custom_ip_register(baseaddr, offset);
    Xil_Out32(baseaddr + offset, temp | value);
}*/

// Write specific bits to register
void update_custom_ip_register(int baseaddr, int offset, int value, uint32_t bitmask) {
    uint32_t temp = get_custom_ip_register(baseaddr, offset);
    // Clear the bits specified by the bitmask
    temp &= ~bitmask;
    // Set the new value for the specified bits
    temp |= (value & bitmask);
    // Write the modified value back to the register
    Xil_Out32(baseaddr + offset, temp);
}

int main() {

    init_platform();

    //static const bool VERBOSE = true;

    XSpi_Config *ConfigPtr;
    int Status;
    

    static int chann = 0;

    xil_printf("Enabling sound steering peripheral...");
    update_custom_ip_register(IP_BASE_ADDR, ADC_CTRL_REG, (uint32_t)1, 0x1);   // enable operation of the device (everything gets enabled)

	/*
	 * Initialize the SPI driver so that it's ready to use, specify the
	 * device ID that is generated in xparameters.h.
	 */

    UINTPTR BaseAddress = XPAR_XSPI_1_BASEADDR;

	ConfigPtr = XSpi_LookupConfig(BaseAddress);
	if (ConfigPtr == NULL) {
		return XST_DEVICE_NOT_FOUND;
	}

	Status = XSpi_CfgInitialize(&SpiInstance, ConfigPtr,
				    ConfigPtr->BaseAddress);

	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	Status = XSetupInterruptSystem(&SpiInstance, &XSpi_InterruptHandler,
				       ConfigPtr->IntrId,
				       ConfigPtr->IntrParent,
				       XINTERRUPT_DEFAULT_PRIORITY);
	if (Status != XST_SUCCESS) {
		return XST_FAILURE;
	}

	XSpi_SetStatusHandler(&SpiInstance, &SpiInstance, (XSpi_StatusHandler)SpiHandler);

	/*
	 * The SPI device is a slave by default and the clock phase and polarity
	 * have to be set according to its master. In this example, CPOL is set
	 * to active low and CPHA is set to 1.
	 */
	//Status = XSpi_SetOptions(&SpiInstance, XSP_MANUAL_SSELECT_OPTION);//XSP_CLK_PHASE_1_OPTION);
	//			 //XSP_CLK_ACTIVE_LOW_OPTION);
	//if (Status != XST_SUCCESS) {
	//	return XST_FAILURE;
	//}

	/*
	 * Start the SPI driver so that the device is enabled.
	 */
	XSpi_Start(&SpiInstance);

	/*
	 * Enable the DTR half-empty interrupt while transferring more than
	 * FIFO_DEPTH number of bytes in slave mode, so that the Tx FIFO
	 * is never empty during a transfer. If the Tx FIFO is empty during
	 * a transfer, it results in master receiving invalid data.
	 */
	XSpi_IntrEnable(&SpiInstance, XSP_INTR_TX_HALF_EMPTY_MASK);//XSP_INTR_TX_HALF_EMPTY_MASK);

    while(1) {

        // Transmit data as a slave, when the master starts sending data.
        TransferInProgress = TRUE;
        Status = XSpi_Transfer(&SpiInstance, WriteBuffer, ReadBuffer, BUFFER_SIZE);

        if (Status != XST_SUCCESS) {
            return XST_FAILURE;
        }

        // Wait till the transfer is complete.
        while (TransferInProgress == TRUE);

        // Print all the data received from the master.
        if (Status == XST_SUCCESS) {


            // here we should decode the data. for now, grab it and write it out, then write the received coords to the pertinent register location, ie reg0 bits 31:20, 6bit Az, 6bit el
            // prior we were just ripping the first 4 bytes received, 2 for azi 2 for el. now it will be shifted over cuz the command code is being carried in 


            xil_printf("\r\nCount        : %d\r\n", rx_count);
            xil_printf("\r\nSPI RX Data  : 0x%08X \r\n", \
                        (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 \
                                 | (uint8_t)ReadBuffer[1] << 8 | (uint8_t)ReadBuffer[0]));

            xil_printf("\r\nGot some bytes: %u", (unsigned)ReadBuffer[3]);

            // branch depending on leading char / cmd                
            switch((uint8_t)ReadBuffer[3]) {
                case(0x80): // new coordinates came in
                    xil_printf("\r\nWriting steering coords...");
                    update_custom_ip_register(IP_BASE_ADDR, CONTROL_REG, (uint32_t)(((((uint16_t)((ReadBuffer[2] & 0x3F) << 10)) | ((uint16_t)((ReadBuffer[1] & 0x3F) << 4)))&0xFFF0)) << 16, 0xFFF00000);
                    break;
                case(0x40): // channel change requested
                    if(chann == 0) {
                        chann = 1;
                    }
                    else {
                        chann = 0;
                    }
                    xil_printf("\r\nToggling channel to %d...", chann);
                    update_custom_ip_register(IP_BASE_ADDR, CONTROL_REG, (uint32_t)chann, 0x00000001); // only need to write low bit to toggle channel
                    break;
                default:
                    xil_printf("\r\nUnfamiliar data!");
                    break;
            }
            xil_printf("\r\nCoord        : 0x%08X", (uint32_t)(((((uint16_t)((ReadBuffer[2] & 0x3F) << 10)) | ((uint16_t)((ReadBuffer[1] & 0x3F) << 4)))&0xFFF0)) << 16);
            
            // old -- update_custom_ip_register(IP_BASE_ADDR, CONTROL_REG, (uint32_t)(((((uint16_t)((ReadBuffer[3] & 0x3F) << 10)) | ((uint16_t)((ReadBuffer[2] & 0x3F) << 4)))&0xFFF0)) << 16, 0xFFF00000);
            //update_custom_ip_register(IP_BASE_ADDR, CONTROL_REG, (uint32_t)(((((uint16_t)((ReadBuffer[2] & 0x3F) << 10)) | ((uint16_t)((ReadBuffer[1] & 0x3F) << 4)))&0xFFF0)) << 16, 0xFFF00000);


            /*
            Reference console prints
            SPI RX Data        : 0x801E1E00   <---- data is 0x8 identifier (coordinate), 1e high is azimuth, 1e low is el, these correspond to readbuff 2 and 1 respectively
            Coord              : 0x1E00000
            SPI TX Data        : 0xDEADBEEF 
            IP FSM Status Code : 0x4
            IP Steering Coord  : 0x1E00000
            XSPI Status Reg    : 0x0025
            XSPI Control Reg   : 0x0082
            */

            // Comment this out for tomorrow
            xil_printf("\r\nSPI TX Data  : 0x%08X \r\n", \
                        (uint32_t)((uint8_t)WriteBuffer[0] << 24 | (uint8_t)WriteBuffer[1] << 16 \
                                 | (uint8_t)WriteBuffer[2] << 8 | (uint8_t)WriteBuffer[3]));
        }

        else {
            xil_printf("Spi slave interrupt Example Failed\r\n");
            //return XST_FAILURE;
        }
        xil_printf("IP FSM Status Code : 0x%08X\r\n", get_custom_ip_register(IP_BASE_ADDR, FSM_STATE_REG));
        xil_printf("IP Control Reg     : 0x%08X\r\n", get_custom_ip_register(IP_BASE_ADDR, CONTROL_REG));
        xil_printf("XSPI Status Reg    : 0x%08x\r\n", XSpi_GetStatusReg(&SpiInstance));
        xil_printf("XSPI Control Reg   : 0x%08x\r\n", XSpi_GetControlReg(&SpiInstance));
    }
    
    cleanup_platform();
    
    return 0;
}

/******************************************************************************/
/**
*
* This function is the handler which performs processing for the SPI driver. It
* is called from an interrupt context such that the amount of processing to be
* performed should be minimized. This handler provides an example of how to
* handle SPI interrupts but is application specific.
*
* @param 	CallBackRef is a reference passed to the handler.
* @param	StatusEvent is the status of the SPI.
* @param	ByteCount is the number of bytes transferred.
*
* @return	None.
*
* @note		None.
*
******************************************************************************/
static void SpiHandler(void *CallBackRef, u32 StatusEvent,
		       unsigned int ByteCount) {
	if (StatusEvent == XST_SPI_TRANSFER_DONE) {
		//Indicate the transfer on the SPI bus is no longer in progress.
        rx_count += 1;
		TransferInProgress = FALSE;
	}
}