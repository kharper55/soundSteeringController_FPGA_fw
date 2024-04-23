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


entity mux_2to1_1bit is
    Port ( input1 : in STD_LOGIC;
           input2 : in STD_LOGIC;
           sel    : in STD_LOGIC;
           output : out STD_LOGIC);
end mux_2to1_1bit;

architecture Behavioral of mux_2to1_1bit is

begin

    output <= input1 when sel = '0' else
              input2 when sel = '1' else
              '1';

end Behavioral;
