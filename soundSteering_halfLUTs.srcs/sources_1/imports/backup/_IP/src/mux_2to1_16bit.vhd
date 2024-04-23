----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/14/2024 01:40:25 AM
-- Design Name: 
-- Module Name: mux_2to1_16bit - Behavioral
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


entity mux_2to1_16bit is
    port (  input1 : in std_logic_vector(15 downto 0);
            input2 : in std_logic_vector(15 downto 0);
            sel    : in std_logic;
            output : out std_logic_vector(15 downto 0));
end mux_2to1_16bit;

architecture Behavioral of mux_2to1_16bit is

begin

    output <= input1 when sel = '0' else
              input2;

end Behavioral;
