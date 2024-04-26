----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 09:37:16 PM
-- Design Name: 
-- Module Name: serial_adc_pwm_top - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity serial_adc_pwm_top is
    generic (
		-- Width of S_AXI data bus
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		-- Width of S_AXI address bus
		C_S_AXI_ADDR_WIDTH	: integer	:= 9
	);
    Port ( 
           ---------- System Input Ports ----------
           s_axi_aclk           : in std_logic;					     -- 100MHz system clock input
		   clk_serial           : in std_logic;                      -- 40MHz clock for serial ADC from PLL
		   s_axi_aresetn        : in std_logic;
		   
		   ---------- Serial ADC Ports ----------
		   sdoa                 : in std_logic;                      -- J2.23 FPGA PIN A3 serial input from SDOA on AD4680
		   sdob                 : in std_logic;                      -- J2.25 FPGA PIN V1 serial input from SDOB on AD4680
		   cs                   : out std_logic;                     -- J2.21 FPGA PIN U4 active low (idle high) CS input to adc that starts a conversion on falling edge which is ready on the following cycle
		   scl                  : out std_logic;                     -- J2.29 FPGA PIN T5 adc serial clock - idle high with CS. They come low together on conversion start according to the AD4680 timing diagram 
		   sdi                  : out std_logic;                     -- J2.27 FPGA PIN N5 serial output to SDI on AD4680
		   
		   ---------- GPO ----------
		   pwm_fan              : out std_logic;                     -- J2.30 FPGA PIN T4 
		   pwm_buff_en          : out std_logic;                     -- J2.28 FPGA PIN P5
		   pwm_out              : out std_logic_vector(1 to 64);     -- For now, give all transducers the same PWM signal to integrate project previous behavior with new additions (18bit ADC, 2's complement, change to Vivado and from Altera FPGA, etc.)
		   heartbeat_led        : out std_logic;                     -- J1.28 FPGA PIN A4 heartbeat LED for ARTIX-7. For now, just make it high for even numbered states, excluding STATEA
		   tx_active_led        : out std_logic;                     -- J1.29 FPGA PIN D4 heartbeat LED for ARTIX-7. For now, just make it high for even numbered states, excluding STATEA
		   extra_io             : out std_logic_vector(2 downto 0);
		   
		   ---------- Ports of Axi Slave Bus Interface S00_AXI ----------
           s_axi_awaddr	 : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
           s_axi_awprot	 : in std_logic_vector(2 downto 0);
           s_axi_awvalid : in std_logic;
           s_axi_awready : out std_logic;
           s_axi_wdata	 : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
           s_axi_wstrb	 : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
           s_axi_wvalid	 : in std_logic;
           s_axi_wready	 : out std_logic;
           s_axi_bresp	 : out std_logic_vector(1 downto 0);
           s_axi_bvalid	 : out std_logic;
           s_axi_bready	 : in std_logic;
           s_axi_araddr	 : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
           s_axi_arprot	 : in std_logic_vector(2 downto 0);
           s_axi_arvalid : in std_logic;
           s_axi_arready : out std_logic;
           s_axi_rdata	 : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
           s_axi_rresp	 : out std_logic_vector(1 downto 0);
           s_axi_rvalid	 : out std_logic;
           s_axi_rready	 : in std_logic
           
		   ---------- Test Signals ----------
		   --tst_state         : out unsigned(4 downto 0);
		   --tst_cycle_counter : out unsigned(5 downto 0);
		   --tst_sdi_data      : out std_logic_vector(15 downto 0); 
           --tst_sdi_sel       : out std_logic_vector(2 downto 0);    
		   --tst_sda_reg_clr  : out std_logic;
		   --tst_counter_clr  : out std_logic;
           --tst_en_buff      : out std_logic;
           --tst_shift_en     : out std_logic;
		   --tst_counter_done : out std_logic;
		   --tst_sdoa_data : out std_logic_vector(15 downto 0);
           --tst_sdob_data : out std_logic_vector(15 downto 0);
           --tst_adc_audio_data : out std_logic_vector(15 downto 0);
           --tst_adc_audio_data_conv : out std_logic_vector(15 downto 0);
           --tst_adc_data_bram_out : out std_logic_vector(15 downto 0)
		   );
end serial_adc_pwm_top;

architecture RTL of serial_adc_pwm_top is

-- Internal signal nets for handshaking between fsm, datapath
signal adc_en_int               : std_logic := '0';
signal rom_strobe_int           : std_logic := '0';
signal counter_done_int         : std_logic := '1';
signal state_int                : unsigned(4 downto 0) := to_unsigned(0, 5);
signal sdi_sel_int              : std_logic_vector(2 downto 0) := "000";
signal sda_reg_clr_int          : std_logic := '0';
signal gpio_level_int           : std_logic := '0'; 
signal fifo_full_int            : std_logic := '0';
signal flag_int                 : std_logic := '0';
signal shiftreg_clr_int         : std_logic := '0';
signal flag_ack_int             : std_logic := '0';
signal fan_pwm_en_int           : std_logic := '1'; -- these signals are simply anded with the enable bit from the axi registers to provide some sync with the FSM
signal tx_active_pwm_en_int     : std_logic := '1';
signal heartbeat_pwm_en_int     : std_logic := '1';
signal reg_read_int             : std_logic := '0'; 
signal en_int                   : std_logic := '0';
signal reconfig_int             : std_logic := '0';
signal rom_trig_int             : std_logic := '0';

----- Datapath -----
component serial_adc_pwm_datapath is
	Port( 
	      ---------- Datapath System Input Ports ----------
	      clk_fast             : in std_logic;					   -- 100MHz system cock input for compare match timer and other synchronous events
	      clk_slow             : in std_logic;					   -- 40MHz input from PLL for serial comms
		  rstn                 : in std_logic;                   -- System active low rst for axi
		  
		  ---------- Datapath Control Inputs From FSM ----------
		  adc_en 	           : in std_logic; 					    -- From FSM depending on SPI control input (keeping this enabled causes cs to toggle every cycle as the compare match timer will autoclear with the loaded compare value from the LUT)
          rom_strobe           : in std_logic;                      -- clk in the new address to the ROM/LUTs
          sdi_sel              : in std_logic_vector(2 downto 0);
          sda_reg_clr          : in std_logic;
          gpio_level           : in std_logic;  
          flag_ack             : in std_logic;
          shiftreg_clr         : in std_logic;
          fan_pwm_en           : in std_logic;
          tx_active_pwm_en     : in std_logic;
          heartbeat_pwm_en     : in std_logic;
          rom_trig             : in std_logic;
          state                : in unsigned(4 downto 0);
          
          ---------- Datapath Control Outputs to FSM ----------
          counter_done         : out std_logic;
          fifo_full            : out std_logic;
          flag                 : out std_logic;
          reg_read             : out std_logic;
          reconfig             : out std_logic;
          en                   : out std_logic;
          
		  ---------- Datapath Data Input From ADC ----------
		  sdoa                 : in std_logic;				        -- J2.23 FPGA PIN A3 serial input from SDOA on AD4680 (stereo:mono in)
		  sdob                 : in std_logic;					    -- J2.25 FPGA PIN V1 serial input from SDOB on AD4680 (ecm)

		  ---------- Datapath Data Output To ADC ----------
		  sdi                  : out std_logic;				        -- J2.27 FPGA PIN N5 serial output to SDI on AD4680
		  cs     	           : out std_logic; 				    -- J2.21 FPGA PIN U4 active low (idle high) CS input to adc that starts a conversion on falling edge which is ready on the following cycle
		  scl    	           : out std_logic; 				    -- J2.29 FPGA PIN T5 adc serial clock - idle high with CS. They come low together on conversion start according to the AD4680 timing diagram 
		  
		  ---------- Datapath GPIO ----------
		  pwm_out              : out std_logic_vector(1 to 64);     -- Generated PWM signal from compare match timer for transducer drive    
		  tx_active_led        : out std_logic;                     -- Drive the heartbeat signal
		  pwm_fan              : out std_logic;
		  pwm_buff_en          : out std_logic;
          heartbeat_led        : out std_logic;                    -- Drive the heartbeat signal  
          extra_io             : out std_logic_vector(2 downto 0);
          
          ------------ Axi Slave Bus Interface ----------
          s_axi_awaddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
          s_axi_awprot	: in std_logic_vector(2 downto 0);
          s_axi_awvalid	: in std_logic;
          s_axi_awready	: out std_logic;
          s_axi_wdata	: in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
          s_axi_wstrb	: in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
          s_axi_wvalid	: in std_logic;
          s_axi_wready	: out std_logic;
          s_axi_bresp	: out std_logic_vector(1 downto 0);
          s_axi_bvalid	: out std_logic;
          s_axi_bready	: in std_logic;
          s_axi_araddr	: in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
          s_axi_arprot	: in std_logic_vector(2 downto 0);
          s_axi_arvalid	: in std_logic;
          s_axi_arready	: out std_logic;
          s_axi_rdata	: out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
          s_axi_rresp   : out std_logic_vector(1 downto 0);
          s_axi_rvalid	: out std_logic;
          s_axi_rready	: in std_logic
       
          ---------- Test Signals ---------- ! REMOVE FOR SYNTHESIS RUNS... ALSO CHECK WITHIN DATAPATH AROUND SERIAL_VHDL_PERIPH AND SHIFTRAM, ALONG WITH THE OUTPUT ASSIGNMENT SECTION AND THE PORT MAP AT THE TOP OF THE FILE. ALL SIGNALS APPENDED TST_ MUST BE REMOVED, AND THERE ARE SOME EXTRAS TOO
          --tst_sdi_data      : out std_logic_vector(15 downto 0); 
          --tst_sdi_sel       : out std_logic_vector(2 downto 0);    
          --tst_cycle_counter : out unsigned(5 downto 0);
          --tst_counter_clr   : out std_logic;
          --tst_en_buff       : out std_logic;
          --tst_shift_en      : out std_logic;
          --tst_sdoa_data : out std_logic_vector(15 downto 0);
          --tst_sdob_data : out std_logic_vector(15 downto 0);
          --tst_adc_audio_data : out std_logic_vector(15 downto 0);
          --tst_adc_audio_data_conv : out std_logic_vector(15 downto 0);
          --tst_adc_data_bram_out : out std_logic_vector(15 downto 0)
          );                                            
end component;

------- FSM --------
component serial_adc_pwm_fsm is
    port( 
          -- FSM System Input Ports
          clk                  : in std_logic;            -- Main clock input (intended for system clock for fast state cycling)
          rstn                 : in std_logic;            -- System rst
          
          -- FSM Inputs
          counter_done         : in std_logic;                     -- counter_done from serial peripheral - used to advance the state machine
          fifo_full            : in std_logic;
          flag                 : in std_logic;  -- flag that channel has changed (need to empty fifo and wiat for full flag)
          reg_read             : in std_logic;
          reconfig             : in std_logic;
          en                   : in std_logic;
          
          -- FSM Outputs
          sda_reg_clr          : out std_logic;            -- Clears SDA reg... ?
		  adc_en               : out std_logic;            -- Signal to datapath for starting a conversion or 16-bit register r/w operation);
          gpio_level           : out std_logic;
		  rom_strobe           : out std_logic;            -- Strobes ROM clk for updating the LUT output based on an input addr change (counter_done goes high)  
          sdi_sel              : out std_logic_vector(2 downto 0);
          shiftreg_clr         : out std_logic;
          flag_ack             : out std_logic;
          fan_pwm_en           : out std_logic; -- these signals are simply anded with the enable bit from the axi registers to provide some sync with the FSM
          tx_active_pwm_en     : out std_logic;
          heartbeat_pwm_en     : out std_logic;
          rom_trig             : out std_logic;
          state                : out unsigned(4 downto 0) -- Internal state output for debugging purposes); -- Stores commands for configuring the ADC in any one of the possible operating modes. See below for config options.
          ); 
