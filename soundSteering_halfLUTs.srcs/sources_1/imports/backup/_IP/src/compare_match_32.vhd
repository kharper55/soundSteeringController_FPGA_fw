library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity compare_match_32 is

	Port( clk    : in std_logic;
	      rstn   : in std_logic;
	      en     : in std_logic;
	      top    : in std_logic_vector(31 downto 0);
		  comp   : in std_logic_vector(31 downto 0);
		  match  : out std_logic);--;
		  --counter_out  : out unsigned(31 downto 0));
		  --tst_mapped_val : out std_logic_vector(31 downto 0) := (others => '0'));
		
end compare_match_32;

architecture Behavioral of compare_match_32 is

	-- signals
	signal top_reg, top_next                   : std_logic_vector(31 downto 0) := (others => '0');
	signal match_reg, match_next               : std_logic := '0';
	signal en_reg, en_next                     : std_logic := '0';
	signal autoclear_reg, autoclear_next       : std_logic := '1';
	signal comp_reg, comp_next                 : std_logic_vector(31 downto 0) := (others => '0');
	signal count                               : unsigned(31 downto 0) := to_unsigned(0, 32);
	--signal comp                                : std_logic_vector(31 downto 0) := (others => '0');
	constant clr_int : std_logic := '0';
	
	-- components
	component counter_32 is
		Port( clk    : in std_logic;
			  rstn   : in std_logic;
			  clr    : in std_logic;
			  output : out unsigned(31 downto 0));	
	end component;
	
	begin	

	counter: counter_32 port map ( clk    => clk,
	                               rstn   => rstn,
								   clr    => autoclear_reg,
								   output => count );
	
	process(clk)
	begin
	    if rising_edge(clk) then
	       if rstn = '0' then
		      top_reg <= (others => '0');
		   else
		      top_reg <= top_next;
		   end if;
		end if;
	end process;
							   				
	process(clk)
	begin
	    if rising_edge(clk) then
		   if rstn = '0' then
		      en_reg <= '0';
		   else
		      en_reg <= en_next;
		   end if;
		end if;
	end process;
	
	process(clk)
	begin
	    if rising_edge(clk) then
		   if rstn = '0' then
		      autoclear_reg <= '0';
		   else
		      autoclear_reg <= autoclear_next;
		   end if;
		end if;
	end process;
	
	process(clk)
	begin
	    if rising_edge(clk) then
		   if rstn = '0' then
		      match_reg <= '1'; 
		   else
		      match_reg <= match_next;
		   end if;
		end if;	
	end process;
	
	process(clk)
	begin
	    if rising_edge(clk) then
		  if rstn = '0' then
		      comp_reg <= (others => '0');
		  else
		      comp_reg <= comp_next;
		  end if;
		end if;	
	end process;
	
	en_next <= en when count = to_unsigned(0, 32) else
	           en_reg;
	           
	top_next <= top when count = to_unsigned(0, 32) else 
	            top_reg;
	
	comp_next <= comp when (count = to_unsigned(0, 32) and (unsigned(comp) < unsigned(top_reg) and unsigned(comp) < unsigned(top))) else 
	             comp_reg;
	
	match_next <= '0' when (count < (to_integer(unsigned(comp_reg) - to_unsigned(1,32)))) or autoclear_reg = '1' else
				  '1' when (count >= (to_integer(unsigned(comp_reg)) - to_unsigned(1,32))) and autoclear_reg = '0' else
				  match_reg;
					  
	autoclear_next <= '0' when not (count = unsigned(top_reg) - to_unsigned(1,32)) else
					  '1' when (count = unsigned(top_reg) - to_unsigned(1,32)) else
					  autoclear_reg;
	
	match <= match_reg when en_reg = '1' else
	         '0' when en_reg = '0' else
	         '0';
	               
	--counter_out <= count;
	--tst_mapped_val <= comp;
	
end Behavioral;

