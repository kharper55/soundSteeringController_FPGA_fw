#include "xiic.h"

XIic_Config XIic_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,axi-iic-2.1", /* compatible */
		0x40800000, /* reg */
		0x0, /* Has10BitAddr */
		0x0, /* GpOutWidth */
		0x2003, /* interrupts */
		0x41200001 /* interrupt-parent */
	},
	 {
		 NULL
	}
};