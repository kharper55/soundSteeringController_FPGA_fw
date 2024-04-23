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
    Port ( clk_slow           : in std_logic;
           clk_fast           : in std_logic; -- needed to synchronize clock domain crossings, especially for adc data, and fsm control
           rstn               : in std_logic;
           en                 : in std_logic; -- from fsm, double ff synced
           sda_reg_clr        : in std_logic; -- from fsm, double ff synced
           sdi_data           : in std_logic_vector(15 downto 0); -- updates synced to fast clk
           sdoa               : in std_logic;
           sdob               : in std_logic;
           sdi                : out std_logic;
           cs                 : out std_logic;
           scl                : out std_logic;
           sdoa_data          : out std_logic_vector(15 downto 0); -- to datapath, double ff synced
           sdob_data          : out std_logic_vector(15 downto 0); -- to datapath, double ff synced
           cycle_counter_out  : out unsigned(5 downto 0);
           tst_counter_clr    : out std_logic;
           tst_en_buff        : out std_logic;
           tst_shift_en       : out std_logic;
           counter_done       : out std_logic);
end vhdl_serial_peripheral;

architecture Behavioral of vhdl_serial_peripheral is

    ---------- SIGNAL DECLARATIONS AND INITIALIZATION ----------

    -- Cycle length timing specs (1uS @ 40MHz)
    constant CYCLE_LENGTH                 : unsigned(5 downto 0) := to_unsigned(37, 6) + to_unsigned(2, 6); -- add 22 clock cycles to meet timing specs
    constant CYCLE_DIFF                   : unsigned(5 downto 0) := to_unsigned(24, 6); -- difference from the above integer to 15 (highest needed index for serial register transaction)
    constant CYCLE_DATA_WIDTH             : unsigned(5 downto 0) := CYCLE_LENGTH - CYCLE_DIFF + 1;
    
    -- 16 bit shift register
    signal shift_regA_out, shift_regB_out : std_logic_vector(15 downto 0) := (others => '0');
    
    -- 5 bit cycle counter
    signal counter_value                  : unsigned(5 downto 0) := to_unsigned(0, 6);
    
    -- internal regs
    signal sdi_data_reg, sdi_data_next             : std_logic_vector(15 downto 0) := (others => '0');
    signal cs_reg, cs_next                         : std_logic := '1';
    signal sdoa_reg, sdoa_next                     : std_logic_vector(15 downto 0) := (others => '0');
    signal sdob_reg, sdob_next                     : std_logic_vector(15 downto 0) := (others => '0');
    signal sdi_reg, sdi_next                       : std_logic := '0';
    signal autoclear_reg, autoclear_next           : std_logic := '1';
    signal en_buffer_reg, en_buffer_next           : std_logic := '0';
    signal counter_done_reg, counter_done_next     : std_logic := '1';
    signal shift_en_reg, shift_en_next             : std_logic := '0';
    signal sda_reg_clr_buff, sda_reg_clr_buff_next : std_logic := '1';
    
    -- stabilize sdi?
    signal count_buff                           : integer range 0 to 8 := 0;
    signal en_stretched                         : std_logic := '0';
    signal en_metastable, en_stable             : std_logic := '0';
    signal counter_done_stable, counter_done_metastable : std_logic := '1';
    signal sdoa_data_metastable, sdoa_data_stable  : std_logic_vector(15 downto 0) := (others => '0');
    signal sdob_data_metastable, sdob_data_stable  : std_logic_vector(15 downto 0) := (others => '0');

    ---------- COMPONENT DECLARATIONS ----------
    
    component counter_6 is
        Port( clk           : in std_logic;
              rstn : in std_logic;
              clr           : in std_logic;
              output        : out unsigned(5 downto 0));	
    end component;
    
    component shift_left_16 is
        Port( clk           : in std_logic;
              rstn : in std_logic;
              input         : in std_logic;
              clr           : in std_logic;
              shift_en      : in std_logic;
              output        : out std_logic_vector(15 downto 0));			
    end component;

