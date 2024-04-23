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

entity adc_cfg_sel_mux is
    port (  sel    : in std_logic_vector(3 downto 0);
            output : out std_logic_vector(15 downto 0));
end adc_cfg_sel_mux;

architecture Behavioral of adc_cfg_sel_mux is
    
    -- all of this cfg codes assume an external reference is connected
    --constant continuous_read      : std_logic_vector(15 downto 0) := "0000000000000000"; -- send NOP to invalid reg addr but toggle CS with SCL
    --constant highres_8xosr_no_crc : std_logic_vector(15 downto 0) := "1001001011000110"; -- write to cfg1 reg
    --constant highres_4xosr_no_crc : std_logic_vector(15 downto 0) := "1001001010000110";
    --constant highres_2xosr_no_crc : std_logic_vector(15 downto 0) := "1001001001000110";
    constant lowres_8xosr_no_crc  : std_logic_vector(15 downto 0) := "1001001011000010";
    constant lowres_4xosr_no_crc  : std_logic_vector(15 downto 0) := "1001001010000010";
    constant lowres_2xosr_no_crc  : std_logic_vector(15 downto 0) := "1001001001000010";
    constant lowres_0xosr_no_crc  : std_logic_vector(15 downto 0) := "1001000000000010"; 
    constant force_sw_reset       : std_logic_vector(15 downto 0) := "1010000000111100"; -- write to cfg2 reg
    constant force_shutdown       : std_logic_vector(15 downto 0) := "1001000000000001"; -- write to cfg1 reg   
  
    -- read op to check setup   
    constant read_alert_reg       : std_logic_vector(15 downto 0) := "0011000000000000"; -- read from alert reg
    
begin

    output <= --continuous_read when sel      = "0000" else
              --highres_8xosr_no_crc when sel = "0001" else
              --highres_4xosr_no_crc when sel = "0010" else
              --highres_2xosr_no_crc when sel = "0011" else
              lowres_8xosr_no_crc  when sel = "0100" else
              lowres_4xosr_no_crc  when sel = "0101" else
              lowres_2xosr_no_crc  when sel = "0110" else
              lowres_0xosr_no_crc  when sel = "0111" else
              force_sw_reset when sel       = "1000" else
              force_shutdown when sel       = "1001" else -- unused
              read_alert_reg when sel       = "1010" else -- replace this to accept the 3 bit address from microblaze
              (others => '0');

end Behavioral;