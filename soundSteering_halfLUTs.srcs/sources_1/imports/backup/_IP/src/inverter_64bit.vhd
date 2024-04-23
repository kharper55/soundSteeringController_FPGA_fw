----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/11/2024 03:18:32 AM
-- Design Name: 
-- Module Name: inverter_1bit - Behavioral
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

entity inverter_64bit is
  Port ( clk    : in std_logic;
         rstn   : in std_logic;
         mask   : in std_logic_vector(1 to 64);
         input  : in std_logic_vector(1 to 64); 
         output : out std_logic_vector(1 to 64));
end inverter_64bit;

architecture Behavioral of inverter_64bit is

    signal buff1_int, buff2_int, buff3_int, buff4_int, buff5_int, buff6_int, buff7_int, buff8_int         : std_logic := '0';
    signal buff9_int, buff10_int, buff11_int, buff12_int, buff13_int, buff14_int, buff15_int, buff16_int  : std_logic := '0';
    signal buff17_int, buff18_int, buff19_int, buff20_int, buff21_int, buff22_int, buff23_int, buff24_int : std_logic := '0';
    signal buff25_int, buff26_int, buff27_int, buff28_int, buff29_int, buff30_int, buff31_int, buff32_int : std_logic := '0';
    signal buff33_int, buff34_int, buff35_int, buff36_int, buff37_int, buff38_int, buff39_int, buff40_int : std_logic := '0';
    signal buff41_int, buff42_int, buff43_int, buff44_int, buff45_int, buff46_int, buff47_int, buff48_int : std_logic := '0';
    signal buff49_int, buff50_int, buff51_int, buff52_int, buff53_int, buff54_int, buff55_int, buff56_int : std_logic := '0';
    signal buff57_int, buff58_int, buff59_int, buff60_int, buff61_int, buff62_int, buff63_int, buff64_int : std_logic := '0';

