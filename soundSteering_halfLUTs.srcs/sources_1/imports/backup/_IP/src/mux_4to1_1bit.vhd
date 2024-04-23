----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 06:51:31 PM
-- Design Name: 
-- Module Name: mux_2to1 - Behavioral
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


entity mux_4to1_1bit is
    Port ( input1 : in STD_LOGIC;
           input2 : in STD_LOGIC;
           input3 : in STD_LOGIC;
           sel    : in STD_LOGIC_VECTOR(1 downto 0);
           output : out STD_LOGIC);
end mux_4to1_1bit;

architecture Behavioral of mux_4to1_1bit is

begin

    output <= input1 when sel = "00" or sel = "01" else
              input2 when sel = "10" else
              input3 when sel = "11" else
              '0';

end Behavioral;
