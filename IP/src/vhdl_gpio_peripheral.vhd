----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 11:56:31 AM
-- Design Name: 
-- Module Name: vhdl_gpio_peripheral - Behavioral
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

entity vhdl_gpio_peripheral is
    Port ( clk                  : in std_logic;          -- 100MHz clock input
           rst                  : in std_logic;          -- System rst
           wen                  : in std_logic;
           level                : in std_logic;          -- The desired state of the output
           gpio                 : out std_logic); -- Drive the heartbeat signal
end vhdl_gpio_peripheral;

architecture Behavioral of vhdl_gpio_peripheral is

signal wen_reg, wen_next : std_logic := '0';
signal level_reg, level_next : std_logic := '0';

begin

    process(clk, rst)
    begin
        if rst = '1' then
            wen_reg <= '0';
        elsif rising_edge(clk) then
            wen_reg <= wen_next;
        end if;
    end process;
    
    process(clk, rst)
    begin
        if rst = '1' then
            level_reg <= '0';
        elsif rising_edge(clk) then
            level_reg <= level_next;
        end if;
    end process;
    
    wen_next <= wen;
    level_next <= level when wen_reg = '1' else 
                  level_reg; -- only allow updates when wen has been set 
    
    gpio <= level_reg;

end Behavioral;
