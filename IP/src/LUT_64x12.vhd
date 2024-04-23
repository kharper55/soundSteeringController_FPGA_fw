----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 04/12/2024 08:11:51 PM
-- Design Name: 
-- Module Name: shiftRAM - Behavioral
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

-- NOTE! THIS FILE AND ACCOOMPANYING DATAPATH LOGIC SHOULD BE FACTORED TO ONLY USE 32 LUTS. THE SYMMETRY OF THE ARRAY AFFORDS THIS.

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity LUT_64x12 is
  Port ( rst   : in std_logic;
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
end LUT_64x12;

architecture Behavioral of LUT_64x12 is
    
    -- ALL LUTS IN THIS DESIGN RESET TO 0
    
    ---------- Transducer 1 Component ----------
    component blk_mem_gen_1_1_1 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 2 Component ----------
    component blk_mem_gen_1_1_2 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 3 Component ----------
    component blk_mem_gen_1_1_3 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 4 Component ----------
    component blk_mem_gen_1_1_4 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 5 Component ----------
    component blk_mem_gen_1_1_5 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 6 Component ----------
    component blk_mem_gen_1_1_6 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 7 Component ----------
    component blk_mem_gen_1_1_7 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 8 Component ----------
    component blk_mem_gen_1_1_8 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 9 Component ----------
    component blk_mem_gen_1_1_9 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 10 Component ----------
    component blk_mem_gen_1_1_10 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 11 Component ----------
    component blk_mem_gen_1_1_11 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 12 Component ----------
    component blk_mem_gen_1_1_12 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 13 Component ----------
    component blk_mem_gen_1_1_13 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 14 Component ----------
    component blk_mem_gen_1_1_14 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 15 Component ----------
    component blk_mem_gen_1_1_15 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 16 Component ----------
    component blk_mem_gen_1_1_16 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 17 Component ----------
    component blk_mem_gen_1_1_17 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 18 Component ----------
    component blk_mem_gen_1_1_18 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 19 Component ----------
    component blk_mem_gen_1_1_19 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 20 Component ----------
    component blk_mem_gen_1_1_20 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 21 Component ----------
    component blk_mem_gen_1_1_21 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 22 Component ----------
    component blk_mem_gen_1_1_22 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 23 Component ----------
    component blk_mem_gen_1_1_23 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 24 Component ----------
    component blk_mem_gen_1_1_24 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 25 Component ----------
    component blk_mem_gen_1_1_25 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 26 Component ----------
    component blk_mem_gen_1_1_26 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 27 Component ----------
    component blk_mem_gen_1_1_27 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 28 Component ----------
    component blk_mem_gen_1_1_28 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 29 Component ----------
    component blk_mem_gen_1_1_29 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 30 Component ----------
    component blk_mem_gen_1_1_30 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 31 Component ----------
    component blk_mem_gen_1_1_31 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 32 Component ----------
    component blk_mem_gen_1_1_32 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 33 Component ----------
    component blk_mem_gen_1_1_33 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 34 Component ----------
    component blk_mem_gen_1_1_34 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 35 Component ----------
    component blk_mem_gen_1_1_35 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 36 Component ----------
    component blk_mem_gen_1_1_36 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 37 Component ----------
    component blk_mem_gen_1_1_37 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 38 Component ----------
    component blk_mem_gen_1_1_38 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 39 Component ----------
    component blk_mem_gen_1_1_39 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 40 Component ----------
    component blk_mem_gen_1_1_40 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 41 Component ----------
    component blk_mem_gen_1_1_41 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 42 Component ----------
    component blk_mem_gen_1_1_42 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 43 Component ----------
    component blk_mem_gen_1_1_43 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 44 Component ----------
    component blk_mem_gen_1_1_44 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 45 Component ----------
    component blk_mem_gen_1_1_45 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 46 Component ----------
    component blk_mem_gen_1_1_46 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 47 Component ----------
    component blk_mem_gen_1_1_47 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 48 Component ----------
    component blk_mem_gen_1_1_48 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 49 Component ----------
    component blk_mem_gen_1_1_49 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 50 Component ----------
    component blk_mem_gen_1_1_50 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 51 Component ----------
    component blk_mem_gen_1_1_51 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 52 Component ----------
    component blk_mem_gen_1_1_52 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 53 Component ----------
    component blk_mem_gen_1_1_53 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 54 Component ----------
    component blk_mem_gen_1_1_54 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 55 Component ----------
    component blk_mem_gen_1_1_55 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 56 Component ----------
    component blk_mem_gen_1_1_56 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 57 Component ----------
    component blk_mem_gen_1_1_57 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 58 Component ----------
    component blk_mem_gen_1_1_58 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 59 Component ----------
    component blk_mem_gen_1_1_59 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 60 Component ----------
    component blk_mem_gen_1_1_60 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 61 Component ----------
    component blk_mem_gen_1_1_61 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 62 Component ----------
    component blk_mem_gen_1_1_62 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 63 Component ----------
    component blk_mem_gen_1_1_63 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
    ---------- Transducer 64 Component ----------
    component blk_mem_gen_1_1_64 is
        port ( clka      : in std_logic;
               rsta      : in std_logic;
               addra     : in std_logic_vector(11 downto 0);
               douta     : out std_logic_vector(11 downto 0);
               rsta_busy : out std_logic);
    end component;
    
begin
    
    ---------- Transducer 1 Assignment ----------
    t1_lut : blk_mem_gen_1_1_1 port map ( clka      => rom_trig,
                                        rsta      => rst,
                                        addra     => addr,
                                        douta     => out1,
                                        rsta_busy => open);
    
    ---------- Transducer 2 Assignment ----------
    t2_lut : blk_mem_gen_1_1_2 port map ( clka      => rom_trig,
                                        rsta      => rst,
                                        addra     => addr,
                                        douta     => out2,
                                        rsta_busy => open);
    
    ---------- Transducer 3 Assignment ----------
    t3_lut : blk_mem_gen_1_1_3 port map ( clka      => rom_trig,
                                        rsta      => rst,
                                        addra     => addr,
                                        douta     => out3,
                                        rsta_busy => open);
    
    ---------- Transducer 4 Assignment ----------
    t4_lut : blk_mem_gen_1_1_4 port map ( clka      => rom_trig,
                                        rsta      => rst,
                                        addra     => addr,
                                        douta     => out4,
                                        rsta_busy => open);
    
    ---------- Transducer 5 Assignment ----------
    t5_lut : blk_mem_gen_1_1_5 port map ( clka      => rom_trig,
                                        rsta      => rst,
                                        addra     => addr,
                                        douta     => out5,
                                        rsta_busy => open);
    
    ---------- Transducer 6 Assignment ----------
    t6_lut : blk_mem_gen_1_1_6 port map ( clka      => rom_trig,
                                        rsta      => rst,
                                        addra     => addr,
                                        douta     => out6,
                                        rsta_busy => open);
    
    ---------- Transducer 7 Assignment ----------
    t7_lut : blk_mem_gen_1_1_7 port map ( clka      => rom_trig,
                                        rsta      => rst,
                                        addra     => addr,
                                        douta     => out7,
                                        rsta_busy => open);
    
    ---------- Transducer 8 Assignment ----------
    t8_lut : blk_mem_gen_1_1_8 port map ( clka      => rom_trig,
                                        rsta      => rst,
                                        addra     => addr,
                                        douta     => out8,
                                        rsta_busy => open);
    
    ---------- Transducer 9 Assignment ----------
    t9_lut : blk_mem_gen_1_1_9 port map ( clka      => rom_trig,
                                        rsta      => rst,
                                        addra     => addr,
                                        douta     => out9,
                                        rsta_busy => open);
    
    ---------- Transducer 10 Assignment ----------
    t10_lut : blk_mem_gen_1_1_10 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out10,
                                          rsta_busy => open);
    
    ---------- Transducer 11 Assignment ----------
    t11_lut : blk_mem_gen_1_1_11 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out11,
                                          rsta_busy => open);
    
    ---------- Transducer 12 Assignment ----------
    t12_lut : blk_mem_gen_1_1_12 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out12,
                                          rsta_busy => open);
    
    ---------- Transducer 13 Assignment ----------
    t13_lut : blk_mem_gen_1_1_13 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out13,
                                          rsta_busy => open);
    
    ---------- Transducer 14 Assignment ----------
    t14_lut : blk_mem_gen_1_1_14 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out14,
                                          rsta_busy => open);
    
    ---------- Transducer 15 Assignment ----------
    t15_lut : blk_mem_gen_1_1_15 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out15,
                                          rsta_busy => open);
    
    ---------- Transducer 16 Assignment ----------
    t16_lut : blk_mem_gen_1_1_16 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out16,
                                          rsta_busy => open);
    
    ---------- Transducer 17 Assignment ----------
    t17_lut : blk_mem_gen_1_1_17 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out17,
                                          rsta_busy => open);
    
    ---------- Transducer 18 Assignment ----------
    t18_lut : blk_mem_gen_1_1_18 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out18,
                                          rsta_busy => open);
    
    ---------- Transducer 19 Assignment ----------
    t19_lut : blk_mem_gen_1_1_19 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out19,
                                          rsta_busy => open);
    
    ---------- Transducer 20 Assignment ----------
    t20_lut : blk_mem_gen_1_1_20 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out20,
                                          rsta_busy => open);
    
    ---------- Transducer 21 Assignment ----------
    t21_lut : blk_mem_gen_1_1_21 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out21,
                                          rsta_busy => open);
    
    ---------- Transducer 22 Assignment ----------
    t22_lut : blk_mem_gen_1_1_22 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out22,
                                          rsta_busy => open);
    
    ---------- Transducer 23 Assignment ----------
    t23_lut : blk_mem_gen_1_1_23 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out23,
                                          rsta_busy => open);
    
    ---------- Transducer 24 Assignment ----------
    t24_lut : blk_mem_gen_1_1_24 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out24,
                                          rsta_busy => open);
    
    ---------- Transducer 25 Assignment ----------
    t25_lut : blk_mem_gen_1_1_25 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out25,
                                          rsta_busy => open);
    
    ---------- Transducer 26 Assignment ----------
    t26_lut : blk_mem_gen_1_1_26 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out26,
                                          rsta_busy => open);
    
    ---------- Transducer 27 Assignment ----------
    t27_lut : blk_mem_gen_1_1_27 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out27,
                                          rsta_busy => open);
    
    ---------- Transducer 28 Assignment ----------
    t28_lut : blk_mem_gen_1_1_28 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out28,
                                          rsta_busy => open);
    
    ---------- Transducer 29 Assignment ----------
    t29_lut : blk_mem_gen_1_1_29 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out29,
                                          rsta_busy => open);
    
    ---------- Transducer 30 Assignment ----------
    t30_lut : blk_mem_gen_1_1_30 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out30,
                                          rsta_busy => open);
    
    ---------- Transducer 31 Assignment ----------
    t31_lut : blk_mem_gen_1_1_31 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out31,
                                          rsta_busy => open);
    
    ---------- Transducer 32 Assignment ----------
    t32_lut : blk_mem_gen_1_1_32 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out32,
                                          rsta_busy => open);
    
    ---------- Transducer 33 Assignment ----------
    t33_lut : blk_mem_gen_1_1_33 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out33,
                                          rsta_busy => open);
    
    ---------- Transducer 34 Assignment ----------
    t34_lut : blk_mem_gen_1_1_34 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out34,
                                          rsta_busy => open);
    
    ---------- Transducer 35 Assignment ----------
    t35_lut : blk_mem_gen_1_1_35 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out35,
                                          rsta_busy => open);
    
    ---------- Transducer 36 Assignment ----------
    t36_lut : blk_mem_gen_1_1_36 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out36,
                                          rsta_busy => open);
    
    ---------- Transducer 37 Assignment ----------
    t37_lut : blk_mem_gen_1_1_37 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out37,
                                          rsta_busy => open);
    
    ---------- Transducer 38 Assignment ----------
    t38_lut : blk_mem_gen_1_1_38 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out38,
                                          rsta_busy => open);
    
    ---------- Transducer 39 Assignment ----------
    t39_lut : blk_mem_gen_1_1_39 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out39,
                                          rsta_busy => open);
    
    ---------- Transducer 40 Assignment ----------
    t40_lut : blk_mem_gen_1_1_40 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out40,
                                          rsta_busy => open);
    
    ---------- Transducer 41 Assignment ----------
    t41_lut : blk_mem_gen_1_1_41 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out41,
                                          rsta_busy => open);
    
    ---------- Transducer 42 Assignment ----------
    t42_lut : blk_mem_gen_1_1_42 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out42,
                                          rsta_busy => open);
    
    ---------- Transducer 43 Assignment ----------
    t43_lut : blk_mem_gen_1_1_43 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out43,
                                          rsta_busy => open);
    
    ---------- Transducer 44 Assignment ----------
    t44_lut : blk_mem_gen_1_1_44 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out44,
                                          rsta_busy => open);
    
    ---------- Transducer 45 Assignment ----------
    t45_lut : blk_mem_gen_1_1_45 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out45,
                                          rsta_busy => open);
    
    ---------- Transducer 46 Assignment ----------
    t46_lut : blk_mem_gen_1_1_46 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out46,
                                          rsta_busy => open);
    
    ---------- Transducer 47 Assignment ----------
    t47_lut : blk_mem_gen_1_1_47 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out47,
                                          rsta_busy => open);
    
    ---------- Transducer 48 Assignment ----------
    t48_lut : blk_mem_gen_1_1_48 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out48,
                                          rsta_busy => open);
    
    ---------- Transducer 49 Assignment ----------
    t49_lut : blk_mem_gen_1_1_49 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out49,
                                          rsta_busy => open);
    
    ---------- Transducer 50 Assignment ----------
    t50_lut : blk_mem_gen_1_1_50 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out50,
                                          rsta_busy => open);
    
    ---------- Transducer 51 Assignment ----------
    t51_lut : blk_mem_gen_1_1_51 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out51,
                                          rsta_busy => open);
    
    ---------- Transducer 52 Assignment ----------
    t52_lut : blk_mem_gen_1_1_52 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out52,
                                          rsta_busy => open);
    
    ---------- Transducer 53 Assignment ----------
    t53_lut : blk_mem_gen_1_1_53 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out53,
                                          rsta_busy => open);
    
    ---------- Transducer 54 Assignment ----------
    t54_lut : blk_mem_gen_1_1_54 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out54,
                                          rsta_busy => open);
    
    ---------- Transducer 55 Assignment ----------
    t55_lut : blk_mem_gen_1_1_55 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out55,
                                          rsta_busy => open);
    
    ---------- Transducer 56 Assignment ----------
    t56_lut : blk_mem_gen_1_1_56 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out56,
                                          rsta_busy => open);
    
    ---------- Transducer 57 Assignment ----------
    t57_lut : blk_mem_gen_1_1_57 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out57,
                                          rsta_busy => open);
    
    ---------- Transducer 58 Assignment ----------
    t58_lut : blk_mem_gen_1_1_58 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out58,
                                          rsta_busy => open);
    
    ---------- Transducer 59 Assignment ----------
    t59_lut : blk_mem_gen_1_1_59 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out59,
                                          rsta_busy => open);
    
    ---------- Transducer 60 Assignment ----------
    t60_lut : blk_mem_gen_1_1_60 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out60,
                                          rsta_busy => open);
    
    ---------- Transducer 61 Assignment ----------
    t61_lut : blk_mem_gen_1_1_61 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out61,
                                          rsta_busy => open);
    
    ---------- Transducer 62 Assignment ----------
    t62_lut : blk_mem_gen_1_1_62 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out62,
                                          rsta_busy => open);
    
    ---------- Transducer 63 Assignment ----------
    t63_lut : blk_mem_gen_1_1_63 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out63,
                                          rsta_busy => open);
    
    ---------- Transducer 64 Assignment ----------
    t64_lut : blk_mem_gen_1_1_64 port map ( clka      => rom_trig,
                                          rsta      => rst,
                                          addra     => addr,
                                          douta     => out64,
                                          rsta_busy => open);
    
end Behavioral;