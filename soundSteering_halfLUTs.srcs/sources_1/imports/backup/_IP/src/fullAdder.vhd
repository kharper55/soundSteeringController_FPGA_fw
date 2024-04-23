----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/22/2023 12:10:53 AM
-- Design Name: 
-- Module Name: fulladder - Behavioral
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

entity fullAdder is
    Port ( A    : in STD_LOGIC;
           B    : in STD_LOGIC;
           Cin  : in STD_LOGIC;
           Sum  : out STD_LOGIC;
           Cout : out STD_LOGIC);
end fullAdder;

architecture Behavioral of fullAdder is

begin

    sum <= A xor B xor Cin;
    Cout <= (A and B) or (A and Cin) or (B and Cin);

end Behavioral;