begin
    
    
    PROCESS(CLK)
    BEGIN
    -- Asynchronous inversion -- changed on 04/21 to make synchronous
    ---------- Internal Buffer Assignment ----------
        if rising_edge(clk) then
            if rstn = '0' then
                buff1_int  <= '0';
                buff2_int  <= '0';
                buff3_int  <= '0';
                buff4_int  <= '0';
                buff5_int  <= '0';
                buff6_int  <= '0';
                buff7_int  <= '0';
                buff8_int  <= '0';
                buff9_int  <= '0';
                buff10_int <= '0';
                buff11_int <= '0';
                buff12_int <= '0';
                buff13_int <= '0';
                buff14_int <= '0';
                buff15_int <= '0';
                buff16_int <= '0';
                buff17_int <= '0';
                buff18_int <= '0';
                buff19_int <= '0';
                buff20_int <= '0';
                buff21_int <= '0';
                buff22_int <= '0';
                buff23_int <= '0';
                buff24_int <= '0';
                buff25_int <= '0';
                buff26_int <= '0';
                buff27_int <= '0';
                buff28_int <= '0';
                buff29_int <= '0';
                buff30_int <= '0';
                buff31_int <= '0';
                buff32_int <= '0';
                buff33_int <= '0';
                buff34_int <= '0';
                buff35_int <= '0';
                buff36_int <= '0';
                buff37_int <= '0';
                buff38_int <= '0';
                buff39_int <= '0';
                buff40_int <= '0';
                buff41_int <= '0';
                buff42_int <= '0';
                buff43_int <= '0';
                buff44_int <= '0';
                buff45_int <= '0';
                buff46_int <= '0';
                buff47_int <= '0';
                buff48_int <= '0';
                buff49_int <= '0';
                buff50_int <= '0';
                buff51_int <= '0';
                buff52_int <= '0';
                buff53_int <= '0';
                buff54_int <= '0';
                buff55_int <= '0';
                buff56_int <= '0';
                buff57_int <= '0';
                buff58_int <= '0';
                buff59_int <= '0';
                buff60_int <= '0';
                buff61_int <= '0';
                buff62_int <= '0';
                buff63_int <= '0';
                buff64_int <= '0';
            else
                if mask(1) = '1' then
                    buff1_int <= not input(1);
                else
                    buff1_int <= input(1);
                end if;
                
                
                if mask(2) = '1' then
                    buff2_int <= not input(2);
                else
                    buff2_int <= input(2);
                end if;
                
                
                if mask(3) = '1' then
                    buff3_int <= not input(3);
                else
                    buff3_int <= input(3);
                end if;
                
                
                if mask(4) = '1' then
                    buff4_int <= not input(4);
                else
                    buff4_int <= input(4);
                end if;
                
                
                if mask(5) = '1' then
                    buff5_int <= not input(5);
                else
                    buff5_int <= input(5);
                end if;
                
                
                if mask(6) = '1' then
                    buff6_int <= not input(6);
                else
                    buff6_int <= input(6);
                end if;
                
                
                if mask(7) = '1' then
                    buff7_int <= not input(7);
                else
                    buff7_int <= input(7);
                end if;
                
                
                if mask(8) = '1' then
                    buff8_int <= not input(8);
                else
                    buff8_int <= input(8);
                end if;
                
                
                if mask(9) = '1' then
                    buff9_int <= not input(9);
                else
                    buff9_int <= input(9);
                end if;
                
                
                if mask(10) = '1' then
                    buff10_int <= not input(10);
                else
                    buff10_int <= input(10);
                end if;
                
                
                if mask(11) = '1' then
                    buff11_int <= not input(11);
                else
                    buff11_int <= input(11);
                end if;
                
                
                if mask(12) = '1' then
                    buff12_int <= not input(12);
                else
                    buff12_int <= input(12);
                end if;
                
                
                if mask(13) = '1' then
                    buff13_int <= not input(13);
                else
                    buff13_int <= input(13);
                end if;
                
                
                if mask(14) = '1' then
                    buff14_int <= not input(14);
                else
                    buff14_int <= input(14);
                end if;
                
                
                if mask(15) = '1' then
                    buff15_int <= not input(15);
                else
                    buff15_int <= input(15);
                end if;
                
                
                if mask(16) = '1' then
                    buff16_int <= not input(16);
                else
                    buff16_int <= input(16);
                end if;
                
                
                if mask(17) = '1' then
                    buff17_int <= not input(17);
                else
                    buff17_int <= input(17);
                end if;
                
                
                if mask(18) = '1' then
                    buff18_int <= not input(18);
                else
                    buff18_int <= input(18);
                end if;
                
                
                if mask(19) = '1' then
                    buff19_int <= not input(19);
                else
                    buff19_int <= input(19);
                end if;
                
                
                if mask(20) = '1' then
                    buff20_int <= not input(20);
                else
                    buff20_int <= input(20);
                end if;
                
                
                if mask(21) = '1' then
                    buff21_int <= not input(21);
                else
                    buff21_int <= input(21);
                end if;
                
                
                if mask(22) = '1' then
                    buff22_int <= not input(22);
                else
                    buff22_int <= input(22);
                end if;
                
                
                if mask(23) = '1' then
                    buff23_int <= not input(23);
                else
                    buff23_int <= input(23);
                end if;
                
                
                if mask(24) = '1' then
                    buff24_int <= not input(24);
                else
                    buff24_int <= input(24);
                end if;
                
                
                if mask(25) = '1' then
                    buff25_int <= not input(25);
                else
                    buff25_int <= input(25);
                end if;
                
                
                if mask(26) = '1' then
                    buff26_int <= not input(26);
                else
                    buff26_int <= input(26);
                end if;
                
                
                if mask(27) = '1' then
                    buff27_int <= not input(27);
                else
                    buff27_int <= input(27);
                end if;
                
                
                if mask(28) = '1' then
                    buff28_int <= not input(28);
                else
                    buff28_int <= input(28);
                end if;
                
                
                if mask(29) = '1' then
                    buff29_int <= not input(29);
                else
                    buff29_int <= input(29);
                end if;
                
                
                if mask(30) = '1' then
                    buff30_int <= not input(30);
                else
                    buff30_int <= input(30);
                end if;
                
                
                if mask(31) = '1' then
                    buff31_int <= not input(31);
                else
                    buff31_int <= input(31);
                end if;
                
                
                if mask(32) = '1' then
                    buff32_int <= not input(32);
                else
                    buff32_int <= input(32);
                end if;
                
                
                if mask(33) = '1' then
                    buff33_int <= not input(33);
                else
                    buff33_int <= input(33);
                end if;
                
                
                if mask(34) = '1' then
                    buff34_int <= not input(34);
                else
                    buff34_int <= input(34);
                end if;
                
                
                if mask(35) = '1' then
                    buff35_int <= not input(35);
                else
                    buff35_int <= input(35);
                end if;
                
                
                if mask(36) = '1' then
                    buff36_int <= not input(36);
                else
                    buff36_int <= input(36);
                end if;
                
                
                if mask(37) = '1' then
                    buff37_int <= not input(37);
                else
                    buff37_int <= input(37);
                end if;
                
                
                if mask(38) = '1' then
                    buff38_int <= not input(38);
                else
                    buff38_int <= input(38);
                end if;
                
                
                if mask(39) = '1' then
                    buff39_int <= not input(39);
                else
                    buff39_int <= input(39);
                end if;
                
                
                if mask(40) = '1' then
                    buff40_int <= not input(40);
                else
                    buff40_int <= input(40);
                end if;
                
                
                if mask(41) = '1' then
                    buff41_int <= not input(41);
                else
                    buff41_int <= input(41);
                end if;
                
                
                if mask(42) = '1' then
                    buff42_int <= not input(42);
                else
                    buff42_int <= input(42);
                end if;
                
                
                if mask(43) = '1' then
                    buff43_int <= not input(43);
                else
                    buff43_int <= input(43);
                end if;
                
                
                if mask(44) = '1' then
                    buff44_int <= not input(44);
                else
                    buff44_int <= input(44);
                end if;
                
                
                if mask(45) = '1' then
                    buff45_int <= not input(45);
                else
                    buff45_int <= input(45);
                end if;
                
                
                if mask(46) = '1' then
                    buff46_int <= not input(46);
                else
                    buff46_int <= input(46);
                end if;
                
                
                if mask(47) = '1' then
                    buff47_int <= not input(47);
                else
                    buff47_int <= input(47);
                end if;
                
                
                if mask(48) = '1' then
                    buff48_int <= not input(48);
                else
                    buff48_int <= input(48);
                end if;
                
                
                if mask(49) = '1' then
                    buff49_int <= not input(49);
                else
                    buff49_int <= input(49);
                end if;
                
                
                if mask(50) = '1' then
                    buff50_int <= not input(50);
                else
                    buff50_int <= input(50);
                end if;
                
                
                if mask(51) = '1' then
                    buff51_int <= not input(51);
                else
                    buff51_int <= input(51);
                end if;
                
                
                if mask(52) = '1' then
                    buff52_int <= not input(52);
                else
                    buff52_int <= input(52);
                end if;
                
                
                if mask(53) = '1' then
                    buff53_int <= not input(53);
                else
                    buff53_int <= input(53);
                end if;
                
                
                if mask(54) = '1' then
                    buff54_int <= not input(54);
                else
                    buff54_int <= input(54);
                end if;
                
                
                if mask(55) = '1' then
                    buff55_int <= not input(55);
                else
                    buff55_int <= input(55);
                end if;
                
                
                if mask(56) = '1' then
                    buff56_int <= not input(56);
                else
                    buff56_int <= input(56);
                end if;
                
                
                if mask(57) = '1' then
                    buff57_int <= not input(57);
                else
                    buff57_int <= input(57);
                end if;
                
                
                if mask(58) = '1' then
                    buff58_int <= not input(58);
                else
                    buff58_int <= input(58);
                end if;
                
                
                if mask(59) = '1' then
                    buff59_int <= not input(59);
                else
                    buff59_int <= input(59);
                end if;
                
                
                if mask(60) = '1' then
                    buff60_int <= not input(60);
                else
                    buff60_int <= input(60);
                end if;
                
                
                if mask(61) = '1' then
                    buff61_int <= not input(61);
                else
                    buff61_int <= input(61);
                end if;
                
                
                if mask(62) = '1' then
                    buff62_int <= not input(62);
                else
                    buff62_int <= input(62);
                end if;
                
                
                if mask(63) = '1' then
                    buff63_int <= not input(63);
                else
                    buff63_int <= input(63);
                end if;
                
                
                if mask(64) = '1' then
                    buff64_int <= not input(64);
                else
                    buff64_int <= input(64);
                end if;
            end if;
        end if;         
    END PROCESS;

	---------- Output Assignment ----------
    output <= buff1_int&buff2_int&buff3_int&buff4_int&buff5_int&buff6_int&buff7_int&buff8_int
              &buff9_int&buff10_int&buff11_int&buff12_int&buff13_int&buff14_int&buff15_int&buff16_int
              &buff17_int&buff18_int&buff19_int&buff20_int&buff21_int&buff22_int&buff23_int&buff24_int
              &buff25_int&buff26_int&buff27_int&buff28_int&buff29_int&buff30_int&buff31_int&buff32_int
              &buff33_int&buff34_int&buff35_int&buff36_int&buff37_int&buff38_int&buff39_int&buff40_int
              &buff41_int&buff42_int&buff43_int&buff44_int&buff45_int&buff46_int&buff47_int&buff48_int
              &buff49_int&buff50_int&buff51_int&buff52_int&buff53_int&buff54_int&buff55_int&buff56_int
              &buff57_int&buff58_int&buff59_int&buff60_int&buff61_int&buff62_int&buff63_int&buff64_int;
    
end Behavioral;
