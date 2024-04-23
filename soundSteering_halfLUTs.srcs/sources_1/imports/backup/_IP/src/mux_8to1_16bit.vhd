----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/14/2024 09:53:41 PM
-- Design Name: 
-- Module Name: adc_cfg_sel_mux - Behavioral
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

entity mux_8to1_16bit is
    port (  input  : in std_logic_vector(2 downto 0);
            addr   : in std_logic_vector(2 downto 0);
            sel    : in std_logic_vector(2 downto 0);
            output : out std_logic_vector(15 downto 0));
end mux_8to1_16bit;

architecture Behavioral of mux_8to1_16bit is
    
    constant lowres_8xosr_no_crc  : std_logic_vector(15 downto 0) := "1001001011000010";
    constant lowres_4xosr_no_crc  : std_logic_vector(15 downto 0) := "1001001010000010";
    constant lowres_2xosr_no_crc  : std_logic_vector(15 downto 0) := "1001001001000010";
    constant lowres_0xosr_no_crc  : std_logic_vector(15 downto 0) := "1001000000000010"; 
    constant force_sw_reset       : std_logic_vector(15 downto 0) := "1010000000111100"; -- write to cfg2 reg
    constant force_shutdown       : std_logic_vector(15 downto 0) := "1001000000000001"; -- write to cfg1 reg 
    constant zeroes12             : std_logic_vector(11 downto 0) := (others => '0');
    
begin

    output <= lowres_8xosr_no_crc when sel = "000" and input = "000" else -- sel = "000" SIGNIFIES A WRITE OP TO THE ADC
              lowres_4xosr_no_crc when sel = "000" and input = "001" else
              lowres_2xosr_no_crc when sel = "000" and input = "010" else
              lowres_0xosr_no_crc when sel = "000" and input = "011" else
              force_sw_reset      when sel = "001" else
              force_shutdown      when sel = "010" else -- unused
              (others => '0')     when sel = "011" else -- no op
              -- Ensure we only write to valid address locations. No other error feedback so just dont allow it
              '0'&"001"&zeroes12 when sel   = "111" and addr = "001" else -- SEL = "111" signifies a read op; the reg addr local to the ADC is taken from addr input port
              '0'&"010"&zeroes12 when sel   = "111" and addr = "010" else
              '0'&"011"&zeroes12 when sel   = "111" and addr = "011" else
              '0'&"100"&zeroes12 when sel   = "111" and addr = "100" else
              '0'&"101"&zeroes12 when sel   = "111" and addr = "101" else 
              (others => '1');

end Behavioral;