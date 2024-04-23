----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/17/2024 12:26:51 PM
-- Design Name: 
-- Module Name: test_adder_18bit - Behavioral
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

entity test_adder_19bit is
end test_adder_19bit;

architecture Behavioral of test_adder_19bit is

--signal num1, num2 : STD_LOGIC_VECTOR (17 downto 0) := (others => '0');
signal num1, num2 : STD_LOGIC_VECTOR (18 downto 0) := std_logic_vector(to_signed(-139,19));
signal sum : STD_LOGIC_VECTOR(18 downto 0) := (others => '0');
signal cout : std_logic := '0';


signal clk : std_logic := '0';
signal int_clk_cnt : unsigned(31 downto 0) := to_unsigned(0, 32);

component adder_19bit is 
    Port ( num1 : in STD_LOGIC_VECTOR (18 downto 0);
           num2 : in STD_LOGIC_VECTOR (18 downto 0);
           Sum  : out STD_LOGIC_VECTOR (18 downto 0);
           Cout : out STD_LOGIC); 
end component;


begin

tb: adder_19bit port map ( num1 => num1,
                            num2 => num2,
                            sum  => sum,
                            cout => cout);

main_clock: process
begin
   clk <= '0';
   wait for 10ns;
   clk <= '1';
   int_clk_cnt <= int_clk_cnt + 1;
   wait for 10ns;
end process;                     

main_stim: process
begin
   -- write config data (adc_cmd_sel is initialized to write to config1 reg with 8xosr and res boost to 18 bit
   if int_clk_cnt = x"000E" then
      num1 <= std_logic_vector(to_signed(-169, 19));
      num2 <= std_logic_vector(to_signed(131072, 19));
      wait for 2ns;
   elsif int_clk_cnt = x"001E" then
      num1 <= std_logic_vector(to_signed(131071, 19));
      num2 <= std_logic_vector(to_signed(131072, 19));
      wait for 2ns;
   else
      wait for 2ns;
   end if;

end process;           

end Behavioral;
