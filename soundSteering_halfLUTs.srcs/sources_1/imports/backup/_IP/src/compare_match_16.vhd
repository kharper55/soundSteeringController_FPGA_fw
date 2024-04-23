library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity compare_match_16 is

	Port( clk   : in std_logic;
	      rstn  : in std_logic;
	      en    : in std_logic;
	      top   : in std_logic_vector(15 downto 0);
		  comp  : in std_logic_vector(15 downto 0);
		  match : out std_logic);
		  --counter_out  : out unsigned(15 downto 0) := (others => '0'));
		
end compare_match_16;

architecture Behavioral of compare_match_16 is

	-- signals
	signal top_reg, top_next                   : std_logic_vector(15 downto 0) := (others => '0');
	signal match_reg, match_next               : std_logic := '0';
	signal autoclear_reg, autoclear_next       : std_logic := '1';
	signal en_reg, en_next                     : std_logic := '0';
	signal comp_reg, comp_next                 : std_logic_vector(15 downto 0) := (others => '0');
	signal count                               : unsigned(15 downto 0) := to_unsigned(0, 16);
	
	-- components
	component counter_16 is
		Port( clk    : in std_logic;
			  rstn   : in std_logic;
			  clr    : in std_logic;
			  output : out unsigned(15 downto 0));	
	end component;
	
	begin	

	counter: counter_16 port map ( clk    => clk,
	                               rstn   => rstn,
								   clr    => autoclear_reg,
								   output => count);
	
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
	
	top_next <= top when count = to_unsigned(0, 16) else 
	            top_reg;
	
	en_next <= en when count = to_unsigned(0, 16) else
	           en_reg;
	
	comp_next <= comp when (count = to_unsigned(0, 32) and (unsigned(comp) < unsigned(top_reg) and unsigned(comp) < unsigned(top))) else 
	             comp_reg;
	
	match_next <= '0' when (count < (to_integer(unsigned(comp_reg) - to_unsigned(1,16)))) or autoclear_reg = '1' else
				  '1' when (count >= (to_integer(unsigned(comp_reg)) - to_unsigned(1,16))) and autoclear_reg = '0' else
				  match_reg;
					  
	autoclear_next <= '0' when not (count = unsigned(top_reg) - to_unsigned(1,16)) else
					  '1' when (count = unsigned(top_reg) - to_unsigned(1,16)) else
					  autoclear_reg;
					  
	-- Inverted the below due to hardware issues (idley driving transducers). New rev circumvents this
	match <= not match_reg when en_reg = '1' else
	         '1' when en_reg = '0' else
	         '1';
	               
	--counter_out <= count;
	
end Behavioral;







