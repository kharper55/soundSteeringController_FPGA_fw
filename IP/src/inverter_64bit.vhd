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
  Port ( mask   : in std_logic_vector(1 to 64);
         input  : in std_logic_vector(1 to 64); 
         output : out std_logic_vector(1 to 64));
end inverter_64bit;

architecture Behavioral of inverter_64bit is

    signal buff1_int, buff2_int, buff3_int, buff4_int, buff5_int, buff6_int, buff7_int, buff8_int : std_logic := '0';
    signal buff9_int, buff10_int, buff11_int, buff12_int, buff13_int, buff14_int, buff15_int, buff16_int : std_logic := '0';
    signal buff17_int, buff18_int, buff19_int, buff20_int, buff21_int, buff22_int, buff23_int, buff24_int : std_logic := '0';
    signal buff25_int, buff26_int, buff27_int, buff28_int, buff29_int, buff30_int, buff31_int, buff32_int : std_logic := '0';
    signal buff33_int, buff34_int, buff35_int, buff36_int, buff37_int, buff38_int, buff39_int, buff40_int : std_logic := '0';
    signal buff41_int, buff42_int, buff43_int, buff44_int, buff45_int, buff46_int, buff47_int, buff48_int : std_logic := '0';
    signal buff49_int, buff50_int, buff51_int, buff52_int, buff53_int, buff54_int, buff55_int, buff56_int : std_logic := '0';
    signal buff57_int, buff58_int, buff59_int, buff60_int, buff61_int, buff62_int, buff63_int, buff64_int : std_logic := '0';

begin
    
    -- Asynchronous inversion --
    ---------- Internal Buffer Assignment ----------
    buff1_int <= not input(1) when mask(1) = '1' else
                 input(1);
    buff2_int <= not input(2) when mask(2) = '1' else
                 input(2);
    buff3_int <= not input(3) when mask(3) = '1' else
                 input(3);
    buff4_int <= not input(4) when mask(4) = '1' else
                 input(4);
    buff5_int <= not input(5) when mask(5) = '1' else
                 input(5);
    buff6_int <= not input(6) when mask(6) = '1' else
                 input(6);
    buff7_int <= not input(7) when mask(7) = '1' else
                 input(7);
    buff8_int <= not input(8) when mask(8) = '1' else
                 input(8);
    buff9_int <= not input(9) when mask(9) = '1' else
                 input(9);
    buff10_int <= not input(10) when mask(10) = '1' else
                  input(10);
    buff11_int <= not input(11) when mask(11) = '1' else
                  input(11);
    buff12_int <= not input(12) when mask(12) = '1' else
                  input(12);
    buff13_int <= not input(13) when mask(13) = '1' else
                  input(13);
    buff14_int <= not input(14) when mask(14) = '1' else
                  input(14);
    buff15_int <= not input(15) when mask(15) = '1' else
                  input(15);
    buff16_int <= not input(16) when mask(16) = '1' else
                  input(16);
    buff17_int <= not input(17) when mask(17) = '1' else
                  input(17);
    buff18_int <= not input(18) when mask(18) = '1' else
                  input(18);
    buff19_int <= not input(19) when mask(19) = '1' else
                  input(19);
    buff20_int <= not input(20) when mask(20) = '1' else
                  input(20);
    buff21_int <= not input(21) when mask(21) = '1' else
                  input(21);
    buff22_int <= not input(22) when mask(22) = '1' else
                  input(22);
    buff23_int <= not input(23) when mask(23) = '1' else
                  input(23);
    buff24_int <= not input(24) when mask(24) = '1' else
                  input(24);
    buff25_int <= not input(25) when mask(25) = '1' else
                  input(25);
    buff26_int <= not input(26) when mask(26) = '1' else
                  input(26);
    buff27_int <= not input(27) when mask(27) = '1' else
                  input(27);
    buff28_int <= not input(28) when mask(28) = '1' else
                  input(28);
    buff29_int <= not input(29) when mask(29) = '1' else
                  input(29);
    buff30_int <= not input(30) when mask(30) = '1' else
                  input(30);
    buff31_int <= not input(31) when mask(31) = '1' else
                  input(31);
    buff32_int <= not input(32) when mask(32) = '1' else
                  input(32);
    buff33_int <= not input(33) when mask(33) = '1' else
                  input(33);
    buff34_int <= not input(34) when mask(34) = '1' else
                  input(34);
    buff35_int <= not input(35) when mask(35) = '1' else
                  input(35);
    buff36_int <= not input(36) when mask(36) = '1' else
                  input(36);
    buff37_int <= not input(37) when mask(37) = '1' else
                  input(37);
    buff38_int <= not input(38) when mask(38) = '1' else
                  input(38);
    buff39_int <= not input(39) when mask(39) = '1' else
                  input(39);
    buff40_int <= not input(40) when mask(40) = '1' else
                  input(40);
    buff41_int <= not input(41) when mask(41) = '1' else
                  input(41);
    buff42_int <= not input(42) when mask(42) = '1' else
                  input(42);
    buff43_int <= not input(43) when mask(43) = '1' else
                  input(43);
    buff44_int <= not input(44) when mask(44) = '1' else
                  input(44);
    buff45_int <= not input(45) when mask(45) = '1' else
                  input(45);
    buff46_int <= not input(46) when mask(46) = '1' else
                  input(46);
    buff47_int <= not input(47) when mask(47) = '1' else
                  input(47);
    buff48_int <= not input(48) when mask(48) = '1' else
                  input(48);
    buff49_int <= not input(49) when mask(49) = '1' else
                  input(49);
    buff50_int <= not input(50) when mask(50) = '1' else
                  input(50);
    buff51_int <= not input(51) when mask(51) = '1' else
                  input(51);
    buff52_int <= not input(52) when mask(52) = '1' else
                  input(52);
    buff53_int <= not input(53) when mask(53) = '1' else
                  input(53);
    buff54_int <= not input(54) when mask(54) = '1' else
                  input(54);
    buff55_int <= not input(55) when mask(55) = '1' else
                  input(55);
    buff56_int <= not input(56) when mask(56) = '1' else
                  input(56);
    buff57_int <= not input(57) when mask(57) = '1' else
                  input(57);
    buff58_int <= not input(58) when mask(58) = '1' else
                  input(58);
    buff59_int <= not input(59) when mask(59) = '1' else
                  input(59);
    buff60_int <= not input(60) when mask(60) = '1' else
                  input(60);
    buff61_int <= not input(61) when mask(61) = '1' else
                  input(61);
    buff62_int <= not input(62) when mask(62) = '1' else
                  input(62);
    buff63_int <= not input(63) when mask(63) = '1' else
                  input(63);
    buff64_int <= not input(64) when mask(64) = '1' else
                  input(64);

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
