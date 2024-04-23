library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity test_shift_left_18 is
end test_shift_left_18;

architecture behavioral of test_shift_left_18 is

	component shift_left_18 is

	Port( clk      : in std_logic;
		  rst      : in std_logic;
		  input    : in std_logic;
		  shift_en : in std_logic;
		  output   : out std_logic_vector(17 downto 0) :=  (others => '0'));
			
	end component;
	
	signal clk, rst : std_logic := '0'; --initialize test clcok
	--signal input : std_logic_vector(11 downto 0) := "111111111111";
	signal input : std_logic := '1';
	signal output : std_logic_vector(17 downto 0);
	signal int_clk_cnt : unsigned (4 downto 0) := "00000";
	signal shift_en : std_logic := '1';
	
	begin
	
	tb: shift_left_18 port map (   clk => clk,
	                               rst => rst,
								   input => input,
								   shift_en => shift_en,
								   output => output);
	
	clocked: process
   begin
	
			CLK <= '0';
			wait for 10ns;
			CLK <= '1';
			wait for 10ns;

   end process;
    
   stim: process
   begin
		     int_clk_cnt <= int_clk_cnt + "00001";
			  wait for 10ns;
   end process;
	
end behavioral;