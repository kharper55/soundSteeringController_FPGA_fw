library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity counter_5 is

	Port( clk    : in std_logic;
	      rst    : in std_logic;
		  clr    : in std_logic;
		  output : out unsigned(4 downto 0) := (others => '0'));	
			
end counter_5;

architecture behavioral of counter_5 is
	--signals here
	signal COUNT_REG, COUNT_NEXT: unsigned(4 downto 0) := to_unsigned(0, 5);

	begin
	
	process(clk, rst)
	begin
	if rst = '1' then
	   COUNT_REG <= (others => '0');
	elsif rising_edge(clk) then
	   if clr = '1' then 
	       COUNT_REG <= (others => '0'); -- synchronous clr, should stop counter at 16 or 18 depending on resolution mode, + 8 cycles for CRC enabled (seee ad4680 datasheet)
	   else 
		   COUNT_REG <= COUNT_NEXT;
	   end if;
	end if;
	end process;
	
	-- stop counter IF WE HAVENT YET CLEARED it
	-- add extra 2 cycles to meet tsclked and tcsh/tquiet specs
	COUNT_NEXT <= COUNT_REG + to_unsigned(1, 5) when COUNT_REG < to_unsigned(31, 5) ELSE
	              COUNT_REG;
							 
	output <= COUNT_REG;

end behavioral;