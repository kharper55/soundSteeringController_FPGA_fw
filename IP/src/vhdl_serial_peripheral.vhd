----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 09:49:09 PM
-- Design Name: 
-- Module Name: serial_io - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity vhdl_serial_peripheral is
    Port ( clk             : in std_logic;
           rst             : in std_logic;
           en              : in std_logic;
           sda_reg_clr     : in std_logic;
           sdi_data        : in std_logic_vector(15 downto 0);
           sdoa            : in std_logic;
           sdob            : in std_logic;
           sdi             : out std_logic := '0';
           cs              : out std_logic := '1';
           scl             : out std_logic := '1';
           sdoa_rx_data    : out std_logic_vector(15 downto 0);
           sdob_rx_data    : out std_logic_vector(15 downto 0);
           --counter_out     : out unsigned(5 downto 0);
           --tst_counter_clr : out std_logic := '0';
           --tst_en_buff     : out std_logic := '0';
           --tst_shift_en    : out std_logic := '0';
           counter_done    : out std_logic := '1');
end vhdl_serial_peripheral;

architecture Behavioral of vhdl_serial_peripheral is

-- Cycle length timing specs (1uS @ 40MHz)
constant cycle_length                   : unsigned(5 downto 0) := to_unsigned(37, 6); -- add 21 or 22 clock cycles to meet timing specs

-- 18 bit shift register
signal shift_reg0_out, shift_reg1_out : std_logic_vector(15 downto 0) := (others => '0');

-- 5 bit cycle counter
signal counter_value                  : unsigned(5 downto 0) := to_unsigned(0, 6);

-- internal regs
signal sdi_data_reg, sdi_data_next    : std_logic_vector(15 downto 0) := (others => '0');
signal cs_reg, cs_next                : std_logic := '1';
signal sdoa_reg, sdoa_next            : std_logic_vector(15 downto 0) := (others => '0');
signal sdob_reg, sdob_next            : std_logic_vector(15 downto 0) := (others => '0');
signal sdi_reg, sdi_next              : std_logic := '0';
signal autoclear_reg, autoclear_next  : std_logic := '1';
signal en_buffer_reg, en_buffer_next  : std_logic := '0';
signal counter_done_reg, counter_done_next : std_logic := '1';
signal shift_en_reg, shift_en_next : std_logic := '0';
signal sda_reg_clr_buff, sda_reg_clr_buff_next : std_logic := '1';

signal shift_en_int                   : std_logic := '0';
signal cycle_length_buff              : unsigned(5 downto 0) := to_unsigned(0, 6);

--component adc_cfg_sel_mux is
--    port (  sel    : in std_logic_vector(3 downto 0);
--            output : out std_logic_vector(15 downto 0));
--end component;

component counter_6 is
    Port( clk    : in std_logic;
          rst    : in std_logic;
          clr    : in std_logic;
          output : out unsigned(5 downto 0));	
end component;

component shift_left_16 is
    Port( clk      : in std_logic;
          rst      : in std_logic;
          input    : in std_logic;
          clr      : in std_logic;
          shift_en : in std_logic;
          output   : out std_logic_vector(15 downto 0));			
end component;

component mux_2to1_6bit is
    Port ( input1 : in unsigned (5 downto 0);
           input2 : in unsigned (5 downto 0);
           sel    : in std_logic;
           output : out unsigned (5 downto 0));
end component;

begin

--adc_command_config : adc_cfg_sel_mux port map ( sel    => adc_cfg_sel,
--                                                output => serial_cmd);

cycle_counter: counter_6 port map ( clk    => clk,
                                    rst    => rst,
                                    clr    => autoclear_reg,
                                    output => counter_value);	
											 
data_shift_a: shift_left_16 port map ( clk      => clk,
                                       rst      => rst,
                                       input    => sdoa,  
                                       clr      => sda_reg_clr_buff,
                                       shift_en => shift_en_int,
                                       output   => shift_reg0_out);
        
