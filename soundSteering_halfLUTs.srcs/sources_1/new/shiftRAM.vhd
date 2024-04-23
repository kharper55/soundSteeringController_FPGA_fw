----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2024 10:35:12 AM
-- Design Name: 
-- Module Name: shiftreg_2500 - Behavioral
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

-- SPECIFY INTEGER RANGES

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shiftRAM is
    Port ( clk           : in STD_LOGIC;             -- self explanatory
           rstn          : in STD_LOGIC;             -- self explanatory
           rom_trig      : in std_logic;
           clr           : in STD_LOGIC;
           mute          : in std_logic;             -- Write all zeroes to the pwm logic vector, effectively muting everything
           data          : in STD_LOGIC;             -- single bit pwm input data
           addr          : in STD_LOGIC_VECTOR(11 downto 0);  -- input steering coordinate from microblaze SPI (5bit AZ & 5bit EL)
           pwm           : out STD_LOGIC_VECTOR(1 to 64); -- individual pwm outputs for all transducers
           --shiftreg_out  : out std_logic_vector(0 to 2500);
           mutes         : in std_logic_vector(1 to 64);  -- transducer mutes
           inverts       : in std_logic_vector(1 to 64);  -- transducer inverts for phase reversal
           full          : out std_logic
           --counter12_out : out unsigned(11 downto 0);
           --tst_addr_flg : out std_logic;
           --tst_addr_conv : out std_logic_vector(10 downto 0) := (others => '0');
           ); 
end shiftRAM;

