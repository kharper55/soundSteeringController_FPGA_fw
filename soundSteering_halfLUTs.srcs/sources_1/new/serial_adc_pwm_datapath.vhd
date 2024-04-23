----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 01:58:18 AM
-- Design Name: 
-- Module Name: serial_adc_pwm_datapath - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity serial_adc_pwm_datapath is
    generic (
		-- Width of S_AXI data bus
		C_S_AXI_DATA_WIDTH	: integer	:= 32;
		-- Width of S_AXI address bus
		C_S_AXI_ADDR_WIDTH	: integer	:= 9
	);
	Port( 
	      ---------- Datapath System Input Ports ----------
		  clk_fast             : in std_logic;					   -- 100MHz system cock input for compare match timer and other synchronous events
		  clk_slow             : in std_logic;					   -- 18MHz input from PLL for serial comms
		  rstn                 : in std_logic;                     -- AXI Slave requires active low rstn for which system is already using
		  
		  ---------- Datapath Control Inputs From FSM ----------
		  adc_en 	           : in std_logic; 					    -- From FSM depending on SPI control input (keeping this enabled causes cs to toggle every cycle as the compare match timer will autoclear with the loaded compare value from the LUT)
          rom_strobe           : in std_logic;                      -- clk in the new address to the ROM/LUTs
          sdi_sel              : in std_logic_vector(2 downto 0);
          sda_reg_clr          : in std_logic;
          gpio_level           : in std_logic;                  -- Desired level to be set on wen
          shiftreg_clr         : in std_logic;
          flag_ack             : in std_logic;
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
		  pwm_buff_en          : out std_logic;                     -- FSM decides when this can be driven high (completely tristates the PWM output to the drive board)
          heartbeat_led        : out std_logic;                     -- Drive the heartbeat signal  
          extra_io             : out std_logic_vector(2 downto 0);
          
          -- Ports of Axi Slave Bus Interface S00_AXI
          s_axi_awaddr	   : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
          s_axi_awprot	   : in std_logic_vector(2 downto 0);
          s_axi_awvalid	   : in std_logic;
          s_axi_awready	   : out std_logic;
          s_axi_wdata      : in std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
          s_axi_wstrb	   : in std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
          s_axi_wvalid	   : in std_logic;
          s_axi_wready	   : out std_logic;
          s_axi_bresp	   : out std_logic_vector(1 downto 0);
          s_axi_bvalid	   : out std_logic;
          s_axi_bready	   : in std_logic;
          s_axi_araddr	   : in std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
          s_axi_arprot	   : in std_logic_vector(2 downto 0);
          s_axi_arvalid	   : in std_logic;
          s_axi_arready	   : out std_logic;
          s_axi_rdata	   : out std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
          s_axi_rresp	   : out std_logic_vector(1 downto 0);
          s_axi_rvalid	   : out std_logic;
          s_axi_rready	   : in std_logic
       
          ---------- Datapath Test Signals ----------
          --tst_sdi_data      : out std_logic_vector(15 downto 0); 
          --tst_sdi_sel       : out std_logic_vector(2 downto 0);                      
          --tst_cycle_counter : out unsigned(5 downto 0); -- from serial periph module
          --tst_counter_clr   : out std_logic;
          --tst_en_buff       : out std_logic;
          --tst_shift_en      : out std_logic 
          );                                          
end serial_adc_pwm_datapath;

