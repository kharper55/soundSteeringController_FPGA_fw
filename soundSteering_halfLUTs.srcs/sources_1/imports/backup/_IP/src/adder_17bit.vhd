----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/22/2023 11:22:33 AM
-- Design Name: 
-- Module Name: adder4 - Behavioral
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

entity adder_17bit is
    Port ( num1 : in STD_LOGIC_VECTOR (16 downto 0);
           num2 : in STD_LOGIC_VECTOR (16 downto 0);
           sum  : out STD_LOGIC_VECTOR (16 downto 0);
           cout : out STD_LOGIC); 
end adder_17bit;

architecture Behavioral of adder_17bit is
    component fullAdder is
        Port ( A    : in STD_LOGIC;
               B    : in STD_LOGIC;
               Cin  : in STD_LOGIC;
               Sum  : out STD_LOGIC;
               Cout : out STD_LOGIC);
    end component;

    signal tempCin  : std_logic_vector(17 downto 0) := (others => '0');
    
begin
    
    -- predefine tempCin 
    tempCin(0) <= '0';
    
    -- 0th bit of our 4 bit adder
    b0 : fullAdder port map ( A => num1(0),
                              B => num2(0),
                              Cin => tempCin(0),
                              Sum => Sum(0),
                              Cout => tempCin(1));
                              
    b1 : fullAdder port map ( A => num1(1),
                              B => num2(1),
                              Cin => tempCin(1),
                              Sum => Sum(1),
                              Cout => tempCin(2));
    b2 : fullAdder port map ( A => num1(2),
                              B => num2(2),
                              Cin => tempCin(2),
                              Sum => Sum(2),
                              Cout => tempCin(3));

    b3 : fullAdder port map ( A => num1(3),
                              B => num2(3),
                              Cin => tempCin(3),
                              Sum => Sum(3),
                              Cout => tempCin(4));
                              
    b4 : fullAdder port map ( A => num1(4),
                              B => num2(4),
                              Cin => tempCin(4),
                              Sum => Sum(4),
                              Cout => tempCin(5));
    
    b5 : fullAdder port map ( A => num1(5),
                              B => num2(5),
                              Cin => tempCin(5),
                              Sum => Sum(5),
                              Cout => tempCin(6));
                              
    b6 : fullAdder port map ( A => num1(6),
                              B => num2(6),
                              Cin => tempCin(6),
                              Sum => Sum(6),
                              Cout => tempCin(7));
                              
    b7 : fullAdder port map ( A => num1(7),
                              B => num2(7),
                              Cin => tempCin(7),
                              Sum => Sum(7),
                              Cout => tempCin(8)); 
                              
    b8 : fullAdder port map ( A => num1(8),
                              B => num2(8),
                              Cin => tempCin(8),
                              Sum => Sum(8),
                              Cout => tempCin(9));   
    
    b9 : fullAdder port map ( A => num1(9),
                              B => num2(9),
                              Cin => tempCin(9),
                              Sum => Sum(9),
                              Cout => tempCin(10));     
    
    b10 : fullAdder port map ( A => num1(10),
                               B => num2(10),
                               Cin => tempCin(10),
                               Sum => Sum(10),
                               Cout => tempCin(11));  
    b11 : fullAdder port map ( A => num1(11),
                               B => num2(11),
                               Cin => tempCin(11),
                               Sum => Sum(11),
                               Cout => tempCin(12));
                               
    b12 : fullAdder port map ( A => num1(12),
                               B => num2(12),
                               Cin => tempCin(12),
                               Sum => Sum(12),
                               Cout => tempCin(13)); 
                               
    b13 : fullAdder port map ( A => num1(13),
                               B => num2(13),
                               Cin => tempCin(13),
                               Sum => Sum(13),
                               Cout => tempCin(14));   
                               
    b14 : fullAdder port map ( A => num1(14),
                               B => num2(14),
                               Cin => tempCin(14),
                               Sum => Sum(14),
                               Cout => tempCin(15));       
                               
    b15 : fullAdder port map ( A => num1(15),
                               B => num2(15),
                               Cin => tempCin(15),
                               Sum => Sum(15),
                               Cout => tempCin(16)); 
                              
    b16 : fullAdder port map ( A => num1(16),
                               B => num2(16),
                               Cin => tempCin(16),
                               Sum => Sum(16),
                               Cout => tempCin(17));
                                                                                      
    -- final carry out of the addition                    
    Cout <= tempCin(17);
    
end Behavioral;