end component;

begin

------ Wiring ------
datapath : serial_adc_pwm_datapath port map ( 
                                              ---------- Datapath System Input Ports ----------
                                              clk_fast             => s_axi_aclk,
                                              clk_slow             => clk_serial,
                                              rstn                 => s_axi_aresetn,
                                              
                                              ---------- Datapath Control Inputs From FSM ----------
                                              adc_en               => adc_en_int,
                                              rom_strobe           => rom_strobe_int,      
                                              sdi_sel              => sdi_sel_int,   
                                              sda_reg_clr          => sda_reg_clr_int, 
                                              gpio_level           => gpio_level_int,    
                                              shiftreg_clr         => shiftreg_clr_int,
                                              flag_ack             => flag_ack_int,
                                              fan_pwm_en           => fan_pwm_en_int,
                                              tx_active_pwm_en     => tx_active_pwm_en_int,
                                              heartbeat_pwm_en     => heartbeat_pwm_en_int,
                                              rom_trig             => rom_trig_int,
                                              state                => state_int,
                                              
                                              ---------- Datapath Outputs to FSM ----------      
                                              counter_done         => counter_done_int,
                                              fifo_full            => fifo_full_int,
                                              flag                 => flag_int,
                                              reg_read             => reg_read_int,
                                              reconfig             => reconfig_int,
                                              en                   => en_int,
                                              
                                              ---------- Datapath Data Input From ADC ----------
                                              sdoa                 => sdoa,
                                              sdob                 => sdob,
                                              
                                              ---------- Datapath Data Output To ADC ----------
                                              sdi                  => sdi,
                                              cs                   => cs,
                                              scl                  => scl,
                                              
                                              ---------- Datapath GPIO ----------
                                              pwm_out              => pwm_out,
                                              tx_active_led        => tx_active_led,
                                              pwm_fan              => pwm_fan,
                                              pwm_buff_en          => pwm_buff_en,
                                              heartbeat_led        => heartbeat_led,
                                              extra_io             => extra_io,
                                              
                                              ------------ Axi Slave Bus Interface ----------
                                              s_axi_awaddr	=> s_axi_awaddr,
                                              s_axi_awprot	=> s_axi_awprot,
                                              s_axi_awvalid	=> s_axi_awvalid,
                                              s_axi_awready	=> s_axi_awready,
                                              s_axi_wdata	=> s_axi_wdata,
                                              s_axi_wstrb	=> s_axi_wstrb,
                                              s_axi_wvalid	=> s_axi_wvalid,
                                              s_axi_wready	=> s_axi_wready,
                                              s_axi_bresp   => s_axi_bresp,
                                              s_axi_bvalid	=> s_axi_bvalid,
                                              s_axi_bready	=> s_axi_bready,
                                              s_axi_araddr	=> s_axi_araddr,
                                              s_axi_arprot	=> s_axi_arprot,
                                              s_axi_arvalid	=> s_axi_arvalid,
                                              s_axi_arready	=> s_axi_arready,
                                              s_axi_rdata	=> s_axi_rdata,
                                              s_axi_rresp   => s_axi_rresp,
                                              s_axi_rvalid	=> s_axi_rvalid,
                                              s_axi_rready	=> s_axi_rready
                                              
                                              ---------- Test Signals ----------
                                              --tst_sdi_data            => tst_sdi_data,
                                              --tst_sdi_sel             => tst_sdi_sel,   
                                              --tst_cycle_counter       => tst_cycle_counter,
                                              --tst_counter_clr         => tst_counter_clr,
                                              --tst_en_buff             => tst_en_buff,
                                              --tst_shift_en            => tst_shift_en,
                                              --tst_sdoa_data           => tst_sdoa_data,
                                              --tst_sdob_data           => tst_sdob_data,
                                              --tst_adc_audio_data      => tst_adc_audio_data,
                                              --tst_adc_audio_data_conv => tst_adc_audio_data_conv,
                                              --tst_adc_data_bram_out   => tst_adc_data_bram_out
                                              );
                                    