architecture Behavioral of serial_adc_pwm_datapath is

    ------------------------------------------------------------- SIGNALS ---------------------------------------------------------------------------
    
    -- Steering FIFO Signals
    signal mute : std_logic := '0'; -- from control reg
    signal addr : std_logic_vector(11 downto 0) := std_logic_vector(to_unsigned(1950, 12));
    
    -- ADC Sample 2's Complement Conversions (to unsigned linear address)
    signal signed_conv_adc : std_logic_vector(15 downto 0) := (others => '0');
    signal adc_data        : std_logic_vector(15 downto 0) := (others => '0');
	
	-- ADC Data
	signal sdoa_data, sdob_data : std_logic_vector(15 downto 0) := (others => '0');
	
	-- Compare-match PWM Outputs for audio
	signal compare_match_a, compare_match_b, compare_match_c : std_logic := '0';
	
	-- LUTs for Converted 2's Complement Sample (Addr) to PWM compare-match counts (Data out)
	signal lut_16_a : std_logic_vector(15 downto 0) := (others => '0');
	
	-- GPIO Compare Match Outputs and Control Signals
	signal pwm_raw : std_logic := '0';
	signal tx_active_compare_match : std_logic_vector(31 downto 0) := (others => '0');
	
	-- DUMMY/TEST SIGNALS
	--signal tst_shift_en_int, tst_en_buff_int, tst_counter_clr_int : std_logic := '0'; 
	
	signal mutes_buff : std_logic_vector(1 to 64) := (others => '1');
	signal inverts_buff : std_logic_vector(1 to 64) := (others => '0');
	
	-- new chan select signals
	signal i2s_data_dummy : std_logic_vector(15 downto 0) := (others => '0');
	
	constant PWM_TOP : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(1279488, 32)); -- VALUE FOR 40hz pwm + 1
	constant STEERING_DBG : std_logic_vector(11 downto 0) := std_logic_vector(to_unsigned(4095, 12));
	constant TX_ACTIVE_PWM_TOP : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(25E6, 32)); -- 40Hz base
	constant TX_ACTIVE_PWM_COMPARE_MATCH : std_logic_vector(31 downto 0)  := std_logic_vector(to_unsigned(25E5, 32)); -- set by default to 10% duty
    constant FAN_PWM_TOP : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(25E4, 32));   -- 4kHz base              -- 4kHz base
	constant FAN_PWM_COMPARE_MATCH : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(62500, 32)); -- 25% duty
	constant HEARTBEAT_PWM_TOP : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(1E9, 32)); -- 1s base
	constant HEARTBEAT_PWM_COMPARE_MATCH : std_logic_vector(31 downto 0) := std_logic_vector(to_unsigned(5E8 - 1, 32)); -- 50% duty
	constant ULTRASONIC_PWM_TOP : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(2499, 16)); -- this is 2499 for 40kHz rate with 100MHz clock to PWM_GEN. LUT gives values from 1 - 2498

	signal audio_channel_sel : std_logic_vector(1 downto 0)  := (others => '0');
	signal sdi_data          : std_logic_vector(15 downto 0) := (others => '0');
	
	signal fan_pwm_en_buff : std_logic := '0';
	signal tx_active_pwm_en_buff : std_logic := '0';
	signal heartbeat_pwm_en_buff : std_logic := '0';
	
	signal zeroes : std_logic_vector(26 downto 0) := (others => '0');
	
	-- AXI4LITE signals
	signal axi_awaddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
	signal axi_awready	: std_logic := '0';
	signal axi_wready	: std_logic := '0';
	signal axi_bresp	: std_logic_vector(1 downto 0) := (others => '0');
	signal axi_bvalid	: std_logic := '0';
	signal axi_araddr	: std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0) := (others => '0');
	signal axi_arready	: std_logic := '0';
	signal axi_rdata	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
	signal axi_rresp	: std_logic_vector(1 downto 0) := (others => '0');
	signal axi_rvalid	: std_logic := '0';
	
	-- Example-specific design signals
	constant ADDR_LSB  : integer := (C_S_AXI_DATA_WIDTH/32)+ 1;
	constant OPT_MEM_ADDR_BITS : integer := 6;
	------------------------------------------------
	---- Signals for user logic register space example
	--------------------------------------------------
	---- Number of Slave Registers 72 + 3
	---- SEE TYPEDEF IN VITIS
	signal slv_reg0	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"79E"&x"00000"; -- SYS CONTROL REG
	signal slv_reg1	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001"; -- x TRANSDUCER1_REG
	signal slv_reg2	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001"; -- x TRANSDUCER2_REG
	signal slv_reg3	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001"; -- .
	signal slv_reg4	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001"; -- .
	signal slv_reg5	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001"; -- .
	signal slv_reg6	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001"; -- Write bit 0 high to enable the transducer. Write bit 1 high in order to invert the output phase for this transducer
	signal slv_reg7	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg8	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg9	    : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg10	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg11	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg12	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg13	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg14	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg15	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg16	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg17	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg18	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg19	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg20	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg21	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg22	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg23	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg24	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg25	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg26	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg27	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg28	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg29	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg30	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg31	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg32	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg33	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg34	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg35	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg36	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg37	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg38	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg39	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg40	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg41	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg42	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg43	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg44	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg45	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg46	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg47	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg48	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg49	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg50	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg51	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg52	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg53	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg54	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg55	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg56	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg57	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg58	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg59	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg60	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001";
	signal slv_reg61	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001"; -- .
	signal slv_reg62	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001"; -- .
	signal slv_reg63	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001"; -- .
	signal slv_reg64	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := x"00000001"; -- x TRANSDUCER64_REG = TINV, TEN [1:0]
	signal slv_reg65	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others => '0'); -- x ADC_CTRL_REG 
	signal slv_reg66	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others => '0'); -- x ADC_DATA_REG = SDOA&SDOB
	signal slv_reg67	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := HEARTBEAT_PWM_TOP; -- x HEARTBEAT_TOP_REG
	signal slv_reg68	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := HEARTBEAT_PWM_COMPARE_MATCH; -- x HEARTBEAT_CM_REG
	signal slv_reg69	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := FAN_PWM_TOP; -- x FAN_TOP_REG 
	signal slv_reg70	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := FAN_PWM_COMPARE_MATCH; -- x FAN_CM_REG
	signal slv_reg71	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := TX_ACTIVE_PWM_TOP; -- x TX_ACTIVE_TOP_REG
	signal slv_reg72	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := TX_ACTIVE_PWM_COMPARE_MATCH; -- x TX_ACTIVE_CM_REG 
	signal slv_reg73	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others => '0'); -- x FSM_STATE_REG = FSM STATE(4BITS)
	signal slv_reg74	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others => '0'); -- EXTRA_REG     = NOTHING YET
	signal slv_reg_rden	: std_logic := '0';
	signal slv_reg_wren	: std_logic := '0';
	signal reg_data_out	: std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0) := (others => '0');
	signal byte_index	: integer   := 0;
	signal aw_en	    : std_logic := '0';
	
	------------------------------------------------------------- COMPONENTS ------------------------------------------------------------------------
		
	component vhdl_serial_peripheral is
        Port ( clk_slow           : in std_logic;
               clk_fast           : in std_logic;
               rstn               : in std_logic;
               en                 : in std_logic;
               sda_reg_clr        : in std_logic;
               sdi_data           : in std_logic_vector(15 downto 0);
               sdoa               : in std_logic;
               sdob               : in std_logic;
               sdi                : out std_logic;
               cs                 : out std_logic;
               scl                : out std_logic;
               sdoa_data          : out std_logic_vector(15 downto 0);
               sdob_data          : out std_logic_vector(15 downto 0);
               --cycle_counter_out  : out unsigned(5 downto 0);
               --tst_counter_clr    : out std_logic;
               --tst_en_buff        : out std_logic;
               --tst_shift_en       : out std_logic;
               counter_done       : out std_logic);
    end component;
	
    -- 16 bit LUT for ADC-PWM mapping... 2x are used (1 for SDOA, 1 for SDOB)
    -- Regenerate with enable and clock faster?
    component blk_mem_gen_0 is
	   port (
         clka      : IN STD_LOGIC;
         --rstna      : in std_logic;
         addra     : IN STD_LOGIC_VECTOR(15 DOWNTO 0);
         douta     : OUT STD_LOGIC_VECTOR(15 DOWNTO 0));
         --rstna_busy : out std_logic);
    end component;
    
    -- Compare match timer that operates on the ADC samples with a fixed top assuring 40kHz base frequency
	component compare_match_16 is
		Port( clk   : in std_logic;
              rstn  : in std_logic;
              en    : in std_logic;
              top   : in std_logic_vector(15 downto 0);
              comp  : in std_logic_vector(15 downto 0);
              match : out std_logic);
	end component;
    
    component vhdl_gpio_peripheral is
        Port ( clk   : in std_logic;          -- 100MHz clock input
               rstn  : in std_logic;          -- System rstn
               wen   : in std_logic;          -- Active high write enable (from FSM) -- not sure if i need the wen, adds complexity
               level : in std_logic;          -- The desired state of the output (from FSM)
               gpio  : out std_logic);        -- The actual gpio output
    end component;
	
	component mux_4to1_1bit is
        Port ( input1 : in STD_LOGIC;
               input2 : in STD_LOGIC;
               input3 : in STD_LOGIC;
               sel    : in STD_LOGIC_VECTOR(1 downto 0);
               output : out STD_LOGIC);
    end component;
	
	component signed_conversion_16bit is
        Port ( input  : in std_logic_vector(15 downto 0);
               output : out std_logic_vector(15 downto 0));
    end component;
    
    component shiftRAM is
    Port ( clk           : in STD_LOGIC;             -- self explanatory
           rstn          : in STD_LOGIC;             -- self explanatory
           rom_trig      : in std_logic;
           clr           : in STD_LOGIC;
           mute          : in std_logic;
           data          : in STD_LOGIC;             -- single bit pwm input data
           addr          : in STD_LOGIC_VECTOR(11 downto 0);  -- input steering coordinate from microblaze SPI (5bit AZ & 5bit EL)
           pwm           : out STD_LOGIC_VECTOR(1 to 64); -- individual pwm outputs for all transducers
           --shiftreg_out : out std_logic_vector(0 to 2500);
           mutes    : in std_logic_vector(1 to 64);  -- transducer mutes
           inverts  : in std_logic_vector(1 to 64);  -- transducer inverts for phase reversal
           full     : out std_logic); 
    end component;
    
    component shift_right_multiplier_32 is 
    Port ( clk    : in std_logic;
           rstn : in std_logic;
           clr           : in std_logic;
           data_in       : in std_logic_vector(15 downto 0);
           data_out      : out std_logic_vector(31 downto 0));
    end component;
    
    component mux_2to1_12bit is
        Port ( input1 : in STD_LOGIC_VECTOR (11 downto 0);
               input2 : in STD_LOGIC_VECTOR (11 downto 0);
               sel    : in STD_LOGIC;
               output : out STD_LOGIC_VECTOR (11 downto 0));
    end component;
    
    component compare_match_32 is 
        Port( clk    : in std_logic;
              rstn : in std_logic;
              en            : in std_logic;
              top           : in std_logic_vector(31 downto 0);
              comp          : in std_logic_vector(31 downto 0);
              match         : out std_logic);
     end component;
     
    component flag_register_2bit is
         Port( clk           : in std_logic;
               rstn          : in std_logic;
               data_in       : in std_logic_vector(1 downto 0);
               load          : in std_logic;
               flag          : out std_logic;
               data_out      : out std_logic_vector(1 downto 0));  
    end component;
    
    component mux_8to1_16bit is
        port (  input    : in std_logic_vector(2 downto 0);
                addr   : in std_logic_vector(2 downto 0);
                sel    : in std_logic_vector(2 downto 0);   -- will come from axi reg
                output : out std_logic_vector(15 downto 0));
    end component;
    
    component mux_2to1_16bit is
        port (  input1 : in std_logic_vector(15 downto 0);
                input2 : in std_logic_vector(15 downto 0);
                sel    : in std_logic;
                output : out std_logic_vector(15 downto 0));
    end component;

	------------------------------------------------------- WIRING ----------------------------------------------------------------------------------
	
	begin	

    sdi_data_mux          : mux_8to1_16bit port map ( input  => slv_reg65(8 downto 6),
                                                      addr   => slv_reg65(5 downto 3),          -- will come from axi regs
                                                      sel    => sdi_sel,    -- WHEN THIS is "111", an adc read reg performed with addr specified in addr
                                                      output => sdi_data);

    adc_serial_peripheral : vhdl_serial_peripheral port map ( clk_slow          => clk_slow,
                                                              clk_fast          => clk_fast,
                                                              rstn              => rstn,
                                                              en                => adc_en,             -- enable/conv start from fsm...
                                                              sda_reg_clr       => sda_reg_clr,
                                                              sdi_data          => sdi_data,
                                                              sdoa              => sdoa,
                                                              sdob              => sdob,
                                                              sdi               => sdi,   
                                                              cs                => cs,    
                                                              scl               => scl,       
                                                              sdoa_data         => sdoa_data,
                                                              sdob_data         => sdob_data,
                                                              --cycle_counter_out => tst_cycle_counter,
                                                              --tst_counter_clr   => tst_counter_clr,
                                                              --tst_en_buff       => tst_en_buff,
                                                              --tst_shift_en      => tst_shift_en,
                                                              counter_done      => counter_done ); 
    
    adc_chan_sel_mux : mux_2to1_16bit port map ( input1 => sdoa_data,
                                                 input2 => sdob_data,
                                                 sel    => audio_channel_sel(0),
                                                 output => adc_data );
                                                                                                                          
    addr_conversion_16 : signed_conversion_16bit port map ( input  => adc_data,
                                                            output => signed_conv_adc );
                                        
    adc_pwm_LUT_16 : blk_mem_gen_0 port map ( clka      => rom_strobe,
                                              --rstna      => rstn,
                                              addra     => signed_conv_adc,
                                              douta     => lut_16_a);
                                              --rstna_busy => open );	   
						
    audio_compare_match_timer_a : compare_match_16 port map ( clk   => clk_fast,
                                                              rstn  => rstn,
                                                              en    => '1',
                                                              top   => ULTRASONIC_PWM_TOP,
														      comp  => lut_16_a, -- mapped integer from LUT either 16 bits padded or 18 bits from LUTs aafter doing addr conversion (2's comp to unsigned)
														      match => compare_match_a );	
												
	audio_compare_match_timer_b : compare_match_16 port map ( clk   => clk_fast,
	                                                          rstn  => rstn,
	                                                          en    => '1',
	                                                          top   => ULTRASONIC_PWM_TOP,
													          comp  => i2s_data_dummy, -- mapped integer from LUT
														      match => compare_match_b );	
										
	audio_compare_match_timer_c : compare_match_16 port map ( clk   => clk_fast,
	                                                          rstn  => rstn,
	                                                          en    => '1',
	                                                          top   => ULTRASONIC_PWM_TOP,
													          comp  => slv_reg65(31 downto 16), -- mapped integer from LUT
														      match => compare_match_c );		
                                                                                                                                            
    gpio_peripheral : vhdl_gpio_peripheral port map ( clk   => clk_fast,
                                                      rstn  => rstn,
                                                      wen   => '1',
                                                      level => gpio_level,
                                                      gpio  => pwm_buff_en );    
    
    audio_pwm_chan_sel_mux : mux_4to1_1bit port map ( input1 => compare_match_a, -- sdoa/sdob from adc
                                                      input2 => compare_match_b, -- i2s
                                                      input3 => compare_match_c, -- dbg pwm compare match value
                                                      sel    => audio_channel_sel,
                                                      output => pwm_raw );                                                                                                                            
                                                                                              
    steering_peripheral : shiftRAM port map ( clk       => clk_fast,
                                              rstn      => rstn,
                                              rom_trig  => rom_trig,
                                              clr       => shiftreg_clr,
                                              mute      => slv_reg0(2),
                                              data      => pwm_raw,
                                              addr      => slv_reg0(31 downto 20),--addr_shiftRAM_int,
                                              pwm       => pwm_out,
                                              mutes     => mutes_buff,     -- active low mute bit, will eventually come from register enable bits
                                              inverts   => inverts_buff,   -- active high phase inversion bit, comes from transducer register bit n                                        
                                              full      => fifo_full ); -- to fsm!

    -- Might want to refactor these components to allow programming of the top value from here                       
    fan_compare_match_timer : compare_match_32 port map( clk    => clk_fast,
                                                         rstn   => rstn,
                                                         en     => fan_pwm_en_buff,
                                                         top    => slv_reg69,                    -- assign top and comp to 32 bit register spaces
                                                         comp   => slv_reg70,
                                                         match  => pwm_fan );
                                       
    indicator_compare_match_timer : compare_match_32 port map( clk    => clk_fast,
                                                               rstn   => rstn,
                                                               en     => tx_active_pwm_en_buff, -- assign to internal signal name and logical and with the axi register bit
                                                               top    => slv_reg71,
                                                               comp   => slv_reg72,
                                                               match  => tx_active_led );
    
    -- Add an enable for all of these compare match timeres to quickly start and stop... sync the enable such that it clears the reg contents when toggled                                           
    heartbeat_compare_match_timer : compare_match_32 port map( clk    => clk_fast,
                                                               rstn   => rstn,
                                                               en     => heartbeat_pwm_en_buff, -- assign to internal signal name and logical and with the axi register bit
                                                               top    => slv_reg67,
                                                               comp   => slv_reg68,
                                                               match  => heartbeat_led );
                                               
    pwm_scale_up : shift_right_multiplier_32 port map ( clk      => clk_fast,
                                                        rstn     => rstn,
                                                        clr      => '0',
                                                        data_in  => lut_16_a, -- possibly mux this with lut_16_b 
                                                        data_out => tx_active_compare_match );
                                                        
    audio_channel_change_alert : flag_register_2bit port map ( clk      => clk_fast,
                                                               rstn     => rstn,
                                                               data_in  => slv_reg0(1 downto 0),          -- from control reg
                                                               load     => flag_ack,         -- from fsm
                                                               flag     => flag,             -- to fsm
                                                               data_out => audio_channel_sel );
                                                               
    -- Implement axi_awready generation
	-- axi_awready is asserted for one clk_fast clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_awready is
	-- de-asserted when reset is low.
    process (clk_fast)
	begin
	  if rising_edge(clk_fast) then 
	    if rstn = '0' then
	      axi_awready <= '0';
	      aw_en <= '1';
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
	        -- slave is ready to accept write address when
	        -- there is a valid write address and write data
	        -- on the write address and data bus. This design 
	        -- expects no outstanding transactions. 
	           axi_awready <= '1';
	           aw_en <= '0';
	        elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then
	           aw_en <= '1';
	           axi_awready <= '0';
	      else
	        axi_awready <= '0';
	      end if;
	    end if;
	  end if;
	end process;

	-- Implement axi_awaddr latching
	-- This process is used to latch the address when both 
	-- S_AXI_AWVALID and S_AXI_WVALID are valid. 
	process (clk_fast)
	begin
	  if rising_edge(clk_fast) then 
	    if rstn = '0' then
	      axi_awaddr <= (others => '0');
	    else
	      if (axi_awready = '0' and S_AXI_AWVALID = '1' and S_AXI_WVALID = '1' and aw_en = '1') then
	        -- Write Address latching
	        axi_awaddr <= S_AXI_AWADDR;
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_wready generation
	-- axi_wready is asserted for one clk_fast clock cycle when both
	-- S_AXI_AWVALID and S_AXI_WVALID are asserted. axi_wready is 
	-- de-asserted when reset is low. 
	process (clk_fast)
	begin
	  if rising_edge(clk_fast) then 
	    if rstn = '0' then
	      axi_wready <= '0';
	    else
	      if (axi_wready = '0' and S_AXI_WVALID = '1' and S_AXI_AWVALID = '1' and aw_en = '1') then
	          -- slave is ready to accept write data when 
	          -- there is a valid write address and write data
	          -- on the write address and data bus. This design 
	          -- expects no outstanding transactions.           
	          axi_wready <= '1';
	      else
	        axi_wready <= '0';
	      end if;
	    end if;
	  end if;
	end process; 

	-- Implement memory mapped register select and write logic generation
	-- The write data is accepted and written to memory mapped registers when
	-- axi_awready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted. Write strobes are used to
	-- select byte enables of slave registers while writing.
	-- These registers are cleared when reset (active low) is applied.
	-- Slave register write enable is asserted when valid address and data are available
	-- and the slave is ready to accept the write address and write data.
	slv_reg_wren <= axi_wready and S_AXI_WVALID and axi_awready and S_AXI_AWVALID ;

	process (clk_fast)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0); 
	begin
	  if rising_edge(clk_fast) then 
	    if rstn = '0' then
	    -- Setup appropriate rstn bits here. ensure in agreement with initializers
	      slv_reg0 <= x"79E"&x"00038"; -- The zero steering coord corresponds to this address in BRAM due to the addressing scheme
	      slv_reg1 <= x"00000001";
	      slv_reg2 <= x"00000001";
	      slv_reg3 <= x"00000001";
	      slv_reg4 <= x"00000001";
	      slv_reg5 <= x"00000001";
	      slv_reg6 <= x"00000001";
	      slv_reg7 <= x"00000001";
	      slv_reg8 <= x"00000001";
	      slv_reg9 <= x"00000001";
	      slv_reg10 <= x"00000001";
	      slv_reg11 <= x"00000001";
	      slv_reg12 <= x"00000001";
	      slv_reg13 <= x"00000001";
	      slv_reg14 <= x"00000001";
	      slv_reg15 <= x"00000001";
	      slv_reg16 <= x"00000001";
	      slv_reg17 <= x"00000001";
	      slv_reg18 <= x"00000001";
	      slv_reg19 <= x"00000001";
	      slv_reg20 <= x"00000001";
	      slv_reg21 <= x"00000001";
	      slv_reg22 <= x"00000001";
	      slv_reg23 <= x"00000001";
	      slv_reg24 <= x"00000001";
	      slv_reg25 <= x"00000001";
	      slv_reg26 <= x"00000001";
	      slv_reg27 <= x"00000001";
	      slv_reg28 <= x"00000001";
	      slv_reg29 <= x"00000001";
	      slv_reg30 <= x"00000001";
	      slv_reg31 <= x"00000001";
	      slv_reg32 <= x"00000001";
	      slv_reg33 <= x"00000001";
	      slv_reg34 <= x"00000001";
	      slv_reg35 <= x"00000001";
	      slv_reg36 <= x"00000001";
	      slv_reg37 <= x"00000001";
	      slv_reg38 <= x"00000001";
	      slv_reg39 <= x"00000001";
	      slv_reg40 <= x"00000001";
	      slv_reg41 <= x"00000001";
	      slv_reg42 <= x"00000001";
	      slv_reg43 <= x"00000001";
	      slv_reg44 <= x"00000001";
	      slv_reg45 <= x"00000001";
	      slv_reg46 <= x"00000001";
	      slv_reg47 <= x"00000001";
	      slv_reg48 <= x"00000001";
	      slv_reg49 <= x"00000001";
	      slv_reg50 <= x"00000001";
	      slv_reg51 <= x"00000001";
	      slv_reg52 <= x"00000001";
	      slv_reg53 <= x"00000001";
	      slv_reg54 <= x"00000001";
	      slv_reg55 <= x"00000001";
	      slv_reg56 <= x"00000001";
	      slv_reg57 <= x"00000001";
	      slv_reg58 <= x"00000001";
	      slv_reg59 <= x"00000001";
	      slv_reg60 <= x"00000001";
	      slv_reg61 <= x"00000001";
	      slv_reg62 <= x"00000001";
	      slv_reg63 <= x"00000001";
	      slv_reg64 <= x"00000001";
	      slv_reg65 <= (others => '0');
	      --slv_reg66 <= (others => '0');  -- DONT WRITE TO THESE HERE! THESE ARE WRITTEN VIA DATAPATH AND READ ONLY!
	      slv_reg67 <= HEARTBEAT_PWM_TOP;
	      slv_reg68 <= HEARTBEAT_PWM_COMPARE_MATCH;
	      slv_reg69 <= FAN_PWM_TOP;
	      slv_reg70 <= FAN_PWM_COMPARE_MATCH;
	      slv_reg71 <= TX_ACTIVE_PWM_TOP;
	      slv_reg72 <= TX_ACTIVE_PWM_COMPARE_MATCH;
	      --slv_reg73 <= (others => '0');  -- DONT WRITE TO THESE HERE! THESE ARE WRITTEN VIA DATAPATH AND READ ONLY!
	      slv_reg74 <= (others => '0');
	    else
	      loc_addr := axi_awaddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	      if (slv_reg_wren = '1') then
	        case loc_addr is
	          when b"0000000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 0
	                slv_reg0(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0000001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 1
	                slv_reg1(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0000010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 2
	                slv_reg2(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0000011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 3
	                slv_reg3(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0000100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 4
	                slv_reg4(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0000101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 5
	                slv_reg5(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0000110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 6
	                slv_reg6(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0000111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 7
	                slv_reg7(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0001000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 8
	                slv_reg8(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0001001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 9
	                slv_reg9(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0001010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 10
	                slv_reg10(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0001011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 11
	                slv_reg11(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0001100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 12
	                slv_reg12(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0001101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 13
	                slv_reg13(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0001110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 14
	                slv_reg14(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0001111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 15
	                slv_reg15(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0010000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 16
	                slv_reg16(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0010001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 17
	                slv_reg17(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0010010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 18
	                slv_reg18(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0010011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 19
	                slv_reg19(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0010100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 20
	                slv_reg20(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0010101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 21
	                slv_reg21(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0010110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 22
	                slv_reg22(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0010111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 23
	                slv_reg23(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0011000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 24
	                slv_reg24(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0011001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 25
	                slv_reg25(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0011010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 26
	                slv_reg26(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0011011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 27
	                slv_reg27(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0011100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 28
	                slv_reg28(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0011101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 29
	                slv_reg29(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0011110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 30
	                slv_reg30(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0011111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 31
	                slv_reg31(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0100000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 32
	                slv_reg32(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0100001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 33
	                slv_reg33(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0100010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 34
	                slv_reg34(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0100011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 35
	                slv_reg35(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0100100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 36
	                slv_reg36(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0100101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 37
	                slv_reg37(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0100110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 38
	                slv_reg38(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0100111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 39
	                slv_reg39(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0101000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 40
	                slv_reg40(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0101001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 41
	                slv_reg41(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0101010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 42
	                slv_reg42(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0101011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 43
	                slv_reg43(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0101100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 44
	                slv_reg44(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0101101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 45
	                slv_reg45(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0101110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 46
	                slv_reg46(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0101111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 47
	                slv_reg47(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0110000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 48
	                slv_reg48(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0110001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 49
	                slv_reg49(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0110010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 50
	                slv_reg50(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0110011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 51
	                slv_reg51(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0110100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 52
	                slv_reg52(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0110101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 53
	                slv_reg53(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0110110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 54
	                slv_reg54(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0110111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 55
	                slv_reg55(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0111000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 56
	                slv_reg56(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0111001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 57
	                slv_reg57(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0111010" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 58
	                slv_reg58(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0111011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 59
	                slv_reg59(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0111100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 60
	                slv_reg60(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0111101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 61
	                slv_reg61(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0111110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 62
	                slv_reg62(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"0111111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 63
	                slv_reg63(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"1000000" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 64
	                slv_reg64(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"1000001" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 65
	                slv_reg65(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	            --66
	          --when b"1000010" => this is now part of the others case
	            --for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	            --  if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 66 (READ ONLY, ADC_DATA)
	            --    slv_reg66(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	            --  end if;
	            --end loop;
	          when b"1000011" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 67
	                slv_reg67(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"1000100" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 68
	                slv_reg68(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"1000101" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 69
	                slv_reg69(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"1000110" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 70
	                slv_reg70(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
	          when b"1000111" =>
	            for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
	              if ( S_AXI_WSTRB(byte_index) = '1' ) then
	                -- Respective byte enables are asserted as per write strobes                   
	                -- slave registor 71
	                slv_reg71(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
	              end if;
	            end loop;
              when b"1001000" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 72
                    slv_reg72(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
                -- 73
              -- when b"1001001" => this is now part of the others case
              --  for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
              --    if ( S_AXI_WSTRB(byte_index) = '1' ) then
              --      -- Respective byte enables are asserted as per write strobes                   
              --      -- slave registor 73 (READ ONLY, FSM_STATE)
              --      slv_reg73(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
              --    end if;
              --  end loop;
              when b"1001010" =>
                for byte_index in 0 to (C_S_AXI_DATA_WIDTH/8-1) loop
                  if ( S_AXI_WSTRB(byte_index) = '1' ) then
                    -- Respective byte enables are asserted as per write strobes                   
                    -- slave registor 74 (NO FUNCTION)
                    slv_reg74(byte_index*8+7 downto byte_index*8) <= S_AXI_WDATA(byte_index*8+7 downto byte_index*8);
                  end if;
                end loop;
	          when others =>
	            slv_reg0 <= slv_reg0;
	            slv_reg1 <= slv_reg1;
	            slv_reg2 <= slv_reg2;
	            slv_reg3 <= slv_reg3;
	            slv_reg4 <= slv_reg4;
	            slv_reg5 <= slv_reg5;
	            slv_reg6 <= slv_reg6;
	            slv_reg7 <= slv_reg7;
	            slv_reg8 <= slv_reg8;
	            slv_reg9 <= slv_reg9;
	            slv_reg10 <= slv_reg10;
	            slv_reg11 <= slv_reg11;
	            slv_reg12 <= slv_reg12;
	            slv_reg13 <= slv_reg13;
	            slv_reg14 <= slv_reg14;
	            slv_reg15 <= slv_reg15;
	            slv_reg16 <= slv_reg16;
	            slv_reg17 <= slv_reg17;
	            slv_reg18 <= slv_reg18;
	            slv_reg19 <= slv_reg19;
	            slv_reg20 <= slv_reg20;
	            slv_reg21 <= slv_reg21;
	            slv_reg22 <= slv_reg22;
	            slv_reg23 <= slv_reg23;
	            slv_reg24 <= slv_reg24;
	            slv_reg25 <= slv_reg25;
	            slv_reg26 <= slv_reg26;
	            slv_reg27 <= slv_reg27;
	            slv_reg28 <= slv_reg28;
	            slv_reg29 <= slv_reg29;
	            slv_reg30 <= slv_reg30;
	            slv_reg31 <= slv_reg31;
	            slv_reg32 <= slv_reg32;
	            slv_reg33 <= slv_reg33;
	            slv_reg34 <= slv_reg34;
	            slv_reg35 <= slv_reg35;
	            slv_reg36 <= slv_reg36;
	            slv_reg37 <= slv_reg37;
	            slv_reg38 <= slv_reg38;
	            slv_reg39 <= slv_reg39;
	            slv_reg40 <= slv_reg40;
	            slv_reg41 <= slv_reg41;
	            slv_reg42 <= slv_reg42;
	            slv_reg43 <= slv_reg43;
	            slv_reg44 <= slv_reg44;
	            slv_reg45 <= slv_reg45;
	            slv_reg46 <= slv_reg46;
	            slv_reg47 <= slv_reg47;
	            slv_reg48 <= slv_reg48;
	            slv_reg49 <= slv_reg49;
	            slv_reg50 <= slv_reg50;
	            slv_reg51 <= slv_reg51;
	            slv_reg52 <= slv_reg52;
	            slv_reg53 <= slv_reg53;
	            slv_reg54 <= slv_reg54;
	            slv_reg55 <= slv_reg55;
	            slv_reg56 <= slv_reg56;
	            slv_reg57 <= slv_reg57;
	            slv_reg58 <= slv_reg58;
	            slv_reg59 <= slv_reg59;
	            slv_reg60 <= slv_reg60;
	            slv_reg61 <= slv_reg61;
	            slv_reg62 <= slv_reg62;
	            slv_reg63 <= slv_reg63;
	            slv_reg64 <= slv_reg64;
	            slv_reg65 <= slv_reg65;
	            slv_reg66 <= slv_reg66;
	            slv_reg67 <= slv_reg67;
	            slv_reg68 <= slv_reg68;
	            slv_reg69 <= slv_reg69;
	            slv_reg70 <= slv_reg70;
	            slv_reg71 <= slv_reg71;
	            slv_reg72 <= slv_reg72;
	            slv_reg73 <= slv_reg73;
	            slv_reg74 <= slv_reg74;
	        end case;
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement write response logic generation
	-- The write response and response valid signals are asserted by the slave 
	-- when axi_wready, S_AXI_WVALID, axi_wready and S_AXI_WVALID are asserted.  
	-- This marks the acceptance of address and indicates the status of 
	-- write transaction.

	process (clk_fast)
	begin
	  if rising_edge(clk_fast) then 
	    if rstn = '0' then
	      axi_bvalid  <= '0';
	      axi_bresp   <= "00"; --need to work more on the responses
	    else
	      if (axi_awready = '1' and S_AXI_AWVALID = '1' and axi_wready = '1' and S_AXI_WVALID = '1' and axi_bvalid = '0'  ) then
	        axi_bvalid <= '1';
	        axi_bresp  <= "00"; 
	      elsif (S_AXI_BREADY = '1' and axi_bvalid = '1') then   --check if bready is asserted while bvalid is high)
	        axi_bvalid <= '0';                                 -- (there is a possibility that bready is always asserted high)
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_arready generation
	-- axi_arready is asserted for one clk_fast clock cycle when
	-- S_AXI_ARVALID is asserted. axi_awready is 
	-- de-asserted when reset (active low) is asserted. 
	-- The read address is also latched when S_AXI_ARVALID is 
	-- asserted. axi_araddr is reset to zero on reset assertion.

	process (clk_fast)
	begin
	  if rising_edge(clk_fast) then 
	    if rstn = '0' then
	      axi_arready <= '0';
	      axi_araddr  <= (others => '1');
	    else
	      if (axi_arready = '0' and S_AXI_ARVALID = '1') then
	        -- indicates that the slave has acceped the valid read address
	        axi_arready <= '1';
	        -- Read Address latching 
	        axi_araddr  <= S_AXI_ARADDR;           
	      else
	        axi_arready <= '0';
	      end if;
	    end if;
	  end if;                   
	end process; 

	-- Implement axi_arvalid generation
	-- axi_rvalid is asserted for one clk_fast clock cycle when both 
	-- S_AXI_ARVALID and axi_arready are asserted. The slave registers 
	-- data are available on the axi_rdata bus at this instance. The 
	-- assertion of axi_rvalid marks the validity of read data on the 
	-- bus and axi_rresp indicates the status of read transaction.axi_rvalid 
	-- is deasserted on reset (active low). axi_rresp and axi_rdata are 
	-- cleared to zero on reset (active low).  
	process (clk_fast)
	begin
	  if rising_edge(clk_fast) then
	    if rstn = '0' then
	      axi_rvalid <= '0';
	      axi_rresp  <= "00";
	    else
	      if (axi_arready = '1' and S_AXI_ARVALID = '1' and axi_rvalid = '0') then
	        -- Valid read data is available at the read data bus
	        axi_rvalid <= '1';
	        axi_rresp  <= "00"; -- 'OKAY' response
	      elsif (axi_rvalid = '1' and S_AXI_RREADY = '1') then
	        -- Read data is accepted by the master
	        axi_rvalid <= '0';
	      end if;            
	    end if;
	  end if;
	end process;

	-- Implement memory mapped register select and read logic generation
	-- Slave register read enable is asserted when valid address is available
	-- and the slave is ready to accept the read address.
	slv_reg_rden <= axi_arready and S_AXI_ARVALID and (not axi_rvalid) ;

	process (slv_reg0, slv_reg1, slv_reg2, slv_reg3, slv_reg4, slv_reg5, slv_reg6, slv_reg7, slv_reg8, slv_reg9, slv_reg10, slv_reg11, slv_reg12, slv_reg13, slv_reg14, slv_reg15, slv_reg16, slv_reg17, slv_reg18, slv_reg19, slv_reg20, slv_reg21, slv_reg22, slv_reg23, slv_reg24, slv_reg25, slv_reg26, slv_reg27, slv_reg28, slv_reg29, slv_reg30, slv_reg31, slv_reg32, slv_reg33, slv_reg34, slv_reg35, slv_reg36, slv_reg37, slv_reg38, slv_reg39, slv_reg40, slv_reg41, slv_reg42, slv_reg43, slv_reg44, slv_reg45, slv_reg46, slv_reg47, slv_reg48, slv_reg49, slv_reg50, slv_reg51, slv_reg52, slv_reg53, slv_reg54, slv_reg55, slv_reg56, slv_reg57, slv_reg58, slv_reg59, slv_reg60, slv_reg61, slv_reg62, slv_reg63, slv_reg64, slv_reg65, slv_reg66, slv_reg67, slv_reg68, slv_reg69, slv_reg70, slv_reg71, slv_reg72, slv_reg73, slv_reg74, axi_araddr, rstn, slv_reg_rden)
	variable loc_addr :std_logic_vector(OPT_MEM_ADDR_BITS downto 0);
	begin
	    -- Address decoding for reading registers
	    loc_addr := axi_araddr(ADDR_LSB + OPT_MEM_ADDR_BITS downto ADDR_LSB);
	    case loc_addr is
	      when b"0000000" =>
	        reg_data_out <= slv_reg0;
	      when b"0000001" =>
	        reg_data_out <= slv_reg1;
	      when b"0000010" =>
	        reg_data_out <= slv_reg2;
	      when b"0000011" =>
	        reg_data_out <= slv_reg3;
	      when b"0000100" =>
	        reg_data_out <= slv_reg4;
	      when b"0000101" =>
	        reg_data_out <= slv_reg5;
	      when b"0000110" =>
	        reg_data_out <= slv_reg6;
	      when b"0000111" =>
	        reg_data_out <= slv_reg7;
	      when b"0001000" =>
	        reg_data_out <= slv_reg8;
	      when b"0001001" =>
	        reg_data_out <= slv_reg9;
	      when b"0001010" =>
	        reg_data_out <= slv_reg10;
	      when b"0001011" =>
	        reg_data_out <= slv_reg11;
	      when b"0001100" =>
	        reg_data_out <= slv_reg12;
	      when b"0001101" =>
	        reg_data_out <= slv_reg13;
	      when b"0001110" =>
	        reg_data_out <= slv_reg14;
	      when b"0001111" =>
	        reg_data_out <= slv_reg15;
	      when b"0010000" =>
	        reg_data_out <= slv_reg16;
	      when b"0010001" =>
	        reg_data_out <= slv_reg17;
	      when b"0010010" =>
	        reg_data_out <= slv_reg18;
	      when b"0010011" =>
	        reg_data_out <= slv_reg19;
	      when b"0010100" =>
	        reg_data_out <= slv_reg20;
	      when b"0010101" =>
	        reg_data_out <= slv_reg21;
	      when b"0010110" =>
	        reg_data_out <= slv_reg22;
	      when b"0010111" =>
	        reg_data_out <= slv_reg23;
	      when b"0011000" =>
	        reg_data_out <= slv_reg24;
	      when b"0011001" =>
	        reg_data_out <= slv_reg25;
	      when b"0011010" =>
	        reg_data_out <= slv_reg26;
	      when b"0011011" =>
	        reg_data_out <= slv_reg27;
	      when b"0011100" =>
	        reg_data_out <= slv_reg28;
	      when b"0011101" =>
	        reg_data_out <= slv_reg29;
	      when b"0011110" =>
	        reg_data_out <= slv_reg30;
	      when b"0011111" =>
	        reg_data_out <= slv_reg31;
	      when b"0100000" =>
	        reg_data_out <= slv_reg32;
	      when b"0100001" =>
	        reg_data_out <= slv_reg33;
	      when b"0100010" =>
	        reg_data_out <= slv_reg34;
	      when b"0100011" =>
	        reg_data_out <= slv_reg35;
	      when b"0100100" =>
	        reg_data_out <= slv_reg36;
	      when b"0100101" =>
	        reg_data_out <= slv_reg37;
	      when b"0100110" =>
	        reg_data_out <= slv_reg38;
	      when b"0100111" =>
	        reg_data_out <= slv_reg39;
	      when b"0101000" =>
	        reg_data_out <= slv_reg40;
	      when b"0101001" =>
	        reg_data_out <= slv_reg41;
	      when b"0101010" =>
	        reg_data_out <= slv_reg42;
	      when b"0101011" =>
	        reg_data_out <= slv_reg43;
	      when b"0101100" =>
	        reg_data_out <= slv_reg44;
	      when b"0101101" =>
	        reg_data_out <= slv_reg45;
	      when b"0101110" =>
	        reg_data_out <= slv_reg46;
	      when b"0101111" =>
	        reg_data_out <= slv_reg47;
	      when b"0110000" =>
	        reg_data_out <= slv_reg48;
	      when b"0110001" =>
	        reg_data_out <= slv_reg49;
	      when b"0110010" =>
	        reg_data_out <= slv_reg50;
	      when b"0110011" =>
	        reg_data_out <= slv_reg51;
	      when b"0110100" =>
	        reg_data_out <= slv_reg52;
	      when b"0110101" =>
	        reg_data_out <= slv_reg53;
	      when b"0110110" =>
	        reg_data_out <= slv_reg54;
	      when b"0110111" =>
	        reg_data_out <= slv_reg55;
	      when b"0111000" =>
	        reg_data_out <= slv_reg56;
	      when b"0111001" =>
	        reg_data_out <= slv_reg57;
	      when b"0111010" =>
	        reg_data_out <= slv_reg58;
	      when b"0111011" =>
	        reg_data_out <= slv_reg59;
	      when b"0111100" =>
	        reg_data_out <= slv_reg60;
	      when b"0111101" =>
	        reg_data_out <= slv_reg61;
	      when b"0111110" =>
	        reg_data_out <= slv_reg62;
	      when b"0111111" =>
	        reg_data_out <= slv_reg63;
	      when b"1000000" =>
	        reg_data_out <= slv_reg64;
	      when b"1000001" =>
	        reg_data_out <= slv_reg65;
	      when b"1000010" =>
	        reg_data_out <= slv_reg66;
	      when b"1000011" =>
	        reg_data_out <= slv_reg67;
	      when b"1000100" =>
	        reg_data_out <= slv_reg68;
	      when b"1000101" =>
	        reg_data_out <= slv_reg69;
	      when b"1000110" =>
	        reg_data_out <= slv_reg70;
	      when b"1000111" =>
	        reg_data_out <= slv_reg71;
	      when b"1001000" =>
	        reg_data_out <= slv_reg72; 
	      when b"1001001" =>
	        reg_data_out <= slv_reg73;
	      when b"1001010" =>
	        reg_data_out <= slv_reg74; 
	      when others =>
	        reg_data_out  <= (others => '0');
	    end case;
	end process; 

	-- Output register or memory read data
	process( clk_fast ) is
	begin
	  if (rising_edge (clk_fast)) then
	    if ( rstn = '0' ) then
	      axi_rdata  <= (others => '0');
	    else
	      if (slv_reg_rden = '1') then
	        -- When there is a valid read address (S_AXI_ARVALID) with 
	        -- acceptance of read address by the slave (axi_arready), 
	        -- output the read dada 
	        -- Read address mux
	          axi_rdata <= reg_data_out;     -- register read data
	      end if;   
	    end if;
	  end if;
	end process;                                                       
    
    -- Output Assignments
    extra_io <= "000";  -- No functionality for now
    
    fan_pwm_en_buff       <= fan_pwm_en and slv_reg0(3);
	tx_active_pwm_en_buff <= tx_active_pwm_en and slv_reg0(4);
	heartbeat_pwm_en_buff <= heartbeat_pwm_en and slv_reg0(5);
	
	-- BIT 0 of each of the 64x transducer registers signifies whether to disable the transducers (active high)
    mutes_buff <= slv_reg1(0)&slv_reg2(0)&slv_reg3(0)&slv_reg4(0)
                  &slv_reg5(0)&slv_reg6(0)&slv_reg7(0)&slv_reg8(0)
                  &slv_reg9(0)&slv_reg10(0)&slv_reg11(0)&slv_reg12(0)
                  &slv_reg13(0)&slv_reg14(0)&slv_reg15(0)&slv_reg16(0)
                  &slv_reg17(0)&slv_reg18(0)&slv_reg19(0)&slv_reg20(0)
                  &slv_reg21(0)&slv_reg22(0)&slv_reg23(0)&slv_reg24(0)
                  &slv_reg25(0)&slv_reg26(0)&slv_reg27(0)&slv_reg28(0)
                  &slv_reg29(0)&slv_reg30(0)&slv_reg31(0)&slv_reg32(0)
                  &slv_reg33(0)&slv_reg34(0)&slv_reg35(0)&slv_reg36(0)
                  &slv_reg37(0)&slv_reg38(0)&slv_reg39(0)&slv_reg40(0)
                  &slv_reg41(0)&slv_reg42(0)&slv_reg43(0)&slv_reg44(0)
                  &slv_reg45(0)&slv_reg46(0)&slv_reg47(0)&slv_reg48(0)
                  &slv_reg49(0)&slv_reg50(0)&slv_reg51(0)&slv_reg52(0)
                  &slv_reg53(0)&slv_reg54(0)&slv_reg55(0)&slv_reg56(0)
                  &slv_reg57(0)&slv_reg58(0)&slv_reg59(0)&slv_reg60(0)
                  &slv_reg61(0)&slv_reg62(0)&slv_reg63(0)&slv_reg64(0);
    
    -- BIT 1 of each of the 64x transducer registers signifies whether to phase invert the signal for that particular transducer
    inverts_buff <= slv_reg1(1)&slv_reg2(1)&slv_reg3(1)&slv_reg4(1)
                    &slv_reg5(1)&slv_reg6(1)&slv_reg7(1)&slv_reg8(1)
                    &slv_reg9(1)&slv_reg10(1)&slv_reg11(1)&slv_reg12(1)
                    &slv_reg13(1)&slv_reg14(1)&slv_reg15(1)&slv_reg16(1)
                    &slv_reg17(1)&slv_reg18(1)&slv_reg19(1)&slv_reg20(1)
                    &slv_reg21(1)&slv_reg22(1)&slv_reg23(1)&slv_reg24(1)
                    &slv_reg25(1)&slv_reg26(1)&slv_reg27(1)&slv_reg28(1)
                    &slv_reg29(1)&slv_reg30(1)&slv_reg31(1)&slv_reg32(1)
                    &slv_reg33(1)&slv_reg34(1)&slv_reg35(1)&slv_reg36(1)
                    &slv_reg37(1)&slv_reg38(1)&slv_reg39(1)&slv_reg40(1)
                    &slv_reg41(1)&slv_reg42(1)&slv_reg43(1)&slv_reg44(1)
                    &slv_reg45(1)&slv_reg46(1)&slv_reg47(1)&slv_reg48(1)
                    &slv_reg49(1)&slv_reg50(1)&slv_reg51(1)&slv_reg52(1)
                    &slv_reg53(1)&slv_reg54(1)&slv_reg55(1)&slv_reg56(1)
                    &slv_reg57(1)&slv_reg58(1)&slv_reg59(1)&slv_reg60(1)
                    &slv_reg61(1)&slv_reg62(1)&slv_reg63(1)&slv_reg64(1);
    
    -- THESE ARE READ ONLY REGISTERS,
    -- THEIR ADDRESSED ENTRY FROM THE WRITE PROCESS OF THE FSM HAS BEEN OMITTED  
    -- Register writes     
    slv_reg66 <= sdoa_data&sdob_data;            
    slv_reg73 <= zeroes&std_logic_vector(state);
    
    -- To FSM
    reg_read  <= slv_reg65(2);
    reconfig  <= slv_reg65(1);
    en        <= slv_reg65(0);
    
    -- AXI I/O Connections assignments
	S_AXI_AWREADY <= axi_awready;
	S_AXI_WREADY  <= axi_wready;
	S_AXI_BRESP	  <= axi_bresp;
	S_AXI_BVALID  <= axi_bvalid;
	S_AXI_ARREADY <= axi_arready;
	S_AXI_RDATA	  <= axi_rdata;
	S_AXI_RRESP	  <= axi_rresp;
	S_AXI_RVALID  <= axi_rvalid;
	
    -- Test Signals
    --tst_sdi_data <= sdi_data;
    --tst_sdi_sel  <= sdi_sel;
    --tst_compare_match_a <= compare_match_a;
    --tst_signed_conv_16_a <= signed_conv_16_a;
    --tst_lut_16_a <= lut_16_a;
    
end Behavioral;