begin
    
    ---------- COMPONENT INSTANTIATIONS ----------
    
    cycle_counter: counter_6 port map ( clk    => clk_slow,
                                        rstn   => rstn,
                                        clr    => autoclear_reg,
                                        output => counter_value);	
                                                 
    data_shift_sdoa: shift_left_16 port map ( clk      => clk_slow,
                                              rstn     => rstn,
                                              input    => sdoa,  
                                              clr      => sda_reg_clr_buff,
                                              shift_en => shift_en_reg,
                                              output   => shift_regA_out);
            
    data_shift_sdob: shift_left_16 port map ( clk      => clk_slow,
                                              rstn     => rstn,
                                              input    => sdob,
                                              clr      => sda_reg_clr_buff,
                                              shift_en => shift_en_reg,
                                              output   => shift_regB_out);   
    
    ---------- REGISTER PROCESS BLOCKS ----------
    
    -- 40MHz -> 100MHz CDC, output to FSM 
    -- Output counter done double flop sync, en input pulse stretch                                                                                               
    process(clk_fast)
	begin
	   if rising_edge(clk_fast) then
	        if rstn = '0' then
	           counter_done_metastable <= '1';
	           counter_done_stable     <= '1';
               count_buff <= 0;
	        else
			   counter_done_metastable <= counter_done_reg;
			   counter_done_stable     <= counter_done_metastable;
			   -- Stretch fast en pulse out in fast clock domain
			   if (en = '1' and count_buff = 0) then
			     count_buff <= 5; -- should capture minimum of 2 periods of the slow clock (50nS)
			   elsif count_buff > 0 then
			     count_buff <= count_buff - 1;
			   end if;
			end if;
	   end if;
	end process;
	
	-- Sretch out the pulse for the slow clock domain
	en_stretched <= '1' when count_buff > 0 else '0';
	
	-- Stabilize input control enable from fast 100MHz FSM to the slow 40MHz clk
	process(clk_slow) 
	begin
	   if rising_edge(clk_slow) then
	       if rstn = '0' then
	           en_metastable        <= '0';
	           en_stable            <= '0';
	       else
	           en_metastable <= en_stretched;
	           en_stable     <= en_metastable;
	       end if;
	   end if;
	end process;

    -- Stabilize sdoa, sdob data to main fast sys clock (100MHz)
	process(clk_fast)
	begin
	   if rising_edge(clk_fast) then
	        if rstn = '0' then
	           sdoa_data_metastable <= (others => '0');
	           sdoa_data_stable     <= (others => '0');
	           sdob_data_metastable <= (others => '0');
	           sdob_data_stable     <= (others => '0');     
	        else
			   sdoa_data_metastable <= sdoa_reg;
			   sdoa_data_stable     <= sdoa_data_metastable;
			   sdob_data_metastable <= sdob_reg;
	           sdob_data_stable     <= sdob_data_metastable;
			end if;
	   end if;
	end process;
    
    -- sdi_data_reg                                                                                                  
    process(clk_slow)
	begin
	   if rising_edge(clk_slow) then
	        if rstn = '0' then
	           sdi_data_reg <= (others => '0');
	        else
			   sdi_data_reg <= sdi_data_next;
			end if;
	   end if;
	end process;
                                       
    -- sdoa reg                                                                                                  
    process(clk_slow)
	begin
	   if rising_edge(clk_slow) then
	        if rstn = '0' then
	           sdoa_reg <= (others => '0');
	        else
			   sdoa_reg <= sdoa_next;
			end if;
	   end if;
	end process;
	
	-- sdob reg
	process(clk_slow)
	begin
	   if rising_edge(clk_slow) then
	        if rstn = '0' then
			   sdob_reg <= (others => '0');
			else
			   sdob_reg <= sdob_next;
		    end if;
	   end if;
	end process;
	
	-- sdi reg
	process(clk_slow)
	begin
	    if rising_edge(clk_slow) then
		   if rstn = '0' then
		      sdi_reg <= '0';
		   else
		      sdi_reg <= sdi_next;
		   end if;
		end if;
	end process;
	
	--cs_reg
	process(clk_slow)
	begin
	    if rising_edge(clk_slow) then -- changed this from falling edge
		    if rstn = '0' then
		       cs_reg <=  '1';
		    else 
			   cs_reg <= cs_next;
			end if;
		end if;
	end process;
	
	-- auto reset reg for counter
	process(clk_slow)
	begin	
	   if falling_edge(clk_slow) then
	       if rstn = '0' then
	           autoclear_reg <= '1';
	       else
	           autoclear_reg <= autoclear_next;
	       end if;
	   end if;
	end process;
	
	-- EN buffer such that every time the peripheral is enabled an entire minimum cycle is completed
	process(clk_slow)
	begin
	   if rising_edge(clk_slow) then
           if rstn = '0' then
               en_buffer_reg <= '0';
           else
               en_buffer_reg <= en_buffer_next;
           end if;
        end if;
	end process;
	
	process(clk_slow)
	begin
	   if rising_edge(clk_slow) then
           if rstn = '0' then
               counter_done_reg <= '1';        -- Changed this from '0'
           else
               counter_done_reg <= counter_done_next;
       end if;
	end if;
	end process;
	
	process(clk_slow)
	begin
        if falling_edge(clk_slow) then   
            if rstn = '0' then
	           shift_en_reg <= '0';
            else 
                shift_en_reg <= shift_en_next;
            end if;
        end if;
	end process;
	
	-- sda_reg_clr_buff
    process(clk_slow)
	begin
        if rising_edge(clk_slow) then
           if rstn = '0' then
               sda_reg_clr_buff <= '0';
           else
               sda_reg_clr_buff <= sda_reg_clr_buff_next;
           end if;
        end if;
	end process;
	
	---------- REGISTER UPDATE ASSIGNMENTS ----------
	
	sdi_data_next <= sdi_data when counter_done_stable = '1' else -- Prevent data from changing during a cycle
	                 sdi_data_reg;
	
	sda_reg_clr_buff_next <= '0' when en_buffer_reg = '1' else
	                         '1' when (sda_reg_clr = '1' and en_buffer_reg = '0') else 
	                         sda_reg_clr_buff;
	                        
	-- Signal a bit early to FSM
	counter_done_next <= '1' when cs_reg = '1' or (counter_value = CYCLE_LENGTH - to_unsigned(1, 6)) else
	                     '0';
	
	cs_next <= '0' when (counter_value = to_unsigned(0, 6) and en_buffer_reg = '1') else 
			   '1' when (en_buffer_reg = '0' or (en_buffer_reg = '1' and (counter_value = CYCLE_DATA_WIDTH))) else			
			   cs_reg;		 
		
	sdoa_next <= shift_regA_out when (counter_value = CYCLE_DATA_WIDTH + to_unsigned(1, 6)) else
				 sdoa_reg;-- update register 2 clock cycles after a potential read has occurred. thereafter pipelined at the ADC data rate (1MSPS)
			
					 
	sdob_next <= shift_regB_out when (counter_value = CYCLE_DATA_WIDTH + to_unsigned(1, 6)) else
				 sdob_reg;
    
    -- NOTE: PUSHED THIS ONE CLOCK CYCLE BACKWARDS ON 04/21
	sdi_next <=  '0' when ((counter_value > CYCLE_DATA_WIDTH) or counter_value = to_unsigned(0,6)) else
	             sdi_data_reg(to_integer(CYCLE_DATA_WIDTH - counter_value)) when (cs_reg = '0' or (en_buffer_reg = '1' and (counter_value <= CYCLE_DATA_WIDTH))) else 
	             sdi_reg;
	                                
	autoclear_next <= '1' when (counter_value = CYCLE_LENGTH or en_buffer_reg = '0') else
	                  '0';
	
	-- need to address fact that we arent even using the enable signal                  
	en_buffer_next <= '1' when (counter_done_stable = '1' and counter_value = to_unsigned(0, 6) and en_stable = '1') else
	                  '0' when (counter_done_stable = '1' and counter_value = CYCLE_LENGTH and en_stable = '0') else
	                  en_buffer_reg; -- buffer user applied enable so as to complete serial transmissions
	                  
	shift_en_next <= '1' when (en_buffer_reg = '1' and ((counter_value > 0) and (counter_value <= CYCLE_DATA_WIDTH))) else 
	                 '0' when en_buffer_reg = '0' or (counter_value > CYCLE_DATA_WIDTH) else 
	                 shift_en_reg;
	
	---------- OUTPUT PORT SIGNAL ASSIGNMENTS ----------
	
	-- Sketchy clock gating. This should make proper use of Xilinx primitives and this component should also use the CDC features                  
	-- push values to output variables (might need to readdress this clock signal...)
    scl       <= clk_slow when (en_buffer_reg = '1' and ((counter_value > to_unsigned(0, 6)) and (counter_value <= CYCLE_DATA_WIDTH))) else
                 '1';
	        
	sdi               <= sdi_reg;
	cs                <= cs_reg;    
    sdoa_data         <= sdoa_data_stable;
    sdob_data         <= sdob_data_stable;
    counter_done      <= counter_done_stable;
    
    -- Test signal outputs
    cycle_counter_out <= counter_value;
    tst_shift_en      <= shift_en_reg;
    tst_counter_clr   <= autoclear_reg;
    tst_en_buff       <= en_buffer_reg;

end Behavioral;
