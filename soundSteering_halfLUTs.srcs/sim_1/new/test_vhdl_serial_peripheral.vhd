----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/16/2024 03:01:39 PM
-- Design Name: 
-- Module Name: test_vhdl_serial_peripheral - Behavioral
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

entity test_vhdl_serial_peripheral is
end test_vhdl_serial_peripheral;

architecture Behavioral of test_vhdl_serial_peripheral is

    --signals
    signal clk_slow, clk_fast, en : std_logic := '0';
    signal rstn : std_logic := '1';
    signal sdi_data : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(21845,16)); -- send hex 5's (alternating 1's) as test data
    signal sdoa_data, sdob_data : std_logic_vector(15 downto 0) := (others => '0');
    signal cycle_counter_out : unsigned(5 downto 0) := to_unsigned(0, 6);
    signal sdoa, sdob, cs, scl, sdi : std_logic := '1';
    
    signal tst_counter_clr : std_logic := '0';
    signal tst_en_buff     : std_logic := '0';
    signal tst_shift_en    : std_logic := '0';
    
    signal counter_done : std_logic := '1';
    signal sda_reg_clr : std_logic := '0';
    
    Constant ClockPeriod : TIME := 10 ns;  -- 40MHz ADC clock
    shared variable ClockCount : integer range 0 to 50_000 := 0;
    
    Constant ClockPeriod2 : TIME := 25 ns;  -- 40MHz ADC clock
    shared variable ClockCount2 : integer range 0 to 50_000 := 0;
    
    component vhdl_serial_peripheral is
    Port (     clk_slow          : in std_logic;
               clk_fast          : in std_logic;
               rstn              : in std_logic;
               en                : in std_logic;
               sda_reg_clr       : in std_logic;
               sdi_data          : in std_logic_vector(15 downto 0);
               sdoa              : in std_logic;
               sdob              : in std_logic;
               sdi               : out std_logic;
               cs                : out std_logic;
               scl               : out std_logic;
               sdoa_data         : out std_logic_vector(15 downto 0);
               sdob_data         : out std_logic_vector(15 downto 0);
               cycle_counter_out : out unsigned(5 downto 0);
               tst_counter_clr   : out std_logic;
               tst_en_buff       : out std_logic;
               tst_shift_en      : out std_logic;
               counter_done      : out std_logic);
    end component;

begin

    tb: vhdl_serial_peripheral port map ( clk_slow      => clk_slow,
                                          clk_fast      => clk_fast,
                                          rstn          => rstn,
                                          en            => en,
                                          sda_reg_clr   => sda_reg_clr,
                                          sdi_data      => sdi_data,
                                          sdoa          => sdoa,
                                          sdob          => sdob,
                                          sdi           => sdi,
                                          cs            => cs,
                                          scl           => scl,
                                          sdoa_data     => sdoa_data,
                                          sdob_data     => sdob_data,
                                          cycle_counter_out => cycle_counter_out,
                                          tst_counter_clr   => tst_counter_clr,
                                          tst_en_buff       => tst_en_buff,
                                          tst_shift_en      => tst_shift_en,
                                          counter_done      => counter_done );
    
    -- Generate 40MHz signal
    GENERATE_MAIN_CLOCK : process
    begin
       wait for (ClockPeriod / 2);
       ClockCount:= ClockCount+1;
       clk_fast <= '1';
       wait for (ClockPeriod / 2);
       clk_fast <= '0';
    end process;
    
    -- Generate axi clk 100MHz signal
    GENERATE_SER_CLOCK : process
    begin
       wait for (ClockPeriod2 / 2);
       ClockCount2:= ClockCount2+1;
       clk_slow <= '1';
       wait for (ClockPeriod2 / 2);
       clk_slow <= '0';
    end process;
    
    main_stim: process
    begin
       -- write config data (adc_cmd_sel is initialized to write to config1 reg with 8xosr and res boost to 18 bit
       if ClockCount = 3 or ClockCount = 10 then
          if ClockCount = 3 then
            rstn <= '0';
          elsif ClockCount = 10 then
            rstn <= '1';  
          end if;
          wait for (ClockPeriod / 5);
       elsif ClockCount = 14 then
          en <= '1';
          wait for (ClockPeriod / 5);
       elsif ClockCount = 24 then
          en <= '0';
          wait for (ClockPeriod / 5);
       -- read alert reg to verify status_F bit
       elsif ClockCount = 95 then
          en <= '1';
          wait for (ClockPeriod / 5);
       elsif ClockCount = 97 then
          sda_reg_clr <= '1';
          --en <= '0';
          wait for (ClockPeriod / 5); 
       elsif ClockCount = 99 then
          sda_reg_clr <= '0';
          en <= '0';
          wait for (ClockPeriod / 5);
       else
          wait for (ClockPeriod / 5);
       end if;
    
    end process;

end Behavioral;
