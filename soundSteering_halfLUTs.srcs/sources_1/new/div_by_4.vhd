----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/20/2024 09:29:38 PM
-- Design Name: 
-- Module Name: div_by_4 - Behavioral
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


entity div_by_4 is
    port ( input  : in std_logic_vector(17 downto 0);
           output : out std_logic_vector(15 downto 0));
end div_by_4;

architecture Behavioral of div_by_4 is

begin

    output <= input(17 downto 2); -- shift right by two binary digits providing an effective divide by 4

end Behavioral;
