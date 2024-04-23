library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity test_compare_match_18 is
end test_compare_match_18;

architecture Behavioral of test_compare_match_18 is

	component compare_match_18 is

		Port( clk         : in std_logic;
		      rst         : in std_logic;
			  comp        : in std_logic_vector(17 downto 0); -- value from ADC - integer mapping -- timer/counter amtch bit resets on this value
			  mute        : in std_logic;
			  match       : out std_logic;
			  counter_out : out unsigned(17 downto 0));
		
	end component;
	
	signal clk, rst : std_logic := '0'; --initialize test clcok
	signal int_clk_cnt : unsigned (7 downto 0) := "00000000";
	signal comp : std_logic_vector(17 downto 0) := std_logic_vector(to_unsigned(12, 18));
	
	signal mute : std_logic := '0'; -- active low enable part fo counter_16
	signal match : std_logic := '0';
	signal count : unsigned(17 downto 0) := (others => '0');
	
	begin		

	tb: compare_match_18 port map( clk         => clk,
	                               rst         => rst,
                                   comp        => comp,
                                   mute        => mute,
                                   match       => match,
                                   counter_out => count);
				
   clock: process
   begin
	

			CLK <= '0';
			wait for 2ns;
			CLK <= '1';
			int_clk_cnt <= int_clk_cnt + x"1";	
			wait for 2ns;

   end process;
    
   stim: process
   begin
	
			  if int_clk_cnt = x"10" then
			      mute <= '1';
				  wait for 1ns;
			  elsif int_clk_cnt = x"2e" then
			      mute <= '0';
			      wait for 1ns;
			  elsif int_clk_cnt = x"5e" then
			      comp <= std_logic_vector(to_unsigned(3, 18));
				  wait for 1ns;
		     elsif int_clk_cnt = x"61" then
			      comp <= std_logic_vector(to_unsigned(7, 18));
				  wait for 1ns;
				  else
				  wait for 1ns;
		 end if;
   end process;
	
end Behavioral;