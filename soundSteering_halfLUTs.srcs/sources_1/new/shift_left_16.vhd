library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity shift_left_16 is

	Port( clk      : in std_logic;
		  rstn     : in std_logic;
		  input    : in std_logic;
		  clr      : in std_logic;
		  shift_en : in std_logic;
		  output   : out std_logic_vector(15 downto 0) :=  (others => '0'));	
			
end shift_left_16;

architecture behavioral of shift_left_16 is

	--signals here
	signal shift_reg, shift_reg_next : std_logic_vector(15 downto 0) := (others => '0');
	
	begin
	
	process(clk)
	begin
	    if rising_edge(clk) then
		   if clr = '1' or rstn = '0' then
	          shift_reg <= (others => '0');
	       else
		      shift_reg <= shift_reg_next;
		   end if;
		end if;
		
	end process;
	
	-- shift all bits one index left and shift in new serial data to the LSB
	shift_reg_next <= shift_reg(14 downto 0)&input when (shift_en = '1') else 
					  shift_reg;
					  	
	output <= shift_reg;
	
end behavioral;