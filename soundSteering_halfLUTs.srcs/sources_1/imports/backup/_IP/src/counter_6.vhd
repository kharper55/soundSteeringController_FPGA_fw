library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity counter_6 is

	Port( clk    : in std_logic;
	      rstn   : in std_logic;
		  clr    : in std_logic;
		  output : out unsigned(5 downto 0) := (others => '0'));	
			
end counter_6;

architecture behavioral of counter_6 is
	--signals here
	signal count_reg, count_next: unsigned(5 downto 0) := to_unsigned(0, 6);

	begin
	
	process(clk)
	begin
        if rising_edge(clk) then
           if clr = '1' or rstn = '0' then 
               count_reg <= to_unsigned(0, 6); -- synchronous clr, should stop counter at 16 or 18 depending on resolution mode, + 8 cycles for CRC enabled (seee ad4680 datasheet)
           else 
               count_reg <= count_next;
           end if;
        end if;
	end process;
	
	-- stop counter IF WE HAVENT YET CLEARED it
	-- add extra 2 cycles to meet tsclked and tcsh/tquiet specs
	count_next <= count_reg + to_unsigned(1, 6) when count_reg < to_unsigned(63, 6) ELSE
	              count_reg;
							 
	output <= count_reg;

end behavioral;