data_shift_b: shift_left_16 port map ( clk       => clk,
                                       rst       => rst,
                                       input     => sdob,
                                       clr       => sda_reg_clr_buff,
                                       shift_en  => shift_en_int,
                                       output    => shift_reg1_out);   
    
    -- sdi_data_reg                                                                                                  
    process(clk, rst)
	begin
	   if rst = '1' then
	        sdi_data_reg <= (others => '0');
	   elsif rising_edge(clk) then
			sdi_data_reg <= sdi_data_next;
	   end if;
	end process;
                                       
    -- sdoa reg                                                                                                  
    process(clk, rst)
	begin
	   if rst = '1' then
	        sdoa_reg <= (others => '0');
	   elsif rising_edge(clk) then
			sdoa_reg <= sdoa_next;
	   end if;
	end process;
	
	-- sdob reg
	process(clk, rst)
	begin
	   if rst = '1' then
	        sdob_reg <= (others => '0');
	   elsif rising_edge(clk) then
			sdob_reg <= sdob_next;
	   end if;
	end process;
	
	-- sdi reg
	process(clk, rst)
	begin
	    if rst = '1' then
	        sdi_reg <= '0';
		elsif rising_edge(clk) then
			sdi_reg <= sdi_next;
		end if;
	end process;
	
	process(clk, rst)
	begin
	    if rst = '1' then
	        cs_reg <=  '1';
		elsif rising_edge(clk) then -- changed this from falling edge
			cs_reg <= cs_next;
		end if;
	end process;
	
	-- auto reset reg for counter
	process(clk, rst)
	begin 
	   if rst = '1' then
	       autoclear_reg <= '1';
	   elsif falling_edge(clk) then
	       autoclear_reg <= autoclear_next;
	   end if;
	end process;
	
	-- EN buffer such that every time the peripheral is enabled an entire minimum cycle is completed
	process(clk, rst)
	begin
	if rst = '1' then
	   en_buffer_reg <= '0';
	elsif rising_edge(clk) then
	   en_buffer_reg <= en_buffer_next;
	end if;
	end process;
	
	process(clk, rst)
	begin
	if rst = '1' then
	   counter_done_reg <= '1';        -- Changed this from '0'
	elsif rising_edge(clk) then
	   counter_done_reg <= counter_done_next;
	end if;
	end process;
	
	process(clk, rst)
	begin
	if rst = '1' then
	   shift_en_reg <= '0';
	elsif falling_edge(clk) then
	   shift_en_reg <= shift_en_next;
	end if;
	end process;
	
    process(clk, rst)
	begin
	if rst = '1' then
	   sda_reg_clr_buff <= '0';
	elsif rising_edge(clk) then
	   sda_reg_clr_buff <= sda_reg_clr_buff_next;
	end if;
	end process;
	
	sdi_data_next <= sdi_data when counter_done_reg = '1' else
	                 sdi_data_reg;
	
	sda_reg_clr_buff_next <= '0' when en_buffer_reg = '1' else
	                         '1' when (sda_reg_clr = '1' and en_buffer_reg = '0') else 
	                         sda_reg_clr_buff;
	
	-- Signal a bit early to FSM
	counter_done_next <= '1' when cs_reg = '1' or (counter_value = cycle_length - to_unsigned(1, 6)) else
	                     '0';
	
	cs_next <= '0' when (counter_value = to_unsigned(0, 6) and en_buffer_reg = '1') else 
			   '1' when (en_buffer_reg = '0' or (en_buffer_reg = '1' and (counter_value = cycle_length_buff + 1))) else			
			   cs_reg;		 
		
	sdoa_next <= shift_reg0_out when (counter_value = cycle_length_buff + 2) else--counter_done_reg = '1' else--(counter_value = to_unsigned(0, 5) and cs_reg = '0') else
				 sdoa_reg;		
			
					 
	sdob_next <= shift_reg1_out when (counter_value = to_unsigned(0, 6)) else--counter_done_reg = '1' else--(counter_value = to_unsigned(0, 5) and cs_reg = '0') else
				 sdob_reg;
    
    -- crucial in fsm not to set frame_width_sel prior to writing to a register on the ADC, since the else branch will never be entered
	--sdi_next <=  '0' when frame_width_sel_reg = '0' or counter_value >= cycle_length_buff else
	--             serial_cmd(to_integer(cycle_length_buff - counter_value)) when ((cs_reg = '0' or (en_buffer_reg = '1' and counter_value < cycle_length_buff)) and frame_width_sel_reg = '1') else 
	--             sdi_reg;
	sdi_next <=  '0' when counter_value >= cycle_length_buff else
	             sdi_data_reg(to_integer(cycle_length_buff - counter_value)) when (cs_reg = '0' or (en_buffer_reg = '1' and counter_value < cycle_length_buff)) else 
	             sdi_reg;
	                                
	autoclear_next <= '1' when (counter_value = cycle_length or en_buffer_reg = '0') else
	                  '0';
	                  
	en_buffer_next <= '1' when en = '1' and counter_value = to_unsigned(0, 6) else
	                  '0' when en = '0' and counter_value = cycle_length else
	                  en_buffer_reg;
	                  
	shift_en_next <= '1' when (en_buffer_reg = '1' and (counter_value > 0 and counter_value <= cycle_length_buff + 1)) else 
	                 '0' when en_buffer_reg = '0'or counter_value > cycle_length_buff + 1 else 
	                 shift_en_reg;
	                  
	-- push values to output variables (might need to readdress this clock signal...)
	scl             <= clk when (en_buffer_reg = '1' and (counter_value > to_unsigned(0, 6) and counter_value <= cycle_length_buff + 1)) else-- or (counter_value < read_cycle_length and counter_value > to_unsigned(0,5))) else
	                   '1';
	        
	sdi             <= sdi_reg;
	cs              <= cs_reg;    
    sdoa_rx_data    <= sdoa_reg;
    sdob_rx_data    <= sdob_reg;
 
    --counter_out     <= counter_value;
    
    --tst_counter_clr <= autoclear_reg;
    --tst_en_buff     <= en_buffer_reg;
    
    --/////////////// old stuff, scared to take this away
    --shift_en_int    <= not cs_reg; -- this was used in place of "cs_reg ='0'" and deemed "clk_en" and used as internal signal prior to this, espeically for sync ing reads from the sdoa sdob output serial data capture registers
    
    --shift_en_int    <= '1' when (cs_reg = '0') else
    --                   '0' when cs_reg = '1';
    --////////////////
    --shift_en_int    <= '0' when cs_reg = '1' else
    --                   '1';-- en_buffer_reg;
                       
    --shift_en_int    <= '1' when en_buffer_reg = '1' or (counter_buff_next = to_unsigned(0, 6) and not counter_buff_reg = to_unsigned(0, 6)) else -- enable shift when previous value was not 0 but current value is zero
    --                   '0';
    
    --shift_en_int    <= '1' when en_buffer_reg = '1' and (counter_buff_reg > 0 and counter_buff_reg <= cycle_length_buff) else -- enable shift when previous value was not 0 but current value is zero
    --                   '0';
           
    shift_en_int <= shift_en_reg;
                
    --tst_shift_en    <= shift_en_int;
    
    counter_done <= counter_done_reg;
    
    cycle_length_buff <= cycle_length - to_unsigned(22, 6);

end Behavioral;
