----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/24/2024 10:30:25 PM
-- Design Name: 
-- Module Name: shift_right_multiplier_32 - Behavioral
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

entity shift_right_multiplier_32 is
Port ( clk      : in std_logic;
       rstn     : in std_logic;
       clr      : in std_logic;
       data_in  : in std_logic_vector(15 downto 0);
       data_out : out std_logic_vector(31 downto 0));
end shift_right_multiplier_32;

architecture Behavioral of shift_right_multiplier_32 is

    signal shift_reg, shift_reg_next : std_logic_vector(31 downto 0) := (others => '0');
    constant zeroes_9 : std_logic_vector(8 downto 0) := (others => '0');
    constant zeroes_7 : std_logic_vector(6 downto 0) := (others => '0');

begin

    -- shift_reg process                                                                                        
    process(clk)
	begin
	   if rising_edge(clk) then -- changed to rising edge 04/24
	       if clr = '1' or rstn = '0' then
	           shift_reg <= (others => '0');
	       else
	           shift_reg <= shift_reg_next;
	       end if;
	   end if;
	end process;

    -- shiftreg update contents process
	shift_reg_next <= zeroes_7&data_in&zeroes_9;  -- Highest order bit gets lost off the end
	
	data_out <= shift_reg;

end Behavioral;
