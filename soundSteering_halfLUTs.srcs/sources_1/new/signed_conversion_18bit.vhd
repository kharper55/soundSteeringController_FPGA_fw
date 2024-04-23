----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 07:45:42 PM
-- Design Name: 
-- Module Name: signed_to_unsigned_conv_18bit - Behavioral
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

entity signed_conversion_18bit is
    Port ( input            : in std_logic_vector(17 downto 0);
           output           : out std_logic_vector(17 downto 0) := (others => '0'));--;
           --tst_adder_in1    : out std_logic_vector(18 downto 0) := (others => '0');
           --tst_adder_in2    : out std_logic_vector(18 downto 0) := (others => '0');
           --tst_input_buffer : out std_logic_vector(18 downto 0));
end signed_conversion_18bit;

architecture Behavioral of signed_conversion_18bit is

constant offset_val_18bit_res : std_logic_vector(18 downto 0) := std_logic_vector(to_signed(131072, 19)); -- := "1100000000000000000";

signal carryout     : std_logic;      -- dummy for now, no output to other modules
signal sum_buffer   : std_logic_vector(18 downto 0) := (others => '0');
signal input_buffer : std_logic_vector(18 downto 0) := (others => '0');

-- made this a 19 bit adder so signed math + 131072 is doable more easily
component adder_19bit is
    Port ( num1 : in STD_LOGIC_VECTOR (18 downto 0);
           num2 : in STD_LOGIC_VECTOR (18 downto 0);
           Sum  : out STD_LOGIC_VECTOR (18 downto 0);
           Cout : out STD_LOGIC); 
end component;

begin

offset_addr_adder : adder_19bit port map ( num1 => offset_val_18bit_res(18 downto 0),
                                           num2 => input_buffer,
                                           sum  => sum_buffer,
                                           cout => carryout);                                                                           

input_buffer <= '0'&input;
                                           
output <= --not sum_buffer(17 downto 0);
          --not sum_buffer(17 downto 0) or std_logic_vector(to_unsigned(1, 18));
          --sum_buffer(17 downto 0) or std_logic_vector(to_unsigned(1, 18));
          sum_buffer(17 downto 0);
          --sum_buffer_2(17 downto 0);
          
--tst_adder_in1 <= mux_output;
--tst_adder_in2 <= input_buffer;
--tst_input_buffer <= input_buffer;

end Behavioral;
