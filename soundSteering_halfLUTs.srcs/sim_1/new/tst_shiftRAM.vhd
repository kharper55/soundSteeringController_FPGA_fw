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

entity test_shiftRAM is
end test_shiftRAM;

architecture Behavioral of test_shiftRAM is

    signal clk, clr, full, mute : std_logic := '0';
    signal rstn : std_logic := '0';
    signal rom_trig : std_logic := '1';
    signal data : std_logic := '0';
    signal counter12_out : unsigned(11 downto 0);
    signal addr: std_logic_vector(11 downto 0) := (others => '0');
    signal pwm, inverts : std_logic_vector(1 to 64) := (others => '0');
    signal mutes : std_logic_vector(1 to 64) := (others => '1');
    signal shift_reg_out : std_logic_vector(0 to 2500) := (others => '0');
    signal tst_addr_offset_flg  : std_logic := '0';
    signal tst_addr_reg : std_logic_vector(10 downto 0) := (others => '0');
    signal tst_addr_pipe_rega, tst_addr_pipe_regb : std_logic_vector(11 downto 0) := (others => '0');
    signal tst_addr_mismatch_flg : std_logic := '0';
    signal clk_cnt : unsigned(31 downto 0) := to_unsigned(0, 32);
    
    signal td1_out, td2_out, td3_out, td4_out, td5_out, td6_out, td7_out, td8_out : integer;
    signal td9_out, td10_out, td11_out, td12_out, td13_out, td14_out, td15_out    : integer;
    signal td16_out, td17_out, td18_out, td19_out, td20_out, td21_out, td22_out   : integer;
    signal td23_out, td24_out, td25_out, td26_out, td27_out, td28_out, td29_out   : integer;
    signal td30_out, td31_out, td32_out, td33_out, td34_out, td35_out, td36_out   : integer;
    signal td37_out, td38_out, td39_out, td40_out, td41_out, td42_out, td43_out   : integer;
    signal td44_out, td45_out, td46_out, td47_out, td48_out, td49_out, td50_out   : integer;
    signal td51_out, td52_out, td53_out, td54_out, td55_out, td56_out, td57_out   : integer;
    signal td58_out, td59_out, td60_out, td61_out, td62_out, td63_out, td64_out   : integer;

-- Test bench consts
    Constant ClockPeriod : TIME := 10 ns;   -- 100MHz sys clk
    shared variable ClockCount : integer range 0 to 50_000 := 100;

    COMPONENT shiftRAM is
        Port ( clk           : in STD_LOGIC;             -- self explanatory
               rstn          : in STD_LOGIC;             -- self explanatory
               rom_trig      : in std_logic;
               clr           : in STD_LOGIC;
               mute          : in std_logic;             -- Write all zeroes to the pwm logic vector, effectively muting everything
               data          : in STD_LOGIC;             -- single bit pwm input data
               addr          : in STD_LOGIC_VECTOR(11 downto 0);  -- input steering coordinate from microblaze SPI (5bit AZ & 5bit EL)
               pwm           : out STD_LOGIC_VECTOR(1 to 64); -- individual pwm outputs for all transducers
               shift_reg_out  : out std_logic_vector(0 to 2500);
               mutes         : in std_logic_vector(1 to 64);  -- transducer mutes
               inverts       : in std_logic_vector(1 to 64);  -- transducer inverts for phase reversal
               full          : out std_logic;
               counter12_out : out unsigned(11 downto 0);
               tst_addr_offset_flg : out std_logic;
               tst_addr_mismatch_flg : out std_logic;
               tst_addr_reg : out std_logic_vector(10 downto 0) := (others => '0');
               tst_addr_pipe_rega : out std_logic_vector(11 downto 0) := (others => '0');
               tst_addr_pipe_regb : out std_logic_vector(11 downto 0) := (others => '0');
               td1_out : out integer;
               td2_out : out integer;
               td3_out : out integer;
               td4_out : out integer;
               td5_out : out integer;
               td6_out : out integer;
               td7_out : out integer;
               td8_out : out integer;
               td9_out : out integer;
               td10_out : out integer;
               td11_out : out integer;
               td12_out : out integer;
               td13_out : out integer;
               td14_out : out integer;
               td15_out : out integer;
               td16_out : out integer;
               td17_out : out integer;
               td18_out : out integer;
               td19_out : out integer;
               td20_out : out integer;
               td21_out : out integer;
               td22_out : out integer;
               td23_out : out integer;
               td24_out : out integer;
               td25_out : out integer;
               td26_out : out integer;
               td27_out : out integer;
               td28_out : out integer;
               td29_out : out integer;
               td30_out : out integer;
               td31_out : out integer;
               td32_out : out integer;
               td33_out : out integer;
               td34_out : out integer;
               td35_out : out integer;
               td36_out : out integer;
               td37_out : out integer;
               td38_out : out integer;
               td39_out : out integer;
               td40_out : out integer;
               td41_out : out integer;
               td42_out : out integer;
               td43_out : out integer;
               td44_out : out integer;
               td45_out : out integer;
               td46_out : out integer;
               td47_out : out integer;
               td48_out : out integer;
               td49_out : out integer;
               td50_out : out integer;
               td51_out : out integer;
               td52_out : out integer;
               td53_out : out integer;
               td54_out : out integer;
               td55_out : out integer;
               td56_out : out integer;
               td57_out : out integer;
               td58_out : out integer;
               td59_out : out integer;
               td60_out : out integer;
               td61_out : out integer;
               td62_out : out integer;
               td63_out : out integer;
               td64_out : out integer
           ); 
    end COMPONENT;

