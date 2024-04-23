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
//#include "xgpio.h"    /* low-level gpio driver... allows 32 bit writes */

//UINTPTR axi_lite_base_addr = XPAR_SOUNDSTEERING_IP_AXI_0_BASEADDR; /*High addr = 0x44a1ffff*/
UINTPTR ip_base_addr = XPAR_SERIAL_ADC_PWM_TOP_0_BASEADDR; /*Low addr = 0x80000000, High addr = 0x80000FFF */

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

static int SpiSlaveIntrExample(XSpi *SpiInstancePtr, UINTPTR BaseAddress);

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

    /**
    * The XGpio driver instance data. The user is required to allocate a
    * variable of this type for every GPIO device in the system. A pointer
    * to a variable of this type is then passed to the driver API functions.
    */

    //XGpio_Initialize(&XGpioInstance, XPAR_XGPIO_0_BASEADDR);
    //XGpio_SetDataDirection(&XGpioInstance, 1, 0xFFFFFFFF);
    //XGpio_SetDataDirection(&XGpioInstance, 2, 0x00000000);

	/*
	 * Enable the DTR half-empty interrupt while transferring more than
	 * FIFO_DEPTH number of bytes in slave mode, so that the Tx FIFO
	 * is never empty during a transfer. If the Tx FIFO is empty during
	 * a transfer, it results in master receiving invalid data.
	 */
	XSpi_IntrEnable(&SpiInstance, XSP_INTR_TX_HALF_EMPTY_MASK);//XSP_INTR_TX_HALF_EMPTY_MASK);

    uint32_t rx_buff = 0x0000;
    update_custom_ip_register(ip_base_addr, ADC_CTRL_REG, 1);


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

            if (rx_count == 1) {
                xil_printf("Count is %d. Starting FSM with 0x%08X\r\n", rx_count, \
                            (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 \
                            | (uint8_t) 0x0 << 8 | (uint8_t) 0x1));

                //XGpio_DiscreteWrite(&XGpioInstance, 2, (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 \
                //                                       | (uint8_t) 0x0 << 8 | (uint8_t) 0x1));
            }
            else if (rx_count == 2) {
                xil_printf("Count is %d. Initiating AD4680 ALERT REG read with FSM code 0x%08X\r\n", rx_count, \
                            (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 \
                            | (uint8_t) 0x0 << 8 | (uint8_t) 0x2));

                //XGpio_DiscreteWrite(&XGpioInstance, 2, (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 \
                //                                       | (uint8_t) 0x0 << 8 | (uint8_t) 0x2));
            }
            else if (rx_count == 3) {
                xil_printf("Count is %d. Initiating AD4680 NOP with FSM code 0x%08X\r\n", rx_count, \
                            (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 \
                            | (uint8_t) 0x0 << 8 | (uint8_t) 0x5));

                //XGpio_DiscreteWrite(&XGpioInstance, 2, (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 \
                //                                       | (uint8_t) 0x0 << 8 | (uint8_t) 0x2));
            }
            // Not working, lacking synchronization with FSM... 
            // by the time we're ready to readout the register from the datapath, many clock cycles have already passed 
            // and thus the shift reg is void of the data we are interested in
            else if (rx_count == 4) {
                //rx_buff = XGpio_DiscreteRead(&XGpioInstance, 1);
                //XGpio_DiscreteWrite(&XGpioInstance, 2, (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 \
                //                                     | (uint8_t) 0x0 << 8 | (uint8_t) 0x00));
                //xil_printf("ADC ALERT REG contains 0x%X\r\n", rx_buff);
            }
            // Write 0x3 to the lowest byte for reading SDOA and playing PWM via this channel (stereo). 
            // Else write 0x6 to the same location
            else if (rx_count == 5)  {
                xil_printf("Count is %d. Initiating AD4680 continuous read on SDOB with FSM code 0x%08X\r\n", rx_count, \
                            (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 \
                            | (uint8_t) 0x0 << 8 | (uint8_t) 0x6));

                //XGpio_DiscreteWrite(&XGpioInstance, 2, (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 \
                //                                       | (uint8_t) 0x0 << 8 | (uint8_t) 0x3));
            }  
            /*       
            else if (rx_count == 6)  {
                // need this here as we have no syncing with vhdl peripheral... so it will read the 0xF's twice in a row and swap adc channels twice if we dont do this
                XGpio_DiscreteWrite(&XGpioInstance, 2, (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 | (uint8_t) 0x0 << 8 | (uint8_t) 0x0));
            }
            else if (rx_count == 24)  {
                xil_printf("Count is %d. Swapping to AD4680 continuous read of SDOB with FSM code 0x%X\r\n", rx_count, (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 | (uint8_t) 0x0 << 8 | (uint8_t) 0x3));
                XGpio_DiscreteWrite(&XGpioInstance, 2, (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 | (uint8_t) 0x0 << 8 | (uint8_t) 0x3));
            }
            else if (rx_count == 99) {
                xil_printf("Count is %d. Stopping AD4680 continuous read with FSM code 0x%X\r\n", rx_count, (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 | (uint8_t) 0x0 << 8 | (uint8_t) 0xf));
                XGpio_DiscreteWrite(&XGpioInstance, 2, (uint32_t)((uint8_t)ReadBuffer[3] << 24 | (uint8_t)ReadBuffer[2] << 16 | (uint8_t) 0x0 << 8 | (uint8_t) 0xf));
            }*/
            else {
                xil_printf("\r\nSDOA: %d\r\nSDOB: %d\r\n", \
                            (uint16_t)(rx_buff & 0x0000FFFF), \
                            (uint16_t)((rx_buff & 0xFFFF0000)) >> 16);
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



/*
------------------------------------------------
	---- Signals for user logic register space example
	--------------------------------------------------
	---- Number of Slave Registers 72 + 3
	signal slv_reg0	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- CONTROL_REG = XBITS STEERING AZ/EL , DBG?, MUTE, 2 BIT CHANSEL, FAN EN, TXACT EN, HBEN
	signal slv_reg1	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x TRANSDUCER1_REG
	signal slv_reg2	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x TRANSDUCER2_REG
	signal slv_reg3	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- .
	signal slv_reg4	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- .
	signal slv_reg5	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- .
	signal slv_reg6	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg7	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg8	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg9	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg10	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg11	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg12	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg13	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg14	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg15	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg16	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg17	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg18	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg19	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg20	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg21	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg22	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg23	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg24	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg25	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg26	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg27	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg28	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg29	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg30	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg31	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg32	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg33	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg34	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg35	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg36	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg37	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg38	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg39	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg40	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg41	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg42	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg43	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg44	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg45	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg46	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg47	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg48	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg49	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg50	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg51	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg52	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg53	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg54	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg55	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg56	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg57	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg58	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg59	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg60	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
	signal slv_reg61	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- .
	signal slv_reg62	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- .
	signal slv_reg63	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- .
	signal slv_reg64	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x TRANSDUCER64_REG = TINV, TEN
	signal slv_reg65	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x ADC_REG[31:0] = 16 BIT ADC_DATA & ADC_CFG_SEL(3BIT) & ADC_REG_RD_ADDR(3BIT) & REG_READ & RECONFIG & ADC_EN
	signal slv_reg66	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x ADC_DATA_REG  = SDOA&SDOB
	signal slv_reg67	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x HEARTBEAT_TOP_REG
	signal slv_reg68	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x HEARTBEAT_CM_REG
	signal slv_reg69	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x FAN_TOP_REG 
	signal slv_reg70	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x FAN_CM_REG
	signal slv_reg71	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x TX_ACTIVE_TOP_REG
	signal slv_reg72	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x TX_ACTIVE_CM_REG 
	signal slv_reg73	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- x FSM_STATE_REG = FSM STATE(4BITS)
	signal slv_reg74	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0); -- EXTRA_REG     = NOTHING YET
*/
