----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/15/2024 06:19:39 PM
-- Design Name: 
-- Module Name: test_LUT_64x12 - Behavioral
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

entity test_LUT_64x12 is
end test_LUT_64x12;

architecture Behavioral of test_LUT_64x12 is

    signal int_clk : std_logic := '0';
    signal int_clk_cnt : unsigned(31 downto 0) := to_unsigned(0, 32);

    signal rom_trig_int : std_logic := '0';  
    signal addr_int  : std_logic_vector(11 downto 0) := x"79E";
    signal out1_int  : std_logic_vector(11 downto 0) := (others => '0');
    signal out2_int  : std_logic_vector(11 downto 0) := (others => '0');
    signal out3_int  : std_logic_vector(11 downto 0) := (others => '0');
    signal out4_int  : std_logic_vector(11 downto 0) := (others => '0');
    signal out5_int  : std_logic_vector(11 downto 0) := (others => '0');
    signal out6_int  : std_logic_vector(11 downto 0) := (others => '0');
    signal out7_int  : std_logic_vector(11 downto 0) := (others => '0');
    signal out8_int  : std_logic_vector(11 downto 0) := (others => '0');
    signal out9_int  : std_logic_vector(11 downto 0) := (others => '0');
    signal out10_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out11_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out12_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out13_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out14_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out15_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out16_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out17_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out18_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out19_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out20_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out21_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out22_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out23_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out24_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out25_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out26_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out27_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out28_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out29_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out30_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out31_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out32_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out33_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out34_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out35_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out36_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out37_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out38_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out39_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out40_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out41_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out42_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out43_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out44_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out45_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out46_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out47_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out48_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out49_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out50_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out51_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out52_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out53_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out54_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out55_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out56_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out57_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out58_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out59_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out60_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out61_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out62_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out63_int : std_logic_vector(11 downto 0) := (others => '0');
    signal out64_int : std_logic_vector(11 downto 0) := (others => '0');

    component LUT_64x12 is
      Port ( rom_trig : in std_logic;   
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

    tb : LUT_64x12 port map (
        rom_trig => rom_trig_int,
        addr     => addr_int,
        out1     => out1_int,
        out2     => out2_int,
        out3     => out3_int,
        out4     => out4_int,
        out5     => out5_int,
        out6     => out6_int,
        out7     => out7_int,
        out8     => out8_int,
        out9     => out9_int,
        out10    => out10_int,
        out11    => out11_int,
        out12    => out12_int,
        out13    => out13_int,
        out14    => out14_int,
        out15    => out15_int,
        out16    => out16_int,
        out17    => out17_int,
        out18    => out18_int,
        out19    => out19_int,
        out20    => out20_int,
        out21    => out21_int,
        out22    => out22_int,
        out23    => out23_int,
        out24    => out24_int,
        out25    => out25_int,
        out26    => out26_int,
        out27    => out27_int,
        out28    => out28_int,
        out29    => out29_int,
        out30    => out30_int,
        out31    => out31_int,
        out32    => out32_int,
        out33    => out33_int,
        out34    => out34_int,
        out35    => out35_int,
        out36    => out36_int,
        out37    => out37_int,
        out38    => out38_int,
        out39    => out39_int,
        out40    => out40_int,
        out41    => out41_int,
        out42    => out42_int,
        out43    => out43_int,
        out44    => out44_int,
        out45    => out45_int,
        out46    => out46_int,
        out47    => out47_int,
        out48    => out48_int,
        out49    => out49_int,
        out50    => out50_int,
        out51    => out51_int,
        out52    => out52_int,
        out53    => out53_int,
        out54    => out54_int,
        out55    => out55_int,
        out56    => out56_int,
        out57    => out57_int,
        out58    => out58_int,
        out59    => out59_int,
        out60    => out60_int,
        out61    => out61_int,
        out62    => out62_int,
        out63    => out63_int,
        out64    => out64_int
    );

    main_clock: process
    begin
       int_clk <= '0';
       wait for 1ns;
       int_clk <= '1';
       int_clk_cnt <= int_clk_cnt + 1;
       wait for 1ns;
    end process;
    
    main_stim: process
    begin
       -- write config data (adc_cmd_sel is initialized to write to config1 reg with 8xosr and res boost to 18 bit
       if int_clk_cnt = x"0000000E" then
          rom_trig_int <= '1';
          wait for 2ns;
       elsif int_clk_cnt = x"00000018" then
          rom_trig_int <= '0';
          addr_int <= x"FF2";
          wait for 2ns;  
       elsif int_clk_cnt = x"00000032" then
          rom_trig_int <= '1';
          wait for 2ns;  
       elsif int_clk_cnt = x"00000044" then
          rom_trig_int <= '0';
          addr_int <= x"123";
          wait for 2ns;  
       else
          rom_trig_int <= '1';
          wait for 2ns;
       end if;
    end process;

end Behavioral;