begin

    tb: shiftRAM port map (  clk          => clk,
                             rstn         => rstn,
                             rom_trig     => clk, -- rom_trig
                             clr          => clr,
                             mute         => mute,
                             data         => data,
                             addr         => addr,
                             pwm          => pwm,  
                             shift_reg_out => shift_reg_out,
                             mutes        => mutes,
                             inverts      => inverts,
                             full         => full, 
                             counter12_out => counter12_out, 
                             tst_addr_offset_flg => tst_addr_offset_flg,
                             tst_addr_mismatch_flg => tst_addr_mismatch_flg,
                             tst_addr_reg => tst_addr_reg,
                             tst_addr_pipe_rega => tst_addr_pipe_rega,  
                             tst_addr_pipe_regb => tst_addr_pipe_regb,
                             td1_out => td1_out,
                            td2_out  => td2_out,
                            td3_out  => td3_out,
                            td4_out  => td4_out,
                            td5_out  => td5_out,
                            td6_out  => td6_out,
                            td7_out  => td7_out,
                            td8_out  => td8_out,
                            td9_out  => td9_out,
                            td10_out => td10_out,
                            td11_out => td11_out,
                            td12_out => td12_out,
                            td13_out => td13_out,
                            td14_out => td14_out,
                            td15_out => td15_out,
                            td16_out => td16_out,
                            td17_out => td17_out,
                            td18_out => td18_out,
                            td19_out => td19_out,
                            td20_out => td20_out,
                            td21_out => td21_out,
                            td22_out => td22_out,
                            td23_out => td23_out,
                            td24_out => td24_out,
                            td25_out => td25_out,
                            td26_out => td26_out,
                            td27_out => td27_out,
                            td28_out => td28_out,
                            td29_out => td29_out,
                            td30_out => td30_out,
                            td31_out => td31_out,
                            td32_out => td32_out,
                            td33_out => td33_out,
                            td34_out => td34_out,
                            td35_out => td35_out,
                            td36_out => td36_out,
                            td37_out => td37_out,
                            td38_out => td38_out,
                            td39_out => td39_out,
                            td40_out => td40_out,
                            td41_out => td41_out,
                            td42_out => td42_out,
                            td43_out => td43_out,
                            td44_out => td44_out,
                            td45_out => td45_out,
                            td46_out => td46_out,
                            td47_out => td47_out,
                            td48_out => td48_out,
                            td49_out => td49_out,
                            td50_out => td50_out,
                            td51_out => td51_out,
                            td52_out => td52_out,
                            td53_out => td53_out,
                            td54_out => td54_out,
                            td55_out => td55_out,
                            td56_out => td56_out,
                            td57_out => td57_out,
                            td58_out => td58_out,
                            td59_out => td59_out,
                            td60_out => td60_out,
                            td61_out => td61_out,
                            td62_out => td62_out,
                            td63_out => td63_out,
                            td64_out => td64_out );
    
    -- Generate S_AXI_ACLK signal
    GENERATE_SYSCLOCK : process
    begin
       wait for (ClockPeriod / 2);
       clk_cnt <= clk_cnt + 1;
       clk <= '1';
       wait for (ClockPeriod / 2);
       clk <= '0';
    end process;                              
        
    main_stim: process
    begin
       -- write config data (adc_cmd_sel is initialized to write to config1 reg with 8xosr and res boost to 18 bit
       if clk_cnt = x"00000005" then
           rstn <= '1';
           wait for 1ps;
       elsif clk_cnt = x"0000000E" + x"00000576" then  
          addr <= x"79E";
          rom_trig <= '0';
          data <= '0';
          wait for 1ps;
       elsif clk_cnt = x"00000018" + x"00000576" then
          data <= '1';
          addr <= x"F3C";
          rom_trig <= '0';
          wait for 1ps;  
       elsif clk_cnt = x"00000023" + x"00000576" then
          data <= '0';
          rom_trig <= '1';
          wait for 1ns; 
       elsif clk_cnt = x"00000044" + x"00000576" then
          data <= '1';
          wait for 1ps; 
       elsif clk_cnt = x"00000053" + x"00000576" then
          data <= '0';
          wait for 1ps; 
       elsif clk_cnt = x"00000078" + x"00000576" then
          data <= '1';
          wait for 1ps; 
       elsif clk_cnt = x"000000102" + x"00000576" then
          data <= '0';
          wait for 1ps; 
       elsif clk_cnt = x"000000128" + x"00000576" then
          data <= '1';
          wait for 1ps; 
       elsif clk_cnt = x"000000137" + x"00000576" then
          data <= '0';
          wait for 1ps; 
       elsif clk_cnt = x"0000001E0" + x"00000576" then
          data <= '1';
          wait for 1ps; 
       elsif clk_cnt = x"0000001E0" + x"00000576" then
          data <= '0';
          wait for 1ps;
       elsif clk_cnt = x"000000230" + x"00000576" then
          data <= '1';
          wait for 1ps;
       elsif clk_cnt = x"000000244" + x"00000576" then
          data <= '0';
          wait for 1ps;
       elsif clk_cnt = x"00000A76" then
          data <= '1';
          addr <= x"79E";
          wait for 1ps;
       elsif clk_cnt = x"00000A76" + x"00000060" then
          data <= '0';
          rom_trig <= '0';
          wait for 1ps;
       elsif clk_cnt = x"00000A76" + x"00000576" then
          data <= '1';
          inverts <= (others => '1');
          mutes(2) <= '0';
          wait for 1ps; 
       elsif clk_cnt = x"00000A76" + x"00000999" then
          data <= '0';
          mutes <= (others => '0');
          wait for 1ps; 
       elsif clk_cnt = x"00000A76" + x"00000060" + x"00000002" then
          data <= '1';
          addr <= x"79F";
          wait for 1ps;
       elsif clk_cnt = x"00000A76" + x"00000060" + x"00000022" then
          data <= '0';
          rom_trig <= '1';
          wait for 1ps;
       elsif clk_cnt = x"00000A76" + x"00000060" + x"00000042" then
          data <= '1';
          addr <= x"3C5";
          wait for 1ps;
       elsif clk_cnt = x"00000b25" then
          rom_trig <= '0';
          addr <= x"F3C";
          wait for 1ps;
       elsif clk_cnt = x"00000b25" + x"14" then
          rom_trig <= '0';
          addr <= x"3C5";
          wait for 1ps;
       elsif clk_cnt = x"00000b25" + x"14" + x"14" then
          rom_trig <= '0';
          addr <= x"F3C";
          wait for 1ps;
       elsif clk_cnt = x"00000b25" + x"14" + x"14" + x"14" then
          rom_trig <= '0';
          addr <= x"3C5";
          wait for 1ps;
       elsif clk_cnt = x"00000b25" + x"14" + x"14" + x"14" + x"14" then
          rom_trig <= '0';
          addr <= x"F3C";
          wait for 1ps;
       else
          wait for 1ns;
       end if;
    end process;

end Behavioral;