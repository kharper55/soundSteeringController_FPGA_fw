library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity counter_18 is

	Port( clk    : in std_logic;
		  rst    : in std_logic;
		  clr    : in std_logic;  -- synchronous cl
		  output : out unsigned(17 downto 0));
		
end counter_18;

architecture Behavioral of counter_18 is

	-- signals
	signal counter_reg, counter_next : unsigned(17 downto 0) := (others => '0');
	-- components
	
	begin				
				
	process(clk, rst, clr)
	begin
	    if rst = '1' then          -- asynch rst
	       counter_reg <= (others => '0');
		elsif rising_edge(clk) then
		  counter_reg <= counter_next;
		end if;
		if rising_edge(clk) and (clr = '1') then
		  counter_reg <= (others => '0'); -- synchronous falling edge manual clr
		end if;
	end process;
		      
	counter_next <= (counter_reg + to_unsigned(1,18)) when clr = '0' else
	                 counter_reg;
	output <= counter_reg;
	
end Behavioral;