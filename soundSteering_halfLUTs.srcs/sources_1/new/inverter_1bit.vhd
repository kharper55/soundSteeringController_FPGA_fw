----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 04:51:05 PM
-- Design Name: 
-- Module Name: inverter_1bit - Behavioral
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

entity inverter_1bit is
    Port ( input  : in STD_LOGIC;
           invert : in STD_LOGIC;
           output : out STD_LOGIC);
end inverter_1bit;

architecture Behavioral of inverter_1bit is

begin

process(invert)
begin

    if invert = '1' then
        output <= not input;
    else
        output <= input;
    end if;
    
end process;
end Behavioral;
