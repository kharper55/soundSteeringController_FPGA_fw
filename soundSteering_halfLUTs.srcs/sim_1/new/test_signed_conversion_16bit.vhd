----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/17/2024 11:46:04 AM
-- Design Name: 
-- Module Name: test_signed_conversion_18bit - Behavioral
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

entity test_signed_conversion_16bit is
end test_signed_conversion_16bit;

architecture Behavioral of test_signed_conversion_16bit is

-- signals
signal input, output : std_logic_vector(15 downto 0) := (others => '0');
signal clk : std_logic := '0';
signal int_clk_cnt : unsigned(31 downto 0) := to_unsigned(0, 32);

signal tst_adder_in1, tst_adder_in2 : std_logic_vector(18 downto 0) := (others => '0');
signal tst_input_buffer : std_logic_vector(18 downto 0) := (others => '0');

component signed_conversion_16bit
--    Port ( input  : in std_logic_vector(17 downto 0);
--           sel    : in std_logic;
--           output : out std_logic_vector(17 downto 0) := (others => '0'));
    Port ( input  : in std_logic_vector(15 downto 0);
           output : out std_logic_vector(15 downto 0) := (others => '0'));
           --tst_adder_in1: out std_logic_vector(18 downto 0) := (others => '0');
           --tst_adder_in2 : out std_logic_vector(18 downto 0) := (others => '0');
           --tst_input_buffer : out std_logic_vector(18 downto 0));
end component;

begin

--tb: signed_conversion_18bit port map ( input => input,
--                                       sel => sel,
--                                       output => output);
tb: signed_conversion_16bit port map ( input => input,
                                       output => output);


main_clock: process
begin
   clk <= '0';
   wait for 1ns;
   clk <= '1';
   int_clk_cnt <= int_clk_cnt + 1;
   wait for 1ns;
end process;


main_stim: process
begin
   -- write config data (adc_cmd_sel is initialized to write to config1 reg with 8xosr and res boost to 18 bit
   if int_clk_cnt = x"000E" then
      input <= std_logic_vector(to_signed(-32768, 16));
      wait for 2ns;
   ELSif int_clk_cnt = x"01F" then
    for i in -32768 to 32767 loop
            input <= std_logic_vector(to_signed(i, 16));
            wait for 2ns;
        end loop;
   else
      wait for 2ns;
   end if;

end process;

end Behavioral;
