----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 03:22:20 PM
-- Design Name: 
-- Module Name: test_serial_adc_pwm_top - Behavioral
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

-- CREDIT TO ALL WORK ON S_AXI FOR THIS TEST BENCH IS DUE TO
-- https://github.com/frobino/axi_custom_ip_tb/blob/master/led_controller_1.0/hdl/testbench.vhd

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity test_serial_adc_pwm_top is
    generic (
        C_S_AXI_DATA_WIDTH : integer := 32;
        C_S_AXI_ADDR_WIDTH : integer := 9 
    );
end test_serial_adc_pwm_top;

architecture Behavioral of test_serial_adc_pwm_top is

    -- Sys
    signal clk_serial : std_logic := '0';
    
    -- Serial ADC signals
    signal sdoa, sdob, cs, scl, sdi : std_logic := '0';
    
    -- GPIO
    signal pwm_out       : std_logic_vector(1 to 64) := (others => '1');
    signal heartbeat_led : std_logic := '0';
    signal tx_active_led : std_logic := '0';
    signal pwm_fan       : std_logic := '0';
    signal pwm_buff_en   : std_logic := '0';
    signal extra_io      : std_logic_vector(2 downto 0) := (others => '0');
    
    -- AXI Slave signals. Not implemented in TB. Please see
    -- https://www.webpages.uidaho.edu/~jfrenzel/440/Handouts/Xilinx%20Vivado/Embedded%20Processor/axi_slave.pdf
    -- for ideas regarding a simple implementation of a test bench for the
    -- AXI bus
    signal s_axi_aclk    : std_logic := '0'; -- also serves as main clk... 100MHz
    signal s_axi_aresetn : std_logic := '0'; -- also serves as main RTL rst...
    signal s_axi_awaddr	 : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal s_axi_awprot	 : std_logic_vector(2 downto 0);
    signal s_axi_awvalid : std_logic;
    signal s_axi_awready : std_logic;
    signal s_axi_wdata	 : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal s_axi_wstrb	 : std_logic_vector((C_S_AXI_DATA_WIDTH/8)-1 downto 0);
    signal s_axi_wvalid	 : std_logic;
    signal s_axi_wready	 : std_logic;
    signal s_axi_bresp	 : std_logic_vector(1 downto 0);
    signal s_axi_bvalid  : std_logic;
    signal s_axi_bready	 : std_logic;
    signal s_axi_araddr	 : std_logic_vector(C_S_AXI_ADDR_WIDTH-1 downto 0);
    signal s_axi_arprot	 : std_logic_vector(2 downto 0);
    signal s_axi_arvalid : std_logic;
    signal s_axi_arready : std_logic;
    signal s_axi_rdata	 : std_logic_vector(C_S_AXI_DATA_WIDTH-1 downto 0);
    signal s_axi_rresp	 : std_logic_vector(1 downto 0);
    signal s_axi_rvalid	 : std_logic;
    signal s_axi_rready	 : std_logic;
    
    -- Test signals (exposed from datapath internals)
    signal tst_cycle_counter : unsigned(5 downto 0) := to_unsigned(0, 6);
    signal tst_state         : unsigned(4 downto 0) := to_unsigned(0, 5);
    signal tst_shift_en : std_logic := '0';
    signal tst_en_buff : std_logic := '0';
    signal tst_sda_reg_clr : std_logic := '0';
    signal tst_counter_done : std_logic := '0';
    signal tst_counter_clr : std_logic := '0';
    signal tst_sdi_data : std_logic_vector(15 downto 0) := (others => '0');
    signal tst_sdi_sel : std_logic_vector(2 downto 0) := (others => '0');
    
    -- Test bench consts
    Constant ClockPeriod : TIME := 10 ns;   -- 100MHz sys clk
    Constant ClockPeriod2 : TIME := 25 ns;  -- 40MHz ADC clock
    shared variable ClockCount : integer range 0 to 50_000 := 10;
    shared variable ClockCount2 : integer range 0 to 50_000 := 10;
    signal sendIt : std_logic := '0';
    signal readIt : std_logic := '0';

    component serial_adc_pwm_top is 
        generic (
            -- Width of S_AXI data bus
            C_S_AXI_DATA_WIDTH	: integer	:= 32;
            -- Width of S_AXI address bus
            C_S_AXI_ADDR_WIDTH	: integer	:= 9
        );     
	    port ( ---------- System Input Ports ----------
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
               s_axi_rready	 : in std_logic;
               
               ---------- Test Signals ----------
               tst_state            : out unsigned(4 downto 0);
               tst_cycle_counter    : out unsigned(5 downto 0);
               tst_sdi_data      : out std_logic_vector(15 downto 0); 
               tst_sdi_sel       : out std_logic_vector(2 downto 0);  
               tst_sda_reg_clr : out std_logic;
               tst_counter_clr  : out std_logic;
               tst_en_buff      : out std_logic;
               tst_shift_en     : out std_logic;
               tst_counter_done : out std_logic
	   );
    end component;       
                                                  
