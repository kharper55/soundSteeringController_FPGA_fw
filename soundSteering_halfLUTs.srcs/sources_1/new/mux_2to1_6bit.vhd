----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 09:13:31 PM
-- Design Name: 
-- Module Name: mux_2to1_5bit - Behavioral
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

entity mux_2to1_6bit is
    Port ( input1 : in unsigned (5 downto 0);
           input2 : in unsigned (5 downto 0);
           sel    : in std_logic;
           output : out unsigned (5 downto 0) := (others => '0'));
end mux_2to1_6bit;

architecture Behavioral of mux_2to1_6bit is

begin

output <= input1 when sel = '0' else 
          input2 when sel = '1' else 
          (others => '0');

end Behavioral;
