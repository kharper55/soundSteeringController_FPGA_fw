library IEEE;
library std;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity test_counter_5 is
end test_counter_5;

architecture behavioral of test_counter_5 is

	-- UUT here
	component counter_5 is

	Port( clk    : in std_logic;
	      rst    : in std_logic;
		  clr    : in std_logic;
		  output : out unsigned(4 downto 0) := (others => '0'));
		  
	end component;
	
	--signals here
	signal clk, rst, clr : std_logic := '0'; --initialize test clcok
	signal output : unsigned(4 downto 0);

	begin
	
	tb: counter_5 port map ( clk => clk,
                             rst => rst,
                             clr => clr,
                             output => output);				
	
   clock: process
   begin
	
			CLK <= '0';
			wait for 10ns;
			CLK <= '1';
			wait for 10ns;

   end process;
    
   stim: process
   begin
		 if output = to_unsigned(12, 5) then
		     clr <= '1';
		     wait for 1ns;
		     clr <= '0';
		 else
		     wait for 1ns;
		 end if;
   end process;
			
end behavioral;