----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/20/2024 10:32:19 AM
-- Design Name: 
-- Module Name: asymmetric_mux - Behavioral
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

entity asymmetric_mux is
    Port ( in_18_1  : in STD_LOGIC_VECTOR (17 downto 0);
           in_18_2  : in STD_LOGIC_VECTOR (17 downto 0);
           in_16_1  : in STD_LOGIC_VECTOR (15 downto 0);
           in_16_2  : in STD_LOGIC_VECTOR (15 downto 0);
           sel      : in STD_LOGIC;
           output_1 : out STD_LOGIC_VECTOR (17 downto 0);
           output_2 : out STD_LOGIC_VECTOR (17 downto 0));
end asymmetric_mux;

architecture Behavioral of asymmetric_mux is

begin

output_1 <= in_18_1 when sel = '0' else
            "00"&in_16_1 when sel = '1' else
            (others => '0'); 
output_2 <= in_18_2 when sel = '0' else
            "00"&in_16_2 when sel = '1' else
            (others => '0'); 

end Behavioral;
