library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity test_compare_match_32 is
end test_compare_match_32;

architecture Behavioral of test_compare_match_32 is

	component compare_match_32 is

		Port( clk         : in std_logic;
		      rst         : in std_logic;
			  data        : in std_logic_vector(15 downto 0); -- value from ADC - integer mapping -- timer/counter amtch bit resets on this value
			  mute        : in std_logic;
			  match       : out std_logic;
			  counter_out : out unsigned(31 downto 0);
			  tst_mapped_val : out std_logic_vector(31 downto 0) := (others => '0'));
		
	end component;
	
	signal clk, rst : std_logic := '0'; --initialize test clcok
	signal int_clk_cnt : unsigned (31 downto 0) := x"FFFFFFFF";
	signal data : std_logic_vector(15 downto 0) := std_logic_vector(to_unsigned(12, 16));
	
	signal mute : std_logic := '0'; -- active low enable part fo counter_16
	signal match : std_logic := '0';
	signal count : unsigned(31 downto 0) := (others => '0');
	signal tst_mapped_val : std_logic_vector(31 downto 0) := (others => '0');
	
	begin		

	tb: compare_match_32 port map( clk         => clk,
	                               rst         => rst,
                                   data        => data,
                                   mute        => mute,
                                   match       => match,
                                   counter_out => count,
                                   tst_mapped_val => tst_mapped_val);
				
   clock: process
   begin
	

			CLK <= '0';
			wait for 2ns;
			CLK <= '1';
			int_clk_cnt <= int_clk_cnt + x"00000001";	
			wait for 2ns;

   end process;
    
   stim: process
   begin
	
			  if int_clk_cnt = x"00000010" then
			      mute <= '1';
				  wait for 1ns;
			  elsif int_clk_cnt = x"0000002e" then
			      mute <= '0';
			      wait for 1ns;
			  elsif int_clk_cnt = x"0000005e" then
			      data <= std_logic_vector(to_unsigned(2499, 16));
				  wait for 1ns;
		     elsif int_clk_cnt = x"00000061" then
			      data <= std_logic_vector(to_unsigned(2499, 16));--00362662
				  wait for 1ns;
		     elsif int_clk_cnt = x"00362662" then
			      data <= std_logic_vector(to_unsigned(2499, 16));
				  wait for 1ns;
		     elsif int_clk_cnt = x"00562f51" then
			      data <= std_logic_vector(to_unsigned(1000, 16));
				  wait for 1ns;--00562f51
		     elsif int_clk_cnt = x"00762f51" then
			      data <= std_logic_vector(to_unsigned(678, 16));
				  wait for 1ns;--00562f51
		     elsif int_clk_cnt = x"009d201d" then
			      data <= std_logic_vector(to_unsigned(125, 16));
				  wait for 1ns;--00562f51
             else
                wait for 1ns;
		 end if;
   end process;
	
end Behavioral;