fsm : serial_adc_pwm_fsm port map ( 
                                    ---------- FSM System Input Ports ----------
                                    clk                  => s_axi_aclk,
                                    rstn                 => s_axi_aresetn,
                                    
                                    ---------- FSM Inputs (from datapath) ----------
                                    counter_done         => counter_done_int,
                                    fifo_full            => fifo_full_int,
                                    flag                 => flag_int,
                                    reg_read             => reg_read_int,   -- these three signals come from the datapath, from axi register bits
                                    reconfig             => reconfig_int,
                                    en                   => en_int,
                                    
                                    ---------- FSM Outputs ----------
                                    sda_reg_clr          => sda_reg_clr_int,    
                                    adc_en               => adc_en_int,                             
                                    gpio_level           => gpio_level_int, 
                                    rom_strobe           => rom_strobe_int,
                                    sdi_sel              => sdi_sel_int,
                                    shiftreg_clr         => shiftreg_clr_int,
                                    flag_ack             => flag_ack_int,
                                    fan_pwm_en           => fan_pwm_en_int,
                                    tx_active_pwm_en     => tx_active_pwm_en_int,
                                    heartbeat_pwm_en     => heartbeat_pwm_en_int,
                                    rom_trig             => rom_trig_int,
                                    state                => state_int
                                    );

---------- Test Signals (comment out for synthesis!) ----------
--tst_state         <= state_int;
--tst_sda_reg_clr   <= sda_reg_clr_int;
--tst_counter_done  <= counter_done_int;

end RTL;