----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 06:35:15 PM
-- Design Name: 
-- Module Name: mux_18_2to1 - Behavioral
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

entity mux_2to1_17bit is
    Port ( input1 : in STD_LOGIC_VECTOR (16 downto 0);
           input2 : in STD_LOGIC_VECTOR (16 downto 0);
           sel    : in STD_LOGIC;
           output : out STD_LOGIC_VECTOR (16 downto 0));
end mux_2to1_17bit;

architecture Behavioral of mux_2to1_17bit is

begin

output <= input1 when sel = '0' else
          input2 when sel = '1' else
          (others => '0');

end Behavioral;