begin

    tb: serial_adc_pwm_top port map ( ---------- System Input Ports ----------
                                      s_axi_aclk           => s_axi_aclk,
                                      clk_serial           => clk_serial,
                                      s_axi_aresetn        => s_axi_aresetn,
                                      
                                      ---------- Serial ADC Ports ----------
                                      sdoa                 => sdoa,
                                      sdob                 => sdob,
                                      cs                   => cs,
                                      scl                  => scl,
                                      sdi                  => sdi,
                                      
                                      ---------- GPO ----------
                                      pwm_out              => pwm_out,
                                      pwm_fan              => pwm_fan,
                                      pwm_buff_en          => pwm_buff_en,
                                      heartbeat_led        => heartbeat_led,
                                      tx_active_led        => tx_active_led,
                                      extra_io             => extra_io,
                                      
                                      ---------- Ports of Axi Slave Bus Interface S00_AXI ----------
                                      s_axi_awaddr	       => s_axi_awaddr,
                                      s_axi_awprot	       => s_axi_awprot,
                                      s_axi_awvalid        => s_axi_awvalid,
                                      s_axi_awready        => s_axi_awready,
                                      s_axi_wdata	       => s_axi_wdata,
                                      s_axi_wstrb	       => s_axi_wstrb,
                                      s_axi_wvalid	       => s_axi_wvalid,
                                      s_axi_wready	       => s_axi_wready,
                                      s_axi_bresp	       => s_axi_bresp,
                                      s_axi_bvalid	       => s_axi_bvalid,
                                      s_axi_bready	       => s_axi_bready,
                                      s_axi_araddr	       => s_axi_araddr,
                                      s_axi_arprot	       => s_axi_arprot,
                                      s_axi_arvalid        => s_axi_arvalid,
                                      s_axi_arready        => s_axi_arready,
                                      s_axi_rdata	       => s_axi_rdata,
                                      s_axi_rresp	       => s_axi_rresp,
                                      s_axi_rvalid	       => s_axi_rvalid,
                                      s_axi_rready	       => s_axi_rready,
                                      
                                      ---------- Test Signals ---------- (prefixed tst_ signals are those ripped from the datapath for observation)
                                      tst_state            => tst_state,
                                      tst_cycle_counter    => tst_cycle_counter,
                                      tst_sdi_data         => tst_sdi_data,
                                      tst_sdi_sel          => tst_sdi_sel,
                                      tst_sda_reg_clr      => tst_sda_reg_clr,
                                      tst_counter_clr      => tst_counter_clr,
                                      tst_en_buff          => tst_en_buff,
                                      tst_shift_en         => tst_shift_en,
                                      tst_counter_done     => tst_counter_done
                                      );
    -- Generate S_AXI_ACLK signal
    GENERATE_SYSCLOCK : process
    begin
       wait for (ClockPeriod / 2);
       ClockCount:= ClockCount+1;
       S_AXI_ACLK <= '1';
       wait for (ClockPeriod / 2);
       S_AXI_ACLK <= '0';
    end process;
    
    -- Generate 40MHz signal
    GENERATE_SER_CLOCK : process
    begin
       wait for (ClockPeriod2 / 2);
       ClockCount2:= ClockCount2+1;
       clk_serial <= '1';
       wait for (ClockPeriod2 / 2);
       clk_serial <= '0';
    end process;
   
    -- Initiate process which simulates a master wanting to write.
    -- This process is blocked on a "Send Flag" (sendIt).
    -- When the flag goes to 1, the process exits the wait state and
    -- execute a write transaction.
    send : PROCESS
    BEGIN
    S_AXI_AWVALID<='0';
    S_AXI_WVALID<='0';
    S_AXI_BREADY<='0';
    loop
        wait until sendIt = '1';
        wait until S_AXI_ACLK= '0';
            S_AXI_AWVALID <= '1';
            S_AXI_WVALID  <= '1';
        wait until (S_AXI_AWREADY and S_AXI_WREADY) = '1';  --Client ready to read address/data        
            S_AXI_BREADY  <= '1';
        wait until S_AXI_BVALID = '1';  -- Write result valid
            assert S_AXI_BRESP = "00" report "AXI data not written" severity failure;
            S_AXI_AWVALID <= '0';
            S_AXI_WVALID  <= '0';
            S_AXI_BREADY  <= '1';
        wait until S_AXI_BVALID = '0';  -- All finished
            S_AXI_BREADY  <= '0';
    end loop;
    END PROCESS send;
    
    -- Initiate process which simulates a master wanting to read.
    -- This process is blocked on a "Read Flag" (readIt).
    -- When the flag goes to 1, the process exits the wait state and
    -- execute a read transaction.
    read : process
    begin
    S_AXI_ARVALID<='0';
    S_AXI_RREADY<='0';
        loop
            wait until readIt = '1';
            wait until S_AXI_ACLK= '0';
             S_AXI_ARVALID <= '1';
             S_AXI_RREADY  <= '1';
            wait until (S_AXI_RVALID and S_AXI_ARREADY) = '1';  --Client provided data
            assert S_AXI_RRESP = "00" report "AXI data not written" severity failure;
             S_AXI_ARVALID <= '0';
            S_AXI_RREADY   <= '0';
        end loop;
    end process read;
    
    
    -- Need to write to reg65 for adc en, this kicks of the fsm
    axi_master : process
    begin
        S_AXI_ARESETN<='0'; -- System reset
        sendIt<='0';
    wait for 15 ns;
        S_AXI_ARESETN<='1';
        S_AXI_AWADDR<="100101000";
        S_AXI_WDATA<=x"00000000";   -- do nothing
        S_AXI_WSTRB<=b"1111";
        sendIt<='1';                --Start AXI Write to Slave
        wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
    wait until S_AXI_BVALID = '1';
    wait until S_AXI_BVALID = '0';  --AXI Write finished
        S_AXI_WSTRB<=b"0000";
            
        S_AXI_AWADDR<="100101000";
        S_AXI_WDATA<=x"00000001";   -- set adc_en in fsm high
        S_AXI_WSTRB<=b"1111";
        sendIt<='1';                --Start AXI Write to Slave
        wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
    wait until S_AXI_BVALID = '1';
    wait until S_AXI_BVALID = '0';  --AXI Write finished
        S_AXI_WSTRB<=b"0000";
        
        S_AXI_AWADDR<="100101000"; -- write to dummy reg
        S_AXI_WDATA<=x"00000002";
        S_AXI_WSTRB<=b"1111";
        sendIt<='1';                --Start AXI Write to Slave
        wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
    wait until S_AXI_BVALID = '1';
    wait until S_AXI_BVALID = '0';  --AXI Write finished
        S_AXI_WSTRB<=b"0000";
        
        S_AXI_AWADDR<='1'&x"04";
        S_AXI_WDATA<=x"00000001";
        S_AXI_WSTRB<=b"1111";
        sendIt<='1';                --Start AXI Write to Slave
        wait for 1 ns; sendIt<='0'; --Clear Start Send Flag
    wait until S_AXI_BVALID = '1';
    wait until S_AXI_BVALID = '0';  --AXI Write finished
        S_AXI_WSTRB<=b"0000";
        
        S_AXI_ARADDR<=x"00"&'0';
        readIt<='1';                --Start AXI Read from Slave
        wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
    wait until S_AXI_RVALID = '1';
    wait until S_AXI_RVALID = '0';
        S_AXI_ARADDR<='1'&x"04";
        readIt<='1';                --Start AXI Read from Slave
        wait for 1 ns; readIt<='0'; --Clear "Start Read" Flag
    wait until S_AXI_RVALID = '1';
    wait until S_AXI_RVALID = '0';
        
    wait; -- will wait forever
    end process axi_master;

end Behavioral;