architecture Behavioral of shiftRAM is

    signal shiftreg, shiftreg_next : std_logic_vector(0 to 2500) := (others => '0');
    signal pwm_reg, pwm_next : std_logic_vector(1 to 64) := (others => '0');
    signal count_reg, count_next : unsigned(11 downto 0) := (others => '0');
    signal pwm_reg_buff : std_logic_vector(1 to 64) := (others => '0');
    signal addr_reg, addr_next : std_logic_vector(10 downto 0) := (others => '0');
    signal full_reg, full_next : std_logic := '0';
    signal addr_flg_reg, addr_flg_next : std_logic := '0';
    signal addr_conv : std_logic_vector(10 downto 0) := (others => '0');
    signal mutes_reg, mutes_next : std_logic_vector(1 to 64) := (others => '0');
    
    signal td1_int, td2_int, td3_int, td4_int, td5_int, td6_int, td7_int, td8_int         : std_logic_vector(11 downto 0) := (others => '0');
    signal td9_int, td10_int, td11_int, td12_int, td13_int, td14_int, td15_int, td16_int  : std_logic_vector(11 downto 0) := (others => '0');
    signal td17_int, td18_int, td19_int, td20_int, td21_int, td22_int, td23_int, td24_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td25_int, td26_int, td27_int, td28_int, td29_int, td30_int, td31_int, td32_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td33_int, td34_int, td35_int, td36_int, td37_int, td38_int, td39_int, td40_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td41_int, td42_int, td43_int, td44_int, td45_int, td46_int, td47_int, td48_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td49_int, td50_int, td51_int, td52_int, td53_int, td54_int, td55_int, td56_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td57_int, td58_int, td59_int, td60_int, td61_int, td62_int, td63_int, td64_int : std_logic_vector(11 downto 0) := (others => '0');
 
    signal td1_conv, td2_conv, td3_conv, td4_conv, td5_conv, td6_conv, td7_conv, td8_conv         : integer range 0 to 2500 := 0;                        
    signal td9_conv, td10_conv, td11_conv, td12_conv, td13_conv, td14_conv, td15_conv, td16_conv  : integer range 0 to 2500 := 0;                        
    signal td17_conv, td18_conv, td19_conv, td20_conv, td21_conv, td22_conv, td23_conv, td24_conv : integer range 0 to 2500 := 0;                        
    signal td25_conv, td26_conv, td27_conv, td28_conv, td29_conv, td30_conv, td31_conv, td32_conv : integer range 0 to 2500 := 0;                        
    signal td33_conv, td34_conv, td35_conv, td36_conv, td37_conv, td38_conv, td39_conv, td40_conv : integer range 0 to 2500 := 0;                        
    signal td41_conv, td42_conv, td43_conv, td44_conv, td45_conv, td46_conv, td47_conv, td48_conv : integer range 0 to 2500 := 0;                        
    signal td49_conv, td50_conv, td51_conv, td52_conv, td53_conv, td54_conv, td55_conv, td56_conv : integer range 0 to 2500 := 0;                        
    signal td57_conv, td58_conv, td59_conv, td60_conv, td61_conv, td62_conv, td63_conv, td64_conv : integer range 0 to 2500 := 0;      
     
    constant SHIFT_REG_MAX : unsigned(11 downto 0) := to_unsigned(2500, 12); 
    constant ADDRESS_MAX_12BIT : unsigned(11 downto 0) := to_unsigned(1950, 12); 
    constant ADDRESS_MAX_11BIT : unsigned(10 downto 0) := to_unsigned(1950, 11); 
     
    component inverter_64bit is
      Port ( clk    : in std_logic;
             rstn   : in std_logic;
             mask   : in std_logic_vector(1 to 64);
             input  : in std_logic_vector(1 to 64); 
             output : out std_logic_vector(1 to 64));
    end component;
    
    component LUT_64x12 is
      Port ( clk   : in std_logic;
             rstn  : in std_logic;
             addr  : in std_logic_vector(10 downto 0);
             out1  : out std_logic_vector(11 downto 0);
             out2  : out std_logic_vector(11 downto 0);
             out3  : out std_logic_vector(11 downto 0);
             out4  : out std_logic_vector(11 downto 0);
             out5  : out std_logic_vector(11 downto 0);
             out6  : out std_logic_vector(11 downto 0);
             out7  : out std_logic_vector(11 downto 0);
             out8  : out std_logic_vector(11 downto 0);
             out9  : out std_logic_vector(11 downto 0);
             out10 : out std_logic_vector(11 downto 0);
             out11 : out std_logic_vector(11 downto 0);
             out12 : out std_logic_vector(11 downto 0);
             out13 : out std_logic_vector(11 downto 0);
             out14 : out std_logic_vector(11 downto 0);
             out15 : out std_logic_vector(11 downto 0);
             out16 : out std_logic_vector(11 downto 0);
             out17 : out std_logic_vector(11 downto 0);
             out18 : out std_logic_vector(11 downto 0);
             out19 : out std_logic_vector(11 downto 0);
             out20 : out std_logic_vector(11 downto 0);
             out21 : out std_logic_vector(11 downto 0);
             out22 : out std_logic_vector(11 downto 0);
             out23 : out std_logic_vector(11 downto 0);
             out24 : out std_logic_vector(11 downto 0);
             out25 : out std_logic_vector(11 downto 0);
             out26 : out std_logic_vector(11 downto 0);
             out27 : out std_logic_vector(11 downto 0);
             out28 : out std_logic_vector(11 downto 0);
             out29 : out std_logic_vector(11 downto 0);
             out30 : out std_logic_vector(11 downto 0);
             out31 : out std_logic_vector(11 downto 0);
             out32 : out std_logic_vector(11 downto 0);
             out33 : out std_logic_vector(11 downto 0);
             out34 : out std_logic_vector(11 downto 0);
             out35 : out std_logic_vector(11 downto 0);
             out36 : out std_logic_vector(11 downto 0);
             out37 : out std_logic_vector(11 downto 0);
             out38 : out std_logic_vector(11 downto 0);
             out39 : out std_logic_vector(11 downto 0);
             out40 : out std_logic_vector(11 downto 0);
             out41 : out std_logic_vector(11 downto 0);
             out42 : out std_logic_vector(11 downto 0);
             out43 : out std_logic_vector(11 downto 0);
             out44 : out std_logic_vector(11 downto 0);
             out45 : out std_logic_vector(11 downto 0);
             out46 : out std_logic_vector(11 downto 0);
             out47 : out std_logic_vector(11 downto 0);
             out48 : out std_logic_vector(11 downto 0);
             out49 : out std_logic_vector(11 downto 0);
             out50 : out std_logic_vector(11 downto 0);
             out51 : out std_logic_vector(11 downto 0);
             out52 : out std_logic_vector(11 downto 0);
             out53 : out std_logic_vector(11 downto 0);
             out54 : out std_logic_vector(11 downto 0);
             out55 : out std_logic_vector(11 downto 0);
             out56 : out std_logic_vector(11 downto 0);
             out57 : out std_logic_vector(11 downto 0);
             out58 : out std_logic_vector(11 downto 0);
             out59 : out std_logic_vector(11 downto 0);
             out60 : out std_logic_vector(11 downto 0);
             out61 : out std_logic_vector(11 downto 0);
             out62 : out std_logic_vector(11 downto 0);
             out63 : out std_logic_vector(11 downto 0);
             out64 : out std_logic_vector(11 downto 0));
        end component;
    
