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

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity shiftRAM is
    Port ( clk      : in STD_LOGIC;             -- self explanatory
           rst      : in STD_LOGIC;             -- self explanatory
           rom_trig : in std_logic;
           clr      : in STD_LOGIC;
           mute     : in std_logic;             -- Write all zeroes to the pwm logic vector, effectively muting everything
           data     : in STD_LOGIC;             -- single bit pwm input data
           addr     : in STD_LOGIC_VECTOR(11 downto 0);  -- input steering coordinate from microblaze SPI (5bit AZ & 5bit EL)
           pwm      : out STD_LOGIC_VECTOR(1 to 64); -- individual pwm outputs for all transducers
           --shiftreg_out : out std_logic_vector(0 to 2500);
           mutes    : in std_logic_vector(1 to 64);  -- transducer mutes
           inverts  : in std_logic_vector(1 to 64);  -- transducer inverts for phase reversal
           full     : out std_logic); 
end shiftRAM;

architecture Behavioral of shiftRAM is

    signal shiftreg, shiftreg_next : std_logic_vector(0 to 2500) := (others => '0');
    signal pwm_reg, pwm_next : std_logic_vector(1 to 64) := (others => '0');
    signal countreg, countnext : unsigned(11 downto 0) := (others => '0');
    signal pwm_reg_buff : std_logic_vector(1 to 64) := (others => '0');
    
    signal td1_int, td2_int, td3_int, td4_int, td5_int, td6_int, td7_int, td8_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td9_int, td10_int, td11_int, td12_int, td13_int, td14_int, td15_int, td16_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td17_int, td18_int, td19_int, td20_int, td21_int, td22_int, td23_int, td24_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td25_int, td26_int, td27_int, td28_int, td29_int, td30_int, td31_int, td32_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td33_int, td34_int, td35_int, td36_int, td37_int, td38_int, td39_int, td40_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td41_int, td42_int, td43_int, td44_int, td45_int, td46_int, td47_int, td48_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td49_int, td50_int, td51_int, td52_int, td53_int, td54_int, td55_int, td56_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td57_int, td58_int, td59_int, td60_int, td61_int, td62_int, td63_int, td64_int : std_logic_vector(11 downto 0) := (others => '0');
 
    component inverter_64bit is
      Port ( mask   : in std_logic_vector(1 to 64);
             input  : in std_logic_vector(1 to 64); 
             output : out std_logic_vector(1 to 64));
    end component;
    
    component LUT_64x12 is
      Port ( rst : in std_logic;
             rom_trig : in std_logic;
             addr  : in std_logic_vector(11 downto 0);
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
    process(clk, rst, clr)
	begin
	   if rst = '1' then
	        shiftreg <= (others => '0');
	   elsif falling_edge(clk) then
	       if clr = '1' then
	           shiftreg <= (others => '0');
	       else
	           shiftreg <= shiftreg_next;
	       end if;
	   end if;
	end process;
	
	-- counting process for full flag                                                                                   
    process(clk, rst, clr)
	begin
	   if rst = '1' then
	        countreg <= to_unsigned(0, 12);
	   elsif falling_edge(clk) then
	       if clr = '1' then
	           countreg <= to_unsigned(0, 12);
	       else
	           countreg <= countnext; -- dont reset count for clears... this is for muting pwm
	       end if;
	   end if;
	end process;
	
	-- register process for pwm time delay outputs
	process(clk, rst, mute)
	begin
	   if rst = '1' or mute = '1' then
	       pwm_reg <= (others => '0');
	   elsif rising_edge(clk) then
	       pwm_reg <= pwm_next;
	   end if;
    end process;
    
	-- shiftreg update contents
	shiftreg_next <= data&shiftreg(0 to 2499);  -- Highest order bit gets lost off the end
    
    -- Using the symmetry of the array would still require instantiating block rams to work with the adjusted address
    -- So 32 total BRAM components but 2x due to the instantiation.
    -- Would need to convert address too (to mimick the vertical reversal of the data)
    pwm_next <= shiftreg(to_integer(unsigned(td1_int)))&shiftreg(to_integer(unsigned(td2_int)))&shiftreg(to_integer(unsigned(td3_int)))&shiftreg(to_integer(unsigned(td4_int)))
                &shiftreg(to_integer(unsigned(td5_int)))&shiftreg(to_integer(unsigned(td6_int)))&shiftreg(to_integer(unsigned(td7_int)))&shiftreg(to_integer(unsigned(td8_int)))
                &shiftreg(to_integer(unsigned(td9_int)))&shiftreg(to_integer(unsigned(td10_int)))&shiftreg(to_integer(unsigned(td11_int)))&shiftreg(to_integer(unsigned(td12_int)))
                &shiftreg(to_integer(unsigned(td13_int)))&shiftreg(to_integer(unsigned(td14_int)))&shiftreg(to_integer(unsigned(td15_int)))&shiftreg(to_integer(unsigned(td16_int)))
                &shiftreg(to_integer(unsigned(td17_int)))&shiftreg(to_integer(unsigned(td18_int)))&shiftreg(to_integer(unsigned(td19_int)))&shiftreg(to_integer(unsigned(td20_int)))
                &shiftreg(to_integer(unsigned(td21_int)))&shiftreg(to_integer(unsigned(td22_int)))&shiftreg(to_integer(unsigned(td23_int)))&shiftreg(to_integer(unsigned(td24_int)))
                &shiftreg(to_integer(unsigned(td25_int)))&shiftreg(to_integer(unsigned(td26_int)))&shiftreg(to_integer(unsigned(td27_int)))&shiftreg(to_integer(unsigned(td28_int)))
                &shiftreg(to_integer(unsigned(td29_int)))&shiftreg(to_integer(unsigned(td30_int)))&shiftreg(to_integer(unsigned(td31_int)))&shiftreg(to_integer(unsigned(td32_int)))
                &shiftreg(to_integer(unsigned(td33_int)))&shiftreg(to_integer(unsigned(td34_int)))&shiftreg(to_integer(unsigned(td35_int)))&shiftreg(to_integer(unsigned(td36_int)))
                &shiftreg(to_integer(unsigned(td37_int)))&shiftreg(to_integer(unsigned(td38_int)))&shiftreg(to_integer(unsigned(td39_int)))&shiftreg(to_integer(unsigned(td40_int)))
                &shiftreg(to_integer(unsigned(td41_int)))&shiftreg(to_integer(unsigned(td42_int)))&shiftreg(to_integer(unsigned(td43_int)))&shiftreg(to_integer(unsigned(td44_int)))
                &shiftreg(to_integer(unsigned(td45_int)))&shiftreg(to_integer(unsigned(td46_int)))&shiftreg(to_integer(unsigned(td47_int)))&shiftreg(to_integer(unsigned(td48_int)))
                &shiftreg(to_integer(unsigned(td49_int)))&shiftreg(to_integer(unsigned(td50_int)))&shiftreg(to_integer(unsigned(td51_int)))&shiftreg(to_integer(unsigned(td52_int)))
                &shiftreg(to_integer(unsigned(td53_int)))&shiftreg(to_integer(unsigned(td54_int)))&shiftreg(to_integer(unsigned(td55_int)))&shiftreg(to_integer(unsigned(td56_int)))
                &shiftreg(to_integer(unsigned(td57_int)))&shiftreg(to_integer(unsigned(td58_int)))&shiftreg(to_integer(unsigned(td59_int)))&shiftreg(to_integer(unsigned(td60_int)))
                &shiftreg(to_integer(unsigned(td61_int)))&shiftreg(to_integer(unsigned(td62_int)))&shiftreg(to_integer(unsigned(td63_int)))&shiftreg(to_integer(unsigned(td64_int)));
    
    timeDelays_LUT : LUT_64x12 port map ( rst   => rst,
                                          rom_trig => rom_trig,
                                          addr  => addr,
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

    phaseInverter : inverter_64bit port map ( mask   => inverts,
                                              input  => pwm_reg,
                                              output => pwm_reg_buff);
    
    -- Address some issues here?
    countnext <= countreg + 1 when countreg < 2501 else
                 countreg; -- Used to set FIFO full flag... countreg is cleared on clr or rst

    pwm       <= pwm_reg_buff and mutes; -- HAS PHASE INVERSION MASK APPLIED
    
    -- Update full flag
    full      <= '1' when countreg = 2501 else
                 '0';

    -- Test signal
    --shiftreg_out <= shiftreg;

end Behavioral;