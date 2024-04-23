----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/22/2023 12:15:48 AM
-- Design Name: 
-- Module Name: fulladderSim - Behavioral
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

entity test_fullAdder is
end test_fullAdder;


architecture Behavioral of test_fullAdder is

    signal A, B, Cin, Sum, Cout : std_logic;

    component fullAdder is
        Port ( A : in STD_LOGIC;
               B : in STD_LOGIC;
               Cin : in STD_LOGIC;
               Sum : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;

begin

    tb: fullAdder port map( A => A,
                            B => B,
                            Cin => Cin,
                            Sum => Sum,
                            Cout => Cout);
    process
    begin

        A <= '0';
        B <= '0';
        Cin <= '0';
        wait for 100ns;
        
        A <= '0';
        B <= '0';
        Cin <= '1';
        wait for 100ns;
        
        A <= '0';
        B <= '1';
        Cin <= '0';
        wait for 100ns;
        
        A <= '0';
        B <= '1';
        Cin <= '1';
        wait for 100ns;
        
        A <= '1';
        B <= '0';
        Cin <= '0';
        wait for 100ns;
        
        A <= '1';
        B <= '0';
        Cin <= '1';
        wait for 100ns;
        
        A <= '1';
        B <= '1';
        Cin <= '0';
        wait for 100ns;
        
        A <= '1';
        B <= '1';
        Cin <= '1';
        wait for 100ns;
    
        wait;
    end process;
end Behavioral;