begin

    -- shiftreg process                                                                                        
    process(clk)
	begin
	   if falling_edge(clk) then
	       if clr = '1' or rstn = '0' then
	           shiftreg <= (others => '0');
	       else
	           shiftreg <= shiftreg_next;
	       end if;
	   end if;
	end process;
	
	-- counting process for full flag                                                                                   
    process(clk)
	begin
	   if falling_edge(clk) then
	       if clr = '1' or rstn = '0' then
	           count_reg <= to_unsigned(0, 12);
	       else
	           count_reg <= count_next; -- dont reset count for clears... this is for muting pwm
	       end if;
	   end if;
	end process;
	
	-- register process for pwm time delay outputs
	process(clk)
	begin
	   if rising_edge(clk) then
	       if rstn = '0' then 
	           pwm_reg <= (others => '0');
	       else
               pwm_reg <= pwm_next;
           end if;
	   end if;
    end process;
    
    -- full_Reg
    process(clk)
	begin
	   if rising_edge(clk) then
	       if rstn = '0' then 
	           full_reg <= '0';
	       else
               full_reg <= full_next;
           end if;
	   end if;
    end process;
    
    -- addr_reg process                                                                                        
    process(clk)
	begin
	   if falling_edge(clk) then
	       if clr = '1' or rstn = '0' then
	           addr_reg <= (others => '0');
	       else
	           addr_reg <= addr_next;
	       end if;
	   end if;
	end process;
	
	-- addr_flg process                                                                                        
    process(clk)
	begin
	   if falling_edge(clk) then
	       if clr = '1' or rstn = '0' then
	           addr_flg_reg <= '0';
	       else
	           addr_flg_reg <= addr_flg_next;
	       end if;
	   end if;
	end process;
	
	process(clk)
	begin
	   if rising_edge(clk) then
	       if clr = '1' or rstn = '0' then
	           mutes_reg <= (others => '0');
	       else
	           mutes_reg <= mutes_next;
	       end if;
	   end if;
	end process;
	
	mutes_next <= mutes;
	
	full_next <= '1' when count_reg = SHIFT_REG_MAX else
	             '0' when count_reg < SHIFT_REG_MAX else
	             full_reg;
	
	-- ISSUE ! Have to clock the rom twice since this updates after it is incorrectly indexed!
	addr_flg_next <= '1' when unsigned(addr) > ADDRESS_MAX_12BIT else
	                 '0' when unsigned(addr) <= ADDRESS_MAX_12BIT else 
	                 addr_flg_reg; -- should never get here
	
	-- Invert address for angles larger than the halfway point
	-- Had to do some funny stuff here to ensure 11 bit math performed, as addr input port is 12 bits, but addr_reg is only 11!
	addr_next <= std_logic_vector(((ADDRESS_MAX_11BIT - unsigned(addr(10 downto 0))) + ADDRESS_MAX_11BIT)) when unsigned(addr) > ADDRESS_MAX_12BIT else
	             addr(10 downto 0) when unsigned(addr) <= ADDRESS_MAX_12BIT else
	             addr_reg;             -- Truncate address 
    
	-- shiftreg update contents. should pipeline this, or implement using actual fifo primitives
	shiftreg_next <= data&shiftreg(0 to 2499);  -- Highest order bit gets lost off the end
    
    -- Using the symmetry of the array would still require instantiating block rams to work with the adjusted address
    -- So 32 total BRAM components but 2x due to the instantiation.
    -- Would need to convert address too (to mimick the vertical reversal of the data)
    pwm_next <= shiftreg(td1_conv)&shiftreg(td2_conv)&shiftreg(td3_conv)&shiftreg(td4_conv)                
                &shiftreg(td5_conv)&shiftreg(td6_conv)&shiftreg(td7_conv)&shiftreg(td8_conv)                
                &shiftreg(td9_conv)&shiftreg(td10_conv)&shiftreg(td11_conv)&shiftreg(td12_conv)                
                &shiftreg(td13_conv)&shiftreg(td14_conv)&shiftreg(td15_conv)&shiftreg(td16_conv)                
                &shiftreg(td17_conv)&shiftreg(td18_conv)&shiftreg(td19_conv)&shiftreg(td20_conv)                
                &shiftreg(td21_conv)&shiftreg(td22_conv)&shiftreg(td23_conv)&shiftreg(td24_conv)                
                &shiftreg(td25_conv)&shiftreg(td26_conv)&shiftreg(td27_conv)&shiftreg(td28_conv)                
                &shiftreg(td29_conv)&shiftreg(td30_conv)&shiftreg(td31_conv)&shiftreg(td32_conv)                
                &shiftreg(td33_conv)&shiftreg(td34_conv)&shiftreg(td35_conv)&shiftreg(td36_conv)                
                &shiftreg(td37_conv)&shiftreg(td38_conv)&shiftreg(td39_conv)&shiftreg(td40_conv)                
                &shiftreg(td41_conv)&shiftreg(td42_conv)&shiftreg(td43_conv)&shiftreg(td44_conv)                
                &shiftreg(td45_conv)&shiftreg(td46_conv)&shiftreg(td47_conv)&shiftreg(td48_conv)                
                &shiftreg(td49_conv)&shiftreg(td50_conv)&shiftreg(td51_conv)&shiftreg(td52_conv)                
                &shiftreg(td53_conv)&shiftreg(td54_conv)&shiftreg(td55_conv)&shiftreg(td56_conv)                
                &shiftreg(td57_conv)&shiftreg(td58_conv)&shiftreg(td59_conv)&shiftreg(td60_conv)                
                &shiftreg(td61_conv)&shiftreg(td62_conv)&shiftreg(td63_conv)&shiftreg(td64_conv)
                when full_reg = '1' else (others => '0'); -- this else cast should be in agreement with the rst val
    
    timeDelays_LUT : LUT_64x12 port map ( clk   => rom_trig,
                                          rstn  => rstn,
                                          addr  => addr_reg,
                                          out1  => td1_int,
                                          out2  => td2_int,
                                          out3  => td3_int,
                                          out4  => td4_int,
                                          out5  => td5_int,
                                          out6  => td6_int,
                                          out7  => td7_int,
                                          out8  => td8_int,
                                          out9  => td9_int,
                                          out10 => td10_int,
                                          out11 => td11_int,
                                          out12 => td12_int,
                                          out13 => td13_int,
                                          out14 => td14_int,
                                          out15 => td15_int,
                                          out16 => td16_int,
                                          out17 => td17_int,
                                          out18 => td18_int,
                                          out19 => td19_int,
                                          out20 => td20_int,
                                          out21 => td21_int,
                                          out22 => td22_int,
                                          out23 => td23_int,
                                          out24 => td24_int,
                                          out25 => td25_int,
                                          out26 => td26_int,
                                          out27 => td27_int,
                                          out28 => td28_int,
                                          out29 => td29_int,
                                          out30 => td30_int,
                                          out31 => td31_int,
                                          out32 => td32_int,
                                          out33 => td33_int,
                                          out34 => td34_int,
                                          out35 => td35_int,
                                          out36 => td36_int,
                                          out37 => td37_int,
                                          out38 => td38_int,
                                          out39 => td39_int,
                                          out40 => td40_int,
                                          out41 => td41_int,
                                          out42 => td42_int,
                                          out43 => td43_int,
                                          out44 => td44_int,
                                          out45 => td45_int,
                                          out46 => td46_int,
                                          out47 => td47_int,
                                          out48 => td48_int,
                                          out49 => td49_int,
                                          out50 => td50_int,
                                          out51 => td51_int,
                                          out52 => td52_int,
                                          out53 => td53_int,
                                          out54 => td54_int,
                                          out55 => td55_int,
                                          out56 => td56_int,
                                          out57 => td57_int,
                                          out58 => td58_int,
                                          out59 => td59_int,
                                          out60 => td60_int,
                                          out61 => td61_int,
                                          out62 => td62_int,
                                          out63 => td63_int,
                                          out64 => td64_int);

    phaseInverter : inverter_64bit port map ( clk    => clk,
                                              rstn   => rstn, 
                                              mask   => inverts,
                                              input  => pwm_reg,
                                              output => pwm_reg_buff );
    
    -- Address some issues here?
    count_next <= count_reg + 1 when count_reg < 2501 else
                  count_reg; -- Used to set FIFO full flag... count_reg is cleared on clr or rst

    pwm      <= pwm_reg_buff and mutes_reg; -- HAS PHASE INVERSION MASK APPLIED
    
    -- Update full flag
    full     <= full_reg;
                
    -- register these?         
    td1_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td1_int)))) when addr_flg_reg = '1' else
                to_integer(unsigned(td1_int));

    td2_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td2_int)))) when addr_flg_reg = '1' else
                to_integer(unsigned(td2_int));
    
    td3_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td3_int)))) when addr_flg_reg = '1' else
                to_integer(unsigned(td3_int));
    
    td4_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td4_int)))) when addr_flg_reg = '1' else
                to_integer(unsigned(td4_int));
    
    td5_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td5_int)))) when addr_flg_reg = '1' else
                to_integer(unsigned(td5_int));
    
    td6_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td6_int)))) when addr_flg_reg = '1' else
                to_integer(unsigned(td6_int));
    
    td7_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td7_int)))) when addr_flg_reg = '1' else
                to_integer(unsigned(td7_int));
    
    td8_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td8_int)))) when addr_flg_reg = '1' else
                to_integer(unsigned(td8_int));
    
    td9_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td9_int)))) when addr_flg_reg = '1' else
                to_integer(unsigned(td9_int));
    
    td10_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td10_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td10_int));
    
    td11_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td11_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td11_int));
    
    td12_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td12_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td12_int));
    
    td13_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td13_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td13_int));
    
    td14_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td14_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td14_int));
    
    td15_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td15_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td15_int));
    
    td16_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td16_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td16_int));
    
    td17_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td17_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td17_int));
    
    td18_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td18_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td18_int));
    
    td19_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td19_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td19_int));
    
    td20_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td20_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td20_int));
    
    td21_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td21_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td21_int));
    
    td22_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td22_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td22_int));
    
    td23_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td23_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td23_int));
    
    td24_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td24_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td24_int));
    
    td25_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td25_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td25_int));
    
    td26_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td26_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td26_int));
    
    td27_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td27_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td27_int));
    
    td28_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td28_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td28_int));
    
    td29_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td29_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td29_int));
    
    td30_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td30_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td30_int));
    
    td31_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td31_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td31_int));
    
    td32_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td32_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td32_int));
    
    td33_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td33_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td33_int));
    
    td34_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td34_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td34_int));
    
    td35_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td35_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td35_int));
    
    td36_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td36_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td36_int));
    
    td37_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td37_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td37_int));
    
    td38_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td38_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td38_int));
    
    td39_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td39_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td39_int));
    
    td40_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td40_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td40_int));
    
    td41_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td41_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td41_int));
    
    td42_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td42_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td42_int));
    
    td43_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td43_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td43_int));
    
    td44_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td44_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td44_int));
    
    td45_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td45_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td45_int));
    
    td46_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td46_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td46_int));
    
    td47_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td47_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td47_int));
    
    td48_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td48_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td48_int));
    
    td49_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td49_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td49_int));
    
    td50_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td50_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td50_int));
    
    td51_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td51_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td51_int));
    
    td52_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td52_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td52_int));
    
    td53_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td53_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td53_int));
    
    td54_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td54_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td54_int));
    
    td55_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td55_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td55_int));
    
    td56_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td56_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td56_int));
    
    td57_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td57_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td57_int));
    
    td58_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td58_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td58_int));
    
    td59_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td59_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td59_int));
    
    td60_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td60_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td60_int));
    
    td61_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td61_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td61_int));
    
    td62_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td62_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td62_int));
    
    td63_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td63_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td63_int));
    
    td64_conv <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td64_int)))) when addr_flg_reg = '1' else
                 to_integer(unsigned(td64_int));
    
    -- Test signals
    --shiftreg_out  <= shiftreg;
    --counter12_out <= count_reg;
    --tst_addr_flg <= addr_flg_reg;
    --tst_addr_conv <= addr_reg;

end Behavioral;