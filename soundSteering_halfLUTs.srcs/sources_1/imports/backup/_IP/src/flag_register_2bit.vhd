library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity flag_register_2bit is

	Port( clk      : in std_logic;
	      rstn     : in std_logic;
	      data_in  : in std_logic_vector(1 downto 0);
	      load     : in std_logic;
	      flag     : out std_logic;
		  data_out : out std_logic_vector(1 downto 0));
		
end flag_register_2bit;

architecture Behavioral of flag_register_2bit is
    
    signal data_in_reg, data_in_next : std_logic_vector(1 downto 0) := (others =>'0');
    signal data_out_reg, data_out_next : std_logic_vector(1 downto 0) := (others =>'0');
    signal flag_reg, flag_next : std_logic := '0';
    
    begin
    
    process(clk)
	begin
	    if rising_edge(clk) then
	       if rstn = '0' then
	          data_in_reg <= (others => '0');
	       else
		      data_in_reg <= data_in_next;
		   end if;
		end if;
	end process;
	
	process(clk)
	begin
	    if rising_edge(clk) then
		   if rstn = '0' then
		      data_out_reg <= (others => '0');
		   else
		      data_out_reg <= data_out_next;
		   end if;
		end if;
	end process;
	
	process(clk)
	begin
	    if rising_edge(clk) then
	       if rstn = '0' then
		      flag_reg <= '0';
		   else
              flag_reg <= flag_next;
           end if;
		end if;
	end process;

    data_in_next <= data_in;
    data_out_next <= data_in_reg when load = '1' else
                     data_out_reg;
    flag_next <= '0' when data_in_reg = data_out_reg else
                 '1'; -- Flag to fsm when a change occurs
                 
    data_out <= data_out_reg;
    flag     <= flag_reg;

end Behavioral;
