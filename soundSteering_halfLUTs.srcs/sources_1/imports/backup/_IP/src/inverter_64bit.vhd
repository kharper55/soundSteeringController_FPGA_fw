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
    signal o_reg, o_next : std_logic_vector(1 to 64) := (others => '0');
    
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
                
                ---------- Internal Buffer Assignment ----------
                case (mask(1)) is
                    when '1' =>
                        buff1_int <= not input(1);
                    when others =>
                        buff1_int <= input(1);
                end case;
                
                case (mask(2)) is
                    when '1' =>
                        buff2_int <= not input(2);
                    when others =>
                        buff2_int <= input(2);
                end case;
                
                case (mask(3)) is
                    when '1' =>
                        buff3_int <= not input(3);
                    when others =>
                        buff3_int <= input(3);
                end case;
                
                case (mask(4)) is
                    when '1' =>
                        buff4_int <= not input(4);
                    when others =>
                        buff4_int <= input(4);
                end case;
                
                case (mask(5)) is
                    when '1' =>
                        buff5_int <= not input(5);
                    when others =>
                        buff5_int <= input(5);
                end case;
                
                case (mask(6)) is
                    when '1' =>
                        buff6_int <= not input(6);
                    when others =>
                        buff6_int <= input(6);
                end case;
                
                case (mask(7)) is
                    when '1' =>
                        buff7_int <= not input(7);
                    when others =>
                        buff7_int <= input(7);
                end case;
                
                case (mask(8)) is
                    when '1' =>
                        buff8_int <= not input(8);
                    when others =>
                        buff8_int <= input(8);
                end case;
                
                case (mask(9)) is
                    when '1' =>
                        buff9_int <= not input(9);
                    when others =>
                        buff9_int <= input(9);
                end case;
                
                case (mask(10)) is
                    when '1' =>
                        buff10_int <= not input(10);
                    when others =>
                        buff10_int <= input(10);
                end case;
                
                case (mask(11)) is
                    when '1' =>
                        buff11_int <= not input(11);
                    when others =>
                        buff11_int <= input(11);
                end case;
                
                case (mask(12)) is
                    when '1' =>
                        buff12_int <= not input(12);
                    when others =>
                        buff12_int <= input(12);
                end case;
                
                case (mask(13)) is
                    when '1' =>
                        buff13_int <= not input(13);
                    when others =>
                        buff13_int <= input(13);
                end case;
                
                case (mask(14)) is
                    when '1' =>
                        buff14_int <= not input(14);
                    when others =>
                        buff14_int <= input(14);
                end case;
                
                case (mask(15)) is
                    when '1' =>
                        buff15_int <= not input(15);
                    when others =>
                        buff15_int <= input(15);
                end case;
                
                case (mask(16)) is
                    when '1' =>
                        buff16_int <= not input(16);
                    when others =>
                        buff16_int <= input(16);
                end case;
                
                case (mask(17)) is
                    when '1' =>
                        buff17_int <= not input(17);
                    when others =>
                        buff17_int <= input(17);
                end case;
                
                case (mask(18)) is
                    when '1' =>
                        buff18_int <= not input(18);
                    when others =>
                        buff18_int <= input(18);
                end case;
                
                case (mask(19)) is
                    when '1' =>
                        buff19_int <= not input(19);
                    when others =>
                        buff19_int <= input(19);
                end case;
                
                case (mask(20)) is
                    when '1' =>
                        buff20_int <= not input(20);
                    when others =>
                        buff20_int <= input(20);
                end case;
                
                case (mask(21)) is
                    when '1' =>
                        buff21_int <= not input(21);
                    when others =>
                        buff21_int <= input(21);
                end case;
                
                case (mask(22)) is
                    when '1' =>
                        buff22_int <= not input(22);
                    when others =>
                        buff22_int <= input(22);
                end case;
                
                case (mask(23)) is
                    when '1' =>
                        buff23_int <= not input(23);
                    when others =>
                        buff23_int <= input(23);
                end case;
                
                case (mask(24)) is
                    when '1' =>
                        buff24_int <= not input(24);
                    when others =>
                        buff24_int <= input(24);
                end case;
                
                case (mask(25)) is
                    when '1' =>
                        buff25_int <= not input(25);
                    when others =>
                        buff25_int <= input(25);
                end case;
                
                case (mask(26)) is
                    when '1' =>
                        buff26_int <= not input(26);
                    when others =>
                        buff26_int <= input(26);
                end case;
                
                case (mask(27)) is
                    when '1' =>
                        buff27_int <= not input(27);
                    when others =>
                        buff27_int <= input(27);
                end case;
                
                case (mask(28)) is
                    when '1' =>
                        buff28_int <= not input(28);
                    when others =>
                        buff28_int <= input(28);
                end case;
                
                case (mask(29)) is
                    when '1' =>
                        buff29_int <= not input(29);
                    when others =>
                        buff29_int <= input(29);
                end case;
                
                case (mask(30)) is
                    when '1' =>
                        buff30_int <= not input(30);
                    when others =>
                        buff30_int <= input(30);
                end case;
                
                case (mask(31)) is
                    when '1' =>
                        buff31_int <= not input(31);
                    when others =>
                        buff31_int <= input(31);
                end case;
                
                case (mask(32)) is
                    when '1' =>
                        buff32_int <= not input(32);
                    when others =>
                        buff32_int <= input(32);
                end case;
                
                case (mask(33)) is
                    when '1' =>
                        buff33_int <= not input(33);
                    when others =>
                        buff33_int <= input(33);
                end case;
                
                case (mask(34)) is
                    when '1' =>
                        buff34_int <= not input(34);
                    when others =>
                        buff34_int <= input(34);
                end case;
                
                case (mask(35)) is
                    when '1' =>
                        buff35_int <= not input(35);
                    when others =>
                        buff35_int <= input(35);
                end case;
                
                case (mask(36)) is
                    when '1' =>
                        buff36_int <= not input(36);
                    when others =>
                        buff36_int <= input(36);
                end case;
                
                case (mask(37)) is
                    when '1' =>
                        buff37_int <= not input(37);
                    when others =>
                        buff37_int <= input(37);
                end case;
                
                case (mask(38)) is
                    when '1' =>
                        buff38_int <= not input(38);
                    when others =>
                        buff38_int <= input(38);
                end case;
                
                case (mask(39)) is
                    when '1' =>
                        buff39_int <= not input(39);
                    when others =>
                        buff39_int <= input(39);
                end case;
                
                case (mask(40)) is
                    when '1' =>
                        buff40_int <= not input(40);
                    when others =>
                        buff40_int <= input(40);
                end case;
                
                case (mask(41)) is
                    when '1' =>
                        buff41_int <= not input(41);
                    when others =>
                        buff41_int <= input(41);
                end case;
                
                case (mask(42)) is
                    when '1' =>
                        buff42_int <= not input(42);
                    when others =>
                        buff42_int <= input(42);
                end case;
                
                case (mask(43)) is
                    when '1' =>
                        buff43_int <= not input(43);
                    when others =>
                        buff43_int <= input(43);
                end case;
                
                case (mask(44)) is
                    when '1' =>
                        buff44_int <= not input(44);
                    when others =>
                        buff44_int <= input(44);
                end case;
                
                case (mask(45)) is
                    when '1' =>
                        buff45_int <= not input(45);
                    when others =>
                        buff45_int <= input(45);
                end case;
                
                case (mask(46)) is
                    when '1' =>
                        buff46_int <= not input(46);
                    when others =>
                        buff46_int <= input(46);
                end case;
                
                case (mask(47)) is
                    when '1' =>
                        buff47_int <= not input(47);
                    when others =>
                        buff47_int <= input(47);
                end case;
                
                case (mask(48)) is
                    when '1' =>
                        buff48_int <= not input(48);
                    when others =>
                        buff48_int <= input(48);
                end case;
                
                case (mask(49)) is
                    when '1' =>
                        buff49_int <= not input(49);
                    when others =>
                        buff49_int <= input(49);
                end case;
                
                case (mask(50)) is
                    when '1' =>
                        buff50_int <= not input(50);
                    when others =>
                        buff50_int <= input(50);
                end case;
                
                case (mask(51)) is
                    when '1' =>
                        buff51_int <= not input(51);
                    when others =>
                        buff51_int <= input(51);
                end case;
                
                case (mask(52)) is
                    when '1' =>
                        buff52_int <= not input(52);
                    when others =>
                        buff52_int <= input(52);
                end case;
                
                case (mask(53)) is
                    when '1' =>
                        buff53_int <= not input(53);
                    when others =>
                        buff53_int <= input(53);
                end case;
                
                case (mask(54)) is
                    when '1' =>
                        buff54_int <= not input(54);
                    when others =>
                        buff54_int <= input(54);
                end case;
                
                case (mask(55)) is
                    when '1' =>
                        buff55_int <= not input(55);
                    when others =>
                        buff55_int <= input(55);
                end case;
                
                case (mask(56)) is
                    when '1' =>
                        buff56_int <= not input(56);
                    when others =>
                        buff56_int <= input(56);
                end case;
                
                case (mask(57)) is
                    when '1' =>
                        buff57_int <= not input(57);
                    when others =>
                        buff57_int <= input(57);
                end case;
                
                case (mask(58)) is
                    when '1' =>
                        buff58_int <= not input(58);
                    when others =>
                        buff58_int <= input(58);
                end case;
                
                case (mask(59)) is
                    when '1' =>
                        buff59_int <= not input(59);
                    when others =>
                        buff59_int <= input(59);
                end case;
                
                case (mask(60)) is
                    when '1' =>
                        buff60_int <= not input(60);
                    when others =>
                        buff60_int <= input(60);
                end case;
                
                case (mask(61)) is
                    when '1' =>
                        buff61_int <= not input(61);
                    when others =>
                        buff61_int <= input(61);
                end case;
                
                case (mask(62)) is
                    when '1' =>
                        buff62_int <= not input(62);
                    when others =>
                        buff62_int <= input(62);
                end case;
                
                case (mask(63)) is
                    when '1' =>
                        buff63_int <= not input(63);
                    when others =>
                        buff63_int <= input(63);
                end case;
                
                case (mask(64)) is
                    when '1' =>
                        buff64_int <= not input(64);
                    when others =>
                        buff64_int <= input(64);
                end case;      
            end if;
        end if;         
    END PROCESS;
    
    PROCESS(CLK)
    begin
        if rising_edge(clk) then
            if rstn = '0' then 
                o_reg <= (others => '0');
            else 
                o_reg <= o_next;
            end if;
        end if;
    end process;
    
    o_next <= buff1_int&buff2_int&buff3_int&buff4_int&buff5_int&buff6_int&buff7_int&buff8_int
              &buff9_int&buff10_int&buff11_int&buff12_int&buff13_int&buff14_int&buff15_int&buff16_int
              &buff17_int&buff18_int&buff19_int&buff20_int&buff21_int&buff22_int&buff23_int&buff24_int
              &buff25_int&buff26_int&buff27_int&buff28_int&buff29_int&buff30_int&buff31_int&buff32_int
              &buff33_int&buff34_int&buff35_int&buff36_int&buff37_int&buff38_int&buff39_int&buff40_int
              &buff41_int&buff42_int&buff43_int&buff44_int&buff45_int&buff46_int&buff47_int&buff48_int
              &buff49_int&buff50_int&buff51_int&buff52_int&buff53_int&buff54_int&buff55_int&buff56_int
              &buff57_int&buff58_int&buff59_int&buff60_int&buff61_int&buff62_int&buff63_int&buff64_int;

	---------- Output Assignment ----------
    output <= o_reg;
    
end Behavioral;
