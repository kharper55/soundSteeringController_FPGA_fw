library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.numeric_std.all;

entity compare_match_18 is

	Port( clk          : in std_logic;
	      rst          : in std_logic;
		  comp         : in std_logic_vector(17 downto 0); -- must be less than the top val!!! value from ADC - integer mapping -- timer/counter amtch bit resets on this value
												          -- need to ensure the value of comp makes sense and is sampled at correct times with the sync output.
												          -- should maybe be updated midway between the base pwm cycle so that enough time is left for a good sample if not synced
		  mute         : in std_logic;                     -- active high mute function
		  match        : out std_logic := '0');--;
		  --counter_out  : out unsigned(17 downto 0) := (others => '0'));
		
end compare_match_18;

architecture Behavioral of compare_match_18 is

    constant PWM_TOP : unsigned(17 downto 0) := to_unsigned(2499, 18); -- this is 2499 for 40kHz rate with 100MHz clock to PWM_GEN. LUT gives values from 1 - 2498
    
	-- signals
	signal match_reg, match_next               : std_logic := '0';
	signal autoclear_reg, autoclear_next       : std_logic := '1';
	signal mute_reg, mute_next                 : std_logic := '0';
	signal comp_reg, comp_next                 : std_logic_vector(17 downto 0) := (others => '0');
	signal count                               : unsigned(17 downto 0) := (others => '0');
	
	-- components
	component counter_18 is
		Port( clk    : in std_logic;
			  rst    : in std_logic;
			  clr    : in std_logic;
			  output : out unsigned(17 downto 0));	
	end component;
	
	begin	

	counter: counter_18 port map ( clk    => clk,
	                               rst    => rst,
								   clr    => autoclear_reg,
								   output => count);
										
	process(clk, rst)
	begin
	    if rst = '1' then
	        mute_reg <= '0';
		elsif rising_edge(clk) then
			mute_reg <= mute_next;
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
	       match_reg <= '0'; 
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
	
	comp_next <= comp when count = to_unsigned(0, 16) else 
	             comp_reg;
	
	match_next <= '0' when (count < (to_integer(unsigned(comp_reg) - to_unsigned(1,18)))) or autoclear_reg = '1' else
				  '1' when (count >= (to_integer(unsigned(comp_reg)) - to_unsigned(1,18))) and autoclear_reg = '0' else
				  match_reg;
					  
	autoclear_next <= '0' when not (count = PWM_TOP - to_unsigned(1,18)) else
					  '1' when (count = PWM_TOP - to_unsigned(1,18)) else
					  autoclear_reg;
					  
	--mute_next <= '0' when ((count = PWM_TOP - to_unsigned(1,18)) and mute = '0') else
	--			 '1' when ((count = PWM_TOP - to_unsigned(1,18)) and mute = '1') else
	--			 mute_reg;
	
	mute_next <= '0' when (mute = '0' and count < to_integer(unsigned(comp_reg) - to_unsigned(1,18))) else
				 '1' when (mute = '1' and count < to_integer(unsigned(comp_reg) - to_unsigned(1,18))) else
				 mute_reg; 
				
				 		  
	--match <= match_reg and not mute_reg;
	match <= match_reg when mute_reg = '0' else
	         '0' when mute_reg = '1' else
	         '0';
	               
	--counter_out <= count;
	
end Behavioral;
































