library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity compare_match_16 is

	Port( clk          : in std_logic;
	      rst          : in std_logic;
	      en           : in std_logic;
		  comp         : in std_logic_vector(15 downto 0);
		  match        : out std_logic);
		  --counter_out  : out unsigned(15 downto 0) := (others => '0'));
		
end compare_match_16;

architecture Behavioral of compare_match_16 is

    constant PWM_TOP : unsigned(15 downto 0) := to_unsigned(2499, 16); -- this is 2499 for 40kHz rate with 100MHz clock to PWM_GEN. LUT gives values from 1 - 2498
    
	-- signals
	signal match_reg, match_next               : std_logic := '0';
	signal autoclear_reg, autoclear_next       : std_logic := '1';
	signal en_reg, en_next                     : std_logic := '0';
	signal comp_reg, comp_next                 : std_logic_vector(15 downto 0) := (others => '0');
	signal count                               : unsigned(15 downto 0) := to_unsigned(0, 16);
	
	-- components
	component counter_16 is
		Port( clk    : in std_logic;
			  rst    : in std_logic;
			  clr    : in std_logic;
			  output : out unsigned(15 downto 0));	
	end component;
	
	begin	

	counter: counter_16 port map ( clk    => clk,
	                               rst    => rst,
								   clr    => autoclear_reg,
								   output => count);
		
    process(clk, rst)
	begin
	    if rst = '1' then 
	       en_reg <= '0';
		elsif rising_edge(clk) then
		   en_reg <= en_next;
		end if;
	end process;
										
	process(clk, rst)
	begin
	    if rst = '1' then 
	       autoclear_reg <= '0';
		elsif rising_edge(clk) then
		   autoclear_reg <= autoclear_next;
		end if;
	end process;
	
	process(clk, rst)
	begin
	    if rst = '1' then 
	       match_reg <= '1'; 
		elsif rising_edge(clk) then
		   match_reg <= match_next;
		end if;	
	end process;
	
	process(clk, rst)
	begin
	    if rst = '1' then 
	       comp_reg <= (others => '0'); 
		elsif rising_edge(clk) then
		   comp_reg <= comp_next;
		end if;	
	end process;
	
	en_next <= en when count = to_unsigned(0, 16) else
	           en_reg;
	
	comp_next <= comp when count = to_unsigned(0, 16) else 
	             comp_reg;
	
	match_next <= '0' when (count < (to_integer(unsigned(comp_reg) - to_unsigned(1,16)))) or autoclear_reg = '1' else
				  '1' when (count >= (to_integer(unsigned(comp_reg)) - to_unsigned(1,16))) and autoclear_reg = '0' else
				  match_reg;
					  
	autoclear_next <= '0' when not (count = PWM_TOP - to_unsigned(1,16)) else
					  '1' when (count = PWM_TOP - to_unsigned(1,16)) else
					  autoclear_reg;
					  
	-- Inverted the below due to hardware issues (idley driving transducers). New rev circumvents this
	match <= not match_reg when en_reg = '1' else
	         '1' when en_reg = '0' else
	         '1';
	               
	--counter_out <= count;
	
end Behavioral;







