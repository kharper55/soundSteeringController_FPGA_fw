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

UINTPTR ip_base_addr = XPAR_SERIAL_ADC_PWM_TOP_0_BASEADDR; /*Low addr = 0x10000, High addr = 0x10fff */

enum AXI_LITE_REGS {
    CONTROL_REG            = 0x000,
    T1_REG                 = 0x004,
    T2_REG                 = 0x008,
    T3_REG                 = 0x00C,
    T4_REG                 = 0x010,
    T5_REG                 = 0x014,
    T6_REG                 = 0x018,
    T7_REG                 = 0x01C,
    T8_REG                 = 0x020,
    T9_REG                 = 0x024,
    T10_REG                = 0x028,
    T11_REG                = 0x02C,
    T12_REG                = 0x030,
    T13_REG                = 0x034,
    T14_REG                = 0x038,
    T15_REG                = 0x03C,
    T16_REG                = 0x040,
    T17_REG                = 0x044,
    T18_REG                = 0x048,
    T19_REG                = 0x04C,
    T20_REG                = 0x050,
    T21_REG                = 0x054,
    T22_REG                = 0x058,
    T23_REG                = 0x05C,
    T24_REG                = 0x060,
    T25_REG                = 0x064,
    T26_REG                = 0x068,
    T27_REG                = 0x06C,
    T28_REG                = 0x070,
    T29_REG                = 0x074,
    T30_REG                = 0x078,
    T31_REG                = 0x07C,
    T32_REG                = 0x080,
    T33_REG                = 0x084,
    T34_REG                = 0x088,
    T35_REG                = 0x08C,
    T36_REG                = 0x090,
    T37_REG                = 0x094,
    T38_REG                = 0x098,
    T39_REG                = 0x09C,
    T40_REG                = 0x0A0,
    T41_REG                = 0x0A4,
    T42_REG                = 0x0A8,
    T43_REG                = 0x0AC,
    T44_REG                = 0x0B0,
    T45_REG                = 0x0B4,
    T46_REG                = 0x0B8,
    T47_REG                = 0x0BC,
    T48_REG                = 0x0C0,
    T49_REG                = 0x0C4,
    T50_REG                = 0x0C8,
    T51_REG                = 0x0CC,
    T52_REG                = 0x0D0,
    T53_REG                = 0x0D4,
    T54_REG                = 0x0D8,
    T55_REG                = 0x0DC,
    T56_REG                = 0x0E0,
    T57_REG                = 0x0E4,
    T58_REG                = 0x0E8,
    T59_REG                = 0x0EC,
    T60_REG                = 0x0F0,
    T61_REG                = 0x0F4,
    T62_REG                = 0x0F8,
    T63_REG                = 0x0FC,
    T64_REG                = 0x100,
    ADC_CTRL_REG           = 0x104,
    ADC_DATA_REG           = 0x108,
    HEARTBEAT_CM32_TOP_REG = 0x10C,
    HEARTBEAT_CM32_CM_REG  = 0x110,
    FAN_CM32_TOP_REG       = 0x114,
    FAN_CM32_CM_REG        = 0x118,
    SPECTRUM_CM32_TOP_REG  = 0x11C,
    SPECTRUM_CM32_CM_REG   = 0x120,
    FSM_STATE_REG          = 0x124,
    EXTRA_REG              = 0x128
};

/************************** Constant Definitions *****************************/

/*
 * The following constants map to the XPAR parameters created in the
 * xparameters.h file. They are defined here such that a user can easily
 * change all the needed parameters in one place.
 */

// This is the size of the buffer to be transmitted/received in this example.
#define BUFFER_SIZE		4

int Count = 0;
        
/************************** Function Prototypes ******************************/

//static int SpiSlaveIntrExample(XSpi *SpiInstancePtr, UINTPTR BaseAddress);

static void SpiHandler(void *CallBackRef, u32 StatusEvent, unsigned int ByteCount);

/************************** Variable Definitions *****************************/
/*
 * The instances to support the device drivers are global such that they are
 * initialized to zero each time the program runs. They could be local but
 * should at least be static so that they are zeroed.
 */
static XSpi  SpiInstance;   /* Instance of the SPI device */
//static XGpio XGpioInstance;

/*
 * The following variables are used to read/write from the  Spi device, these
 * are global to avoid having large buffers on the stack.
 */
u8 ReadBuffer[BUFFER_SIZE] = {0x00, 0x00, 0x00, 0x00};
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

// Write safe to register
void update_custom_ip_register(int baseaddr, int offset, int value) {
    uint32_t temp = get_custom_ip_register(baseaddr, offset);
    Xil_Out32(baseaddr + offset, temp | value);
}

int main() {

    init_platform();

    XSpi_Config *ConfigPtr;
    int Status;

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
            xil_printf("\r\nCount: %d\r\n", rx_count);
            xil_printf("\r\nSPI RX Data: 0x%08X \r\n", \
                        (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 \
                                 | (uint8_t)ReadBuffer[1] << 8 | (uint8_t)ReadBuffer[0]));
            
            xil_printf("\r\nSPI TX Data: 0x%08X \r\n", \
                        (uint32_t)((uint8_t)WriteBuffer[0] << 24 | (uint8_t)WriteBuffer[1] << 16 \
                                 | (uint8_t)WriteBuffer[2] << 8 | (uint8_t)WriteBuffer[3]));
 
            if (rx_count == 5)  {
                xil_printf("Count is %d. Enabling sound steering peripheral...", rx_count);
                update_custom_ip_register(ip_base_addr, ADC_CTRL_REG, (uint32_t)1);   
                //set_custom_ip_register(ip_base_addr, ADC_CTRL_REG, (uint32_t)1);                           
            }  

            xil_printf("XSPI Status Reg: 0x%04x\r\n", XSpi_GetStatusReg(&SpiInstance));
            xil_printf("XSPI Control Reg: 0x%04x\r\n", XSpi_GetControlReg(&SpiInstance));
        }

        else {
            xil_printf("Spi slave interrupt Example Failed\r\n");
            //return XST_FAILURE;
        }

        xil_printf("IP FSM Status Code: 0x%00x\r\n", get_custom_ip_register(ip_base_addr, FSM_STATE_REG));
        
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