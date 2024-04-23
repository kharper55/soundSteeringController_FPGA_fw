library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity test_counter_18 is	
end test_counter_18;

architecture Behavioral of test_counter_18 is

	component counter_18 is

	Port( clk    : in std_logic;
		  rst    : in std_logic;
		  clr    : in std_logic;  -- synchronous cl
		  output : out unsigned(17 downto 0));
		
	end component;

	-- signals here
	signal clk, clr, rst : std_logic := '0'; --initialize test clcok
	signal count : unsigned(17 downto 0) := (others => '0');
	
	signal int_clk_cnt : unsigned (7 downto 0) := "00000000";
	
	begin
	
	tb: counter_18 port map ( clk => clk,
                              rst => rst,	
                              clr => clr,
                              output => count);
									  
									  
	clock: process
   begin
	
		if int_clk_cnt < x"FF" then
			CLK <= '0';
			wait for 1ns;
			CLK <= '1';
			wait for 1ns;
		else 
			CLK <= '0';
		end if;

   end process;
    
   stim: process
   begin
	
		 if int_clk_cnt < x"FF" then
		     int_clk_cnt <= int_clk_cnt + x"1";
			  wait for 2ns;
			  if int_clk_cnt = x"40" then
				  wait for 2ns;
			  elsif int_clk_cnt = x"41" then
				  wait for 2ns;
			  elsif int_clk_cnt = x"45" then
				  clr <= '1';
				  wait for 2ns;
			  elsif (int_clk_cnt = x"46" or int_clk_cnt = x"52" or int_clk_cnt = x"49") then
				  clr <= '0';
				  wait for 2ns;
			  elsif (int_clk_cnt = x"66") then
				  rst <= '1';
				  wait for 2ns;
			  elsif (int_clk_cnt = x"82") then
				  rst <= '0';
				  wait for 2ns;
		     else
				  wait for 2ns;
			  end if;
		 else
			int_clk_cnt <= int_clk_cnt;
			wait;
		 end if;
   end process;							
									  
end Behavioral;