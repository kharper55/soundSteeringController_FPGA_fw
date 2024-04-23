----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 06:08:11 PM
-- Design Name: 
-- Module Name: test_inverter_64bit - Behavioral
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

entity test_inverter_64bit is
end test_inverter_64bit;

architecture Behavioral of test_inverter_64bit is

    signal mask_int, input_int, output_int : std_logic_vector(1 to 64) := (others => '0');
    signal int_clk : std_logic := '0';
    signal int_clk_cnt : unsigned(31 downto 0) := to_unsigned(0, 32);

    component inverter_64bit is
      Port ( mask   : in std_logic_vector(1 to 64);
             input  : in std_logic_vector(1 to 64); 
             output : out std_logic_vector(1 to 64));
    end component;

begin

    tb: inverter_64bit port map ( mask   => mask_int,
                                  input  => input_int,
                                  output => output_int );
                                  
    main_clock: process
    begin
       int_clk <= '0';
       wait for 1ns;
       int_clk <= '1';
       int_clk_cnt <= int_clk_cnt + 1;
       wait for 1ns;
    end process;
    
    main_stim: process
    begin
       -- write config data (adc_cmd_sel is initialized to write to config1 reg with 8xosr and res boost to 18 bit
       if int_clk_cnt = x"0000000E" then
          mask_int <= x"0000001100000000";
          wait for 2ns;
       elsif int_clk_cnt = x"00000018" then
          mask_int <= x"1000000000000010";
          wait for 2ns;  
       else
          mask_int <= x"1010101010101010";
          wait for 2ns;
       end if;
    end process;

end Behavioral;
