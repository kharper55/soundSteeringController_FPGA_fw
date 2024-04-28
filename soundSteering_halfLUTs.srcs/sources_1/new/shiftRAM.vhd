----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/16/2024 10:35:12 AM
-- Design Name: 
-- Module Name: shift_reg_2500 - Behavioral
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
    Port ( clk           : in STD_LOGIC;             -- Active high sys clk
           rstn          : in STD_LOGIC;             -- Active low sync rst
           --rom_trig      : in std_logic;             -- Rom strobe from fsm... replace with 100meg?
           clr           : in STD_LOGIC;             -- Toggled on a channel change
           mute          : in std_logic;             -- Active high mute function. Writes all zeroes to the pwm logic vector, effectively muting everything
           data          : in STD_LOGIC;             -- single bit pwm input data
           addr          : in STD_LOGIC_VECTOR(11 downto 0);  -- input steering coordinate from microblaze SPI (5bit AZ & 5bit EL)
           pwm           : out STD_LOGIC_VECTOR(1 to 64); -- individual pwm outputs for all transducers
           --shift_reg_out : out std_logic_vector(0 to 2500); -- Something to think about... are these indeces correct? I need 1250 to correspond to the center, 0 
           mutes         : in std_logic_vector(1 to 64);  -- Individual transducer mutes
           inverts       : in std_logic_vector(1 to 64);  -- Individual transducer inverts for phase reversal
           full          : out std_logic                  -- active high fifo full signal
           --counter12_out : out unsigned(11 downto 0);
           --tst_addr_offset_flg : out std_logic;
           --tst_addr_mismatch_flg : out std_logic;
           --tst_addr_reg : out std_logic_vector(10 downto 0) := (others => '0');
           --tst_addr_pipe_rega : out std_logic_vector(11 downto 0) := (others => '0');
           --tst_addr_pipe_regb : out std_logic_vector(11 downto 0) := (others => '0');
           --td1_out : out integer;
           --td2_out : out integer;
           --td3_out : out integer;
           --td4_out : out integer;
           --td5_out : out integer;
           --td6_out : out integer;
           --td7_out : out integer;
           --td8_out : out integer;
           --td9_out : out integer;
           --td10_out : out integer;
           --td11_out : out integer;
           --td12_out : out integer;
           --td13_out : out integer;
           --td14_out : out integer;
           --td15_out : out integer;
           --td16_out : out integer;
           --td17_out : out integer;
           --td18_out : out integer;
           --td19_out : out integer;
           --td20_out : out integer;
           --td21_out : out integer;
           --td22_out : out integer;
           --td23_out : out integer;
           --td24_out : out integer;
           --td25_out : out integer;
           --td26_out : out integer;
           --td27_out : out integer;
           --td28_out : out integer;
           --td29_out : out integer;
           --td30_out : out integer;
           --td31_out : out integer;
           --td32_out : out integer;
           --td33_out : out integer;
           --td34_out : out integer;
           --td35_out : out integer;
           --td36_out : out integer;
           --td37_out : out integer;
           --td38_out : out integer;
           --td39_out : out integer;
           --td40_out : out integer;
           --td41_out : out integer;
           --td42_out : out integer;
           --td43_out : out integer;
           --td44_out : out integer;
           --td45_out : out integer;
           --td46_out : out integer;
           --td47_out : out integer;
           --td48_out : out integer;
           --td49_out : out integer;
           --td50_out : out integer;
           --td51_out : out integer;
           --td52_out : out integer;
           --td53_out : out integer;
           --td54_out : out integer;
           --td55_out : out integer;
           --td56_out : out integer;
           --td57_out : out integer;
           --td58_out : out integer;
           --td59_out : out integer;
           --td60_out : out integer;
           --td61_out : out integer;
           --td62_out : out integer;
           --td63_out : out integer;
           --td64_out : out integer
           ); 
end shiftRAM;

architecture Behavioral of shiftRAM is

    constant SHIFT_REG_MAX : unsigned(11 downto 0) := to_unsigned(2500, 12); 
    constant ADDRESS_MAX_12BIT : unsigned(11 downto 0) := to_unsigned(1950, 12); 
    constant ADDRESS_MAX_11BIT : unsigned(10 downto 0) := to_unsigned(1950, 11); 

    signal shift_reg : std_logic_vector(0 to 2500) := (others => '0');
    signal pwm_reg : std_logic_vector(1 to 64) := (others => '0');
    signal count_reg : unsigned(11 downto 0) := SHIFT_REG_MAX;
    signal pwm_reg_buff : std_logic_vector(1 to 64) := (others => '0');
    signal addr_reg : std_logic_vector(10 downto 0) := (others => '0');
    signal full_reg : std_logic := '0';
    signal addr_mismatch_flg_reg_a, addr_mismatch_flg_reg_b : std_logic := '1';
    signal addr_offset_flg_reg : std_logic := '0';
    signal addr_temp_reg_a, addr_temp_reg_b : std_logic_vector(11 downto 0) := (others => '0');
    signal mutes_reg : std_logic_vector(1 to 64) := (others => '0');
    
    -- BRAM Output Data Values
    signal td1_int, td2_int, td3_int, td4_int, td5_int, td6_int, td7_int, td8_int         : std_logic_vector(11 downto 0) := (others => '0');
    signal td9_int, td10_int, td11_int, td12_int, td13_int, td14_int, td15_int, td16_int  : std_logic_vector(11 downto 0) := (others => '0');
    signal td17_int, td18_int, td19_int, td20_int, td21_int, td22_int, td23_int, td24_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td25_int, td26_int, td27_int, td28_int, td29_int, td30_int, td31_int, td32_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td33_int, td34_int, td35_int, td36_int, td37_int, td38_int, td39_int, td40_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td41_int, td42_int, td43_int, td44_int, td45_int, td46_int, td47_int, td48_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td49_int, td50_int, td51_int, td52_int, td53_int, td54_int, td55_int, td56_int : std_logic_vector(11 downto 0) := (others => '0');
    signal td57_int, td58_int, td59_int, td60_int, td61_int, td62_int, td63_int, td64_int : std_logic_vector(11 downto 0) := (others => '0');
    
    -- Registered BRAM Outputs + Cast for ShiftReg Indexing
    signal td1_reg, td2_reg, td3_reg, td4_reg, td5_reg, td6_reg, td7_reg, td8_reg         : integer range 0 to 2500 := 0; 
    signal td9_reg, td10_reg, td11_reg, td12_reg, td13_reg, td14_reg, td15_reg, td16_reg  : integer range 0 to 2500 := 0; 
    signal td17_reg, td18_reg, td19_reg, td20_reg, td21_reg, td22_reg, td23_reg, td24_reg : integer range 0 to 2500 := 0; 
    signal td25_reg, td26_reg, td27_reg, td28_reg, td29_reg, td30_reg, td31_reg, td32_reg : integer range 0 to 2500 := 0; 
    signal td33_reg, td34_reg, td35_reg, td36_reg, td37_reg, td38_reg, td39_reg, td40_reg : integer range 0 to 2500 := 0; 
    signal td41_reg, td42_reg, td43_reg, td44_reg, td45_reg, td46_reg, td47_reg, td48_reg : integer range 0 to 2500 := 0; 
    signal td49_reg, td50_reg, td51_reg, td52_reg, td53_reg, td54_reg, td55_reg, td56_reg : integer range 0 to 2500 := 0; 
    signal td57_reg, td58_reg, td59_reg, td60_reg, td61_reg, td62_reg, td63_reg, td64_reg : integer range 0 to 2500 := 0; 
    
    ------------------------------------------------------------------------------ 
    component inverter_64bit is
      Port ( clk    : in std_logic;
             rstn   : in std_logic;
             mask   : in std_logic_vector(1 to 64);
             input  : in std_logic_vector(1 to 64); 
             output : out std_logic_vector(1 to 64));
    end component;
 
    ---------- Transducer 1 Component ----------
    component blk_mem_gen_1_1_1 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 2 Component ----------
    component blk_mem_gen_1_1_2 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 3 Component ----------
    component blk_mem_gen_1_1_3 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 4 Component ----------
    component blk_mem_gen_1_1_4 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 5 Component ----------
    component blk_mem_gen_1_1_5 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 6 Component ----------
    component blk_mem_gen_1_1_6 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 7 Component ----------
    component blk_mem_gen_1_1_7 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 8 Component ----------
    component blk_mem_gen_1_1_8 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 9 Component ----------
    component blk_mem_gen_1_1_9 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 10 Component ----------
    component blk_mem_gen_1_1_10 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 11 Component ----------
    component blk_mem_gen_1_1_11 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 12 Component ----------
    component blk_mem_gen_1_1_12 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 13 Component ----------
    component blk_mem_gen_1_1_13 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 14 Component ----------
    component blk_mem_gen_1_1_14 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 15 Component ----------
    component blk_mem_gen_1_1_15 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 16 Component ----------
    component blk_mem_gen_1_1_16 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 17 Component ----------
    component blk_mem_gen_1_1_17 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 18 Component ----------
    component blk_mem_gen_1_1_18 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 19 Component ----------
    component blk_mem_gen_1_1_19 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 20 Component ----------
    component blk_mem_gen_1_1_20 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 21 Component ----------
    component blk_mem_gen_1_1_21 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 22 Component ----------
    component blk_mem_gen_1_1_22 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 23 Component ----------
    component blk_mem_gen_1_1_23 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 24 Component ----------
    component blk_mem_gen_1_1_24 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 25 Component ----------
    component blk_mem_gen_1_1_25 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 26 Component ----------
    component blk_mem_gen_1_1_26 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 27 Component ----------
    component blk_mem_gen_1_1_27 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 28 Component ----------
    component blk_mem_gen_1_1_28 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 29 Component ----------
    component blk_mem_gen_1_1_29 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 30 Component ----------
    component blk_mem_gen_1_1_30 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 31 Component ----------
    component blk_mem_gen_1_1_31 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 32 Component ----------
    component blk_mem_gen_1_1_32 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 33 Component ----------
    component blk_mem_gen_1_1_33 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 34 Component ----------
    component blk_mem_gen_1_1_34 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 35 Component ----------
    component blk_mem_gen_1_1_35 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 36 Component ----------
    component blk_mem_gen_1_1_36 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 37 Component ----------
    component blk_mem_gen_1_1_37 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 38 Component ----------
    component blk_mem_gen_1_1_38 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 39 Component ----------
    component blk_mem_gen_1_1_39 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 40 Component ----------
    component blk_mem_gen_1_1_40 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 41 Component ----------
    component blk_mem_gen_1_1_41 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 42 Component ----------
    component blk_mem_gen_1_1_42 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 43 Component ----------
    component blk_mem_gen_1_1_43 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 44 Component ----------
    component blk_mem_gen_1_1_44 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 45 Component ----------
    component blk_mem_gen_1_1_45 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 46 Component ----------
    component blk_mem_gen_1_1_46 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 47 Component ----------
    component blk_mem_gen_1_1_47 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 48 Component ----------
    component blk_mem_gen_1_1_48 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 49 Component ----------
    component blk_mem_gen_1_1_49 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 50 Component ----------
    component blk_mem_gen_1_1_50 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 51 Component ----------
    component blk_mem_gen_1_1_51 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 52 Component ----------
    component blk_mem_gen_1_1_52 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 53 Component ----------
    component blk_mem_gen_1_1_53 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 54 Component ----------
    component blk_mem_gen_1_1_54 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 55 Component ----------
    component blk_mem_gen_1_1_55 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 56 Component ----------
    component blk_mem_gen_1_1_56 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 57 Component ----------
    component blk_mem_gen_1_1_57 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 58 Component ----------
    component blk_mem_gen_1_1_58 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 59 Component ----------
    component blk_mem_gen_1_1_59 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 60 Component ----------
    component blk_mem_gen_1_1_60 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 61 Component ----------
    component blk_mem_gen_1_1_61 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 62 Component ----------
    component blk_mem_gen_1_1_62 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 63 Component ----------
    component blk_mem_gen_1_1_63 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
    ---------- Transducer 64 Component ----------
    component blk_mem_gen_1_1_64 is
        port ( clka      : in std_logic;
               addra     : in std_logic_vector(10 downto 0);
               douta     : out std_logic_vector(11 downto 0));
    end component;
    
begin

    phaseInverter : inverter_64bit port map ( clk    => clk,
                                              rstn   => rstn, 
                                              mask   => inverts,
                                              input  => pwm_reg,
                                              output => pwm_reg_buff );
                                              
    ---------- Transducer 1 Assignment ----------
    t1_lut : blk_mem_gen_1_1_1 port map ( clka      => clk,
                                          addra     => addr_reg,
                                          douta     => td1_int);
    
    ---------- Transducer 2 Assignment ----------
    t2_lut : blk_mem_gen_1_1_2 port map ( clka      => clk,
                                          addra     => addr_reg,
                                          douta     => td2_int);
        
    ---------- Transducer 3 Assignment ----------
    t3_lut : blk_mem_gen_1_1_3 port map ( clka      => clk,
                                          addra     => addr_reg,
                                          douta     => td3_int);
        
    ---------- Transducer 4 Assignment ----------
    t4_lut : blk_mem_gen_1_1_4 port map ( clka      => clk,
                                          addra     => addr_reg,
                                          douta     => td4_int);
        
    ---------- Transducer 5 Assignment ----------
    t5_lut : blk_mem_gen_1_1_5 port map ( clka      => clk,
                                          addra     => addr_reg,
                                          douta     => td5_int);
        
    ---------- Transducer 6 Assignment ----------
    t6_lut : blk_mem_gen_1_1_6 port map ( clka      => clk,
                                          addra     => addr_reg,
                                          douta     => td6_int);
        
    ---------- Transducer 7 Assignment ----------
    t7_lut : blk_mem_gen_1_1_7 port map ( clka      => clk,
                                          addra     => addr_reg,
                                          douta     => td7_int);
        
    ---------- Transducer 8 Assignment ----------
    t8_lut : blk_mem_gen_1_1_8 port map ( clka      => clk,
                                          addra     => addr_reg,
                                          douta     => td8_int);
        
    ---------- Transducer 9 Assignment ----------
    t9_lut : blk_mem_gen_1_1_9 port map ( clka      => clk,
                                          addra     => addr_reg,
                                          douta     => td9_int);
        
    ---------- Transducer 10 Assignment ----------
    t10_lut : blk_mem_gen_1_1_10 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td10_int);
        
    ---------- Transducer 11 Assignment ----------
    t11_lut : blk_mem_gen_1_1_11 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td11_int);
        
    ---------- Transducer 12 Assignment ----------
    t12_lut : blk_mem_gen_1_1_12 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td12_int);
        
    ---------- Transducer 13 Assignment ----------
    t13_lut : blk_mem_gen_1_1_13 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td13_int);
        
    ---------- Transducer 14 Assignment ----------
    t14_lut : blk_mem_gen_1_1_14 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td14_int);
        
    ---------- Transducer 15 Assignment ----------
    t15_lut : blk_mem_gen_1_1_15 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td15_int);
        
    ---------- Transducer 16 Assignment ----------
    t16_lut : blk_mem_gen_1_1_16 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td16_int);
        
    ---------- Transducer 17 Assignment ----------
    t17_lut : blk_mem_gen_1_1_17 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td17_int);
        
    ---------- Transducer 18 Assignment ----------
    t18_lut : blk_mem_gen_1_1_18 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td18_int);
        
    ---------- Transducer 19 Assignment ----------
    t19_lut : blk_mem_gen_1_1_19 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td19_int);
        
    ---------- Transducer 20 Assignment ----------
    t20_lut : blk_mem_gen_1_1_20 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td20_int);
        
    ---------- Transducer 21 Assignment ----------
    t21_lut : blk_mem_gen_1_1_21 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td21_int);
        
    ---------- Transducer 22 Assignment ----------
    t22_lut : blk_mem_gen_1_1_22 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td22_int);
        
    ---------- Transducer 23 Assignment ----------
    t23_lut : blk_mem_gen_1_1_23 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td23_int);
        
    ---------- Transducer 24 Assignment ----------
    t24_lut : blk_mem_gen_1_1_24 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td24_int);
        
    ---------- Transducer 25 Assignment ----------
    t25_lut : blk_mem_gen_1_1_25 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td25_int);
        
    ---------- Transducer 26 Assignment ----------
    t26_lut : blk_mem_gen_1_1_26 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td26_int);
        
    ---------- Transducer 27 Assignment ----------
    t27_lut : blk_mem_gen_1_1_27 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td27_int);
        
    ---------- Transducer 28 Assignment ----------
    t28_lut : blk_mem_gen_1_1_28 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td28_int);
        
    ---------- Transducer 29 Assignment ----------
    t29_lut : blk_mem_gen_1_1_29 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td29_int);
        
    ---------- Transducer 30 Assignment ----------
    t30_lut : blk_mem_gen_1_1_30 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td30_int);
        
    ---------- Transducer 31 Assignment ----------
    t31_lut : blk_mem_gen_1_1_31 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td31_int);
        
    ---------- Transducer 32 Assignment ----------
    t32_lut : blk_mem_gen_1_1_32 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td32_int);
        
    ---------- Transducer 33 Assignment ----------
    t33_lut : blk_mem_gen_1_1_33 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td33_int);
        
    ---------- Transducer 34 Assignment ----------
    t34_lut : blk_mem_gen_1_1_34 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td34_int);
        
    ---------- Transducer 35 Assignment ----------
    t35_lut : blk_mem_gen_1_1_35 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td35_int);
        
    ---------- Transducer 36 Assignment ----------
    t36_lut : blk_mem_gen_1_1_36 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td36_int);
        
    ---------- Transducer 37 Assignment ----------
    t37_lut : blk_mem_gen_1_1_37 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td37_int);
        
    ---------- Transducer 38 Assignment ----------
    t38_lut : blk_mem_gen_1_1_38 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td38_int);
        
    ---------- Transducer 39 Assignment ----------
    t39_lut : blk_mem_gen_1_1_39 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td39_int);
        
    ---------- Transducer 40 Assignment ----------
    t40_lut : blk_mem_gen_1_1_40 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td40_int);
        
    ---------- Transducer 41 Assignment ----------
    t41_lut : blk_mem_gen_1_1_41 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td41_int);
        
    ---------- Transducer 42 Assignment ----------
    t42_lut : blk_mem_gen_1_1_42 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td42_int);
        
    ---------- Transducer 43 Assignment ----------
    t43_lut : blk_mem_gen_1_1_43 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td43_int);
        
    ---------- Transducer 44 Assignment ----------
    t44_lut : blk_mem_gen_1_1_44 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td44_int);
        
    ---------- Transducer 45 Assignment ----------
    t45_lut : blk_mem_gen_1_1_45 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td45_int);
        
    ---------- Transducer 46 Assignment ----------
    t46_lut : blk_mem_gen_1_1_46 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td46_int);
        
    ---------- Transducer 47 Assignment ----------
    t47_lut : blk_mem_gen_1_1_47 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td47_int);
        
    ---------- Transducer 48 Assignment ----------
    t48_lut : blk_mem_gen_1_1_48 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td48_int);
        
    ---------- Transducer 49 Assignment ----------
    t49_lut : blk_mem_gen_1_1_49 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td49_int);
        
    ---------- Transducer 50 Assignment ----------
    t50_lut : blk_mem_gen_1_1_50 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td50_int);
        
    ---------- Transducer 51 Assignment ----------
    t51_lut : blk_mem_gen_1_1_51 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td51_int);
        
    ---------- Transducer 52 Assignment ----------
    t52_lut : blk_mem_gen_1_1_52 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td52_int);
        
    ---------- Transducer 53 Assignment ----------
    t53_lut : blk_mem_gen_1_1_53 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td53_int);
        
    ---------- Transducer 54 Assignment ----------
    t54_lut : blk_mem_gen_1_1_54 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td54_int);
        
    ---------- Transducer 55 Assignment ----------
    t55_lut : blk_mem_gen_1_1_55 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td55_int);
        
    ---------- Transducer 56 Assignment ----------
    t56_lut : blk_mem_gen_1_1_56 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td56_int);
        
    ---------- Transducer 57 Assignment ----------
    t57_lut : blk_mem_gen_1_1_57 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td57_int);
        
    ---------- Transducer 58 Assignment ----------
    t58_lut : blk_mem_gen_1_1_58 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td58_int);
        
    ---------- Transducer 59 Assignment ----------
    t59_lut : blk_mem_gen_1_1_59 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td59_int);
        
    ---------- Transducer 60 Assignment ----------
    t60_lut : blk_mem_gen_1_1_60 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td60_int);
        
    ---------- Transducer 61 Assignment ----------
    t61_lut : blk_mem_gen_1_1_61 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td61_int);
        
    ---------- Transducer 62 Assignment ----------
    t62_lut : blk_mem_gen_1_1_62 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td62_int);
        
    ---------- Transducer 63 Assignment ----------
    t63_lut : blk_mem_gen_1_1_63 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td63_int);
        
    ---------- Transducer 64 Assignment ----------
    t64_lut : blk_mem_gen_1_1_64 port map ( clka      => clk,
                                            addra     => addr_reg,
                                            douta     => td64_int);

    -- shift_reg process                                                                                        
    process(clk)
	begin
	   if rising_edge(clk) then -- changed to rising edge 04/24
	       --if clr = '1' or rstn = '0' then -- removed rst clr on 04/24, to omit from timing analysis and save on routing resources
	       --    shift_reg <= (others => '0');
	       --else
	        shift_reg <= data&shift_reg(0 to 2499);  -- Highest order bit gets lost off the end. Ie index 2500 corresponds to the longest positive delay, and 0 the largest negative delay (1250 center)
	       --end if;
	   end if;
	end process;
	
	-- counting process for full flag                                                                                   
    process(clk)
	begin
	   if rising_edge(clk) then
	       if clr = '1' or rstn = '0' then -- changed to rising edge 04/24
	           count_reg <= SHIFT_REG_MAX;
	       else
	           case(to_integer(count_reg)) is
	               when 0 =>
	                   count_reg <= count_reg;
	               when others =>
	                   count_reg <= count_reg - to_unsigned(1, 12);
	           end case;
	       end if;
	   end if;
	end process;
	
	-- full_Reg
    process(clk)
	begin
	   if rising_edge(clk) then
	       if clr = '1' or rstn = '0' then 
	           full_reg <= '0';
	       else
	           case(to_integer(count_reg)) is 
	               when 0 =>
	                   full_reg <= '1';
	               when others =>
	                   full_reg <= '0';
	            end case;
           end if;
	   end if;
    end process;
	
	-- register process for pwm time delay outputs
	process(clk)
	begin
	   if rising_edge(clk) then
	       if rstn = '0' then -- or mute = '1'
	           pwm_reg <= (others => '0');
	       else
	           case(mute) is
	               when '0' =>
                       case(full_reg) is
                           when '1' =>
                               -- PWM reg update
                                pwm_reg <= shift_reg(td1_reg)&shift_reg(td2_reg)&shift_reg(td3_reg)&shift_reg(td4_reg)                
                                            &shift_reg(td5_reg)&shift_reg(td6_reg)&shift_reg(td7_reg)&shift_reg(td8_reg)                
                                            &shift_reg(td9_reg)&shift_reg(td10_reg)&shift_reg(td11_reg)&shift_reg(td12_reg)                
                                            &shift_reg(td13_reg)&shift_reg(td14_reg)&shift_reg(td15_reg)&shift_reg(td16_reg)                
                                            &shift_reg(td17_reg)&shift_reg(td18_reg)&shift_reg(td19_reg)&shift_reg(td20_reg)                
                                            &shift_reg(td21_reg)&shift_reg(td22_reg)&shift_reg(td23_reg)&shift_reg(td24_reg)                
                                            &shift_reg(td25_reg)&shift_reg(td26_reg)&shift_reg(td27_reg)&shift_reg(td28_reg)                
                                            &shift_reg(td29_reg)&shift_reg(td30_reg)&shift_reg(td31_reg)&shift_reg(td32_reg)                
                                            &shift_reg(td33_reg)&shift_reg(td34_reg)&shift_reg(td35_reg)&shift_reg(td36_reg)                
                                            &shift_reg(td37_reg)&shift_reg(td38_reg)&shift_reg(td39_reg)&shift_reg(td40_reg)                
                                            &shift_reg(td41_reg)&shift_reg(td42_reg)&shift_reg(td43_reg)&shift_reg(td44_reg)                
                                            &shift_reg(td45_reg)&shift_reg(td46_reg)&shift_reg(td47_reg)&shift_reg(td48_reg)                
                                            &shift_reg(td49_reg)&shift_reg(td50_reg)&shift_reg(td51_reg)&shift_reg(td52_reg)                
                                            &shift_reg(td53_reg)&shift_reg(td54_reg)&shift_reg(td55_reg)&shift_reg(td56_reg)                
                                            &shift_reg(td57_reg)&shift_reg(td58_reg)&shift_reg(td59_reg)&shift_reg(td60_reg)                
                                            &shift_reg(td61_reg)&shift_reg(td62_reg)&shift_reg(td63_reg)&shift_reg(td64_reg);
                           when others =>
                                 pwm_reg <= (others => '0'); -- this else cast should be in agreement with the rst val
                           end case;
                   when others =>
                        pwm_reg <= (others => '0');
               end case;
           end if;
	   end if;
    end process;
    
	-- addr_reg process                                                                                        
    process(clk)
	begin
	   if rising_edge(clk) then -- changed to rising edge 04/24
	       if clr = '1' or rstn = '0' then
	           addr_temp_reg_a      <= (others => '0');
	           addr_temp_reg_b      <= (others => '0');
	           addr_reg             <= (others => '0');
	       else
               addr_temp_reg_a <= addr;
               addr_temp_reg_b <= addr_temp_reg_a;
	            
	           case(addr_offset_flg_reg) is
                   when '1' =>
                       -- Had to do some funny stuff here to ensure 11 bit math performed, as addr input port is 12 bits, but addr_reg is only 11!
                       addr_reg <= std_logic_vector(((ADDRESS_MAX_11BIT - unsigned(addr_temp_reg_b(10 downto 0))) + ADDRESS_MAX_11BIT));
                   when others =>
                       addr_reg <= addr_temp_reg_b(10 downto 0);
               end case;
               
	       end if;
	   end if;
	end process;
	
	---------- Addr Offset Flag Register Process ----------
	process(clk)
	begin
	   if rising_edge(clk) then
	       if clr = '1' or rstn = '0' then
	           addr_offset_flg_reg <= '0';
	       else
	           if (unsigned(addr_temp_reg_a) > ADDRESS_MAX_12BIT) then 
	               addr_offset_flg_reg <= '1';
	           elsif (unsigned(addr_temp_reg_a) <= ADDRESS_MAX_12BIT) then
	               addr_offset_flg_reg <= '0';
	           end if;
	       end if;
	   end if;
	end process;
	
	---------- Addr Temp Value Mismatch Internal Flag Register Process ----------
	-- This signal acts as a gate; it disallows any updates of the address while high
	process(clk)
	begin
	   if rising_edge(clk) then
	       if rstn = '0' then
	           addr_mismatch_flg_reg_a <= '1';
	           addr_mismatch_flg_reg_b <= '1';
	       else
	            if (addr = addr_temp_reg_b) then            
                    addr_mismatch_flg_reg_a <= '0';
                else
                    addr_mismatch_flg_reg_a <= '1';
                end if;
                
                addr_mismatch_flg_reg_b <= addr_mismatch_flg_reg_a; -- delayed copy
	       end if;
	   end if;
	end process;
	
	---------- BRAM Output Data Register Process ----------
	process(clk)
	begin
	   if rising_edge(clk) then
	       if rstn = '0' then
	            td1_reg  <= 0;
                td2_reg  <= 0;
                td3_reg  <= 0;
                td4_reg  <= 0;
                td5_reg  <= 0;
                td6_reg  <= 0;
                td7_reg  <= 0;
                td8_reg  <= 0;
                td9_reg  <= 0;
                td10_reg <= 0;
                td11_reg <= 0;
                td12_reg <= 0;
                td13_reg <= 0;
                td14_reg <= 0;
                td15_reg <= 0;
                td16_reg <= 0;
                td17_reg <= 0;
                td18_reg <= 0;
                td19_reg <= 0;
                td20_reg <= 0;
                td21_reg <= 0;
                td22_reg <= 0;
                td23_reg <= 0;
                td24_reg <= 0;
                td25_reg <= 0;
                td26_reg <= 0;
                td27_reg <= 0;
                td28_reg <= 0;
                td29_reg <= 0;
                td30_reg <= 0;
                td31_reg <= 0;
                td32_reg <= 0;
                td33_reg <= 0;
                td34_reg <= 0;
                td35_reg <= 0;
                td36_reg <= 0;
                td37_reg <= 0;
                td38_reg <= 0;
                td39_reg <= 0;
                td40_reg <= 0;
                td41_reg <= 0;
                td42_reg <= 0;
                td43_reg <= 0;
                td44_reg <= 0;
                td45_reg <= 0;
                td46_reg <= 0;
                td47_reg <= 0;
                td48_reg <= 0;
                td49_reg <= 0;
                td50_reg <= 0;
                td51_reg <= 0;
                td52_reg <= 0;
                td53_reg <= 0;
                td54_reg <= 0;
                td55_reg <= 0;
                td56_reg <= 0;
                td57_reg <= 0;
                td58_reg <= 0;
                td59_reg <= 0;
                td60_reg <= 0;
                td61_reg <= 0;
                td62_reg <= 0;
                td63_reg <= 0;
                td64_reg <= 0;
	       else
	            case(addr_mismatch_flg_reg_b) is
	               when '0' =>
                       case(addr_offset_flg_reg) is
                            when '1' =>
                                td1_reg  <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td1_int))));
                                td2_reg  <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td2_int))));
                                td3_reg  <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td3_int))));
                                td4_reg  <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td4_int))));
                                td5_reg  <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td5_int))));
                                td6_reg  <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td6_int))));
                                td7_reg  <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td7_int))));
                                td8_reg  <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td8_int))));
                                td9_reg  <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td9_int))));
                                td10_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td10_int))));
                                td11_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td11_int))));
                                td12_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td12_int))));
                                td13_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td13_int))));
                                td14_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td14_int))));
                                td15_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td15_int))));
                                td16_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td16_int))));
                                td17_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td17_int))));
                                td18_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td18_int))));
                                td19_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td19_int))));
                                td20_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td20_int))));
                                td21_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td21_int))));
                                td22_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td22_int))));
                                td23_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td23_int))));
                                td24_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td24_int))));
                                td25_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td25_int))));
                                td26_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td26_int))));
                                td27_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td27_int))));
                                td28_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td28_int))));
                                td29_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td29_int))));
                                td30_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td30_int))));
                                td31_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td31_int))));
                                td32_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td32_int))));
                                td33_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td33_int))));
                                td34_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td34_int))));
                                td35_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td35_int))));
                                td36_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td36_int))));
                                td37_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td37_int))));
                                td38_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td38_int))));
                                td39_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td39_int))));
                                td40_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td40_int))));
                                td41_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td41_int))));
                                td42_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td42_int))));
                                td43_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td43_int))));
                                td44_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td44_int))));
                                td45_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td45_int))));
                                td46_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td46_int))));
                                td47_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td47_int))));
                                td48_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td48_int))));
                                td49_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td49_int))));
                                td50_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td50_int))));
                                td51_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td51_int))));
                                td52_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td52_int))));
                                td53_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td53_int))));
                                td54_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td54_int))));
                                td55_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td55_int))));
                                td56_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td56_int))));
                                td57_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td57_int))));
                                td58_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td58_int))));
                                td59_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td59_int))));
                                td60_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td60_int))));
                                td61_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td61_int))));
                                td62_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td62_int))));
                                td63_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td63_int))));
                                td64_reg <= to_integer(unsigned(std_logic_vector(SHIFT_REG_MAX - unsigned(td64_int))));
                            when others =>
                                td1_reg  <= to_integer(unsigned(td1_int));
                                td2_reg  <= to_integer(unsigned(td2_int));
                                td3_reg  <= to_integer(unsigned(td3_int));
                                td4_reg  <= to_integer(unsigned(td4_int));
                                td5_reg  <= to_integer(unsigned(td5_int));
                                td6_reg  <= to_integer(unsigned(td6_int));
                                td7_reg  <= to_integer(unsigned(td7_int));
                                td8_reg  <= to_integer(unsigned(td8_int));
                                td9_reg  <= to_integer(unsigned(td9_int));
                                td10_reg <= to_integer(unsigned(td10_int));
                                td11_reg <= to_integer(unsigned(td11_int));
                                td12_reg <= to_integer(unsigned(td12_int));
                                td13_reg <= to_integer(unsigned(td13_int));
                                td14_reg <= to_integer(unsigned(td14_int));
                                td15_reg <= to_integer(unsigned(td15_int));
                                td16_reg <= to_integer(unsigned(td16_int));
                                td17_reg <= to_integer(unsigned(td17_int));
                                td18_reg <= to_integer(unsigned(td18_int));
                                td19_reg <= to_integer(unsigned(td19_int));
                                td20_reg <= to_integer(unsigned(td20_int));
                                td21_reg <= to_integer(unsigned(td21_int));
                                td22_reg <= to_integer(unsigned(td22_int));
                                td23_reg <= to_integer(unsigned(td23_int));
                                td24_reg <= to_integer(unsigned(td24_int));
                                td25_reg <= to_integer(unsigned(td25_int));
                                td26_reg <= to_integer(unsigned(td26_int));
                                td27_reg <= to_integer(unsigned(td27_int));
                                td28_reg <= to_integer(unsigned(td28_int));
                                td29_reg <= to_integer(unsigned(td29_int));
                                td30_reg <= to_integer(unsigned(td30_int));
                                td31_reg <= to_integer(unsigned(td31_int));
                                td32_reg <= to_integer(unsigned(td32_int));
                                td33_reg <= to_integer(unsigned(td33_int));
                                td34_reg <= to_integer(unsigned(td34_int));
                                td35_reg <= to_integer(unsigned(td35_int));
                                td36_reg <= to_integer(unsigned(td36_int));
                                td37_reg <= to_integer(unsigned(td37_int));
                                td38_reg <= to_integer(unsigned(td38_int));
                                td39_reg <= to_integer(unsigned(td39_int));
                                td40_reg <= to_integer(unsigned(td40_int));
                                td41_reg <= to_integer(unsigned(td41_int));
                                td42_reg <= to_integer(unsigned(td42_int));
                                td43_reg <= to_integer(unsigned(td43_int));
                                td44_reg <= to_integer(unsigned(td44_int));
                                td45_reg <= to_integer(unsigned(td45_int));
                                td46_reg <= to_integer(unsigned(td46_int));
                                td47_reg <= to_integer(unsigned(td47_int));
                                td48_reg <= to_integer(unsigned(td48_int));
                                td49_reg <= to_integer(unsigned(td49_int));
                                td50_reg <= to_integer(unsigned(td50_int));
                                td51_reg <= to_integer(unsigned(td51_int));
                                td52_reg <= to_integer(unsigned(td52_int));
                                td53_reg <= to_integer(unsigned(td53_int));
                                td54_reg <= to_integer(unsigned(td54_int));
                                td55_reg <= to_integer(unsigned(td55_int));
                                td56_reg <= to_integer(unsigned(td56_int));
                                td57_reg <= to_integer(unsigned(td57_int));
                                td58_reg <= to_integer(unsigned(td58_int));
                                td59_reg <= to_integer(unsigned(td59_int));
                                td60_reg <= to_integer(unsigned(td60_int));
                                td61_reg <= to_integer(unsigned(td61_int));
                                td62_reg <= to_integer(unsigned(td62_int));
                                td63_reg <= to_integer(unsigned(td63_int));
                                td64_reg <= to_integer(unsigned(td64_int));
                        end case;   
                   when others =>
                        td1_reg  <= td1_reg;
                        td2_reg  <= td2_reg;
                        td3_reg  <= td3_reg;
                        td4_reg  <= td4_reg;
                        td5_reg  <= td5_reg;
                        td6_reg  <= td6_reg;
                        td7_reg  <= td7_reg;
                        td8_reg  <= td8_reg;
                        td9_reg  <= td9_reg;
                        td10_reg <= td10_reg;
                        td11_reg <= td11_reg;
                        td12_reg <= td12_reg;
                        td13_reg <= td13_reg;
                        td14_reg <= td14_reg;
                        td15_reg <= td15_reg;
                        td16_reg <= td16_reg;
                        td17_reg <= td17_reg;
                        td18_reg <= td18_reg;
                        td19_reg <= td19_reg;
                        td20_reg <= td20_reg;
                        td21_reg <= td21_reg;
                        td22_reg <= td22_reg;
                        td23_reg <= td23_reg;
                        td24_reg <= td24_reg;
                        td25_reg <= td25_reg;
                        td26_reg <= td26_reg;
                        td27_reg <= td27_reg;
                        td28_reg <= td28_reg;
                        td29_reg <= td29_reg;
                        td30_reg <= td30_reg;
                        td31_reg <= td31_reg;
                        td32_reg <= td32_reg;
                        td33_reg <= td33_reg;
                        td34_reg <= td34_reg;
                        td35_reg <= td35_reg;
                        td36_reg <= td36_reg;
                        td37_reg <= td37_reg;
                        td38_reg <= td38_reg;
                        td39_reg <= td39_reg;
                        td40_reg <= td40_reg;
                        td41_reg <= td41_reg;
                        td42_reg <= td42_reg;
                        td43_reg <= td43_reg;
                        td44_reg <= td44_reg;
                        td45_reg <= td45_reg;
                        td46_reg <= td46_reg;
                        td47_reg <= td47_reg;
                        td48_reg <= td48_reg;
                        td49_reg <= td49_reg;
                        td50_reg <= td50_reg;
                        td51_reg <= td51_reg;
                        td52_reg <= td52_reg;
                        td53_reg <= td53_reg;
                        td54_reg <= td54_reg;
                        td55_reg <= td55_reg;
                        td56_reg <= td56_reg;
                        td57_reg <= td57_reg;
                        td58_reg <= td58_reg;
                        td59_reg <= td59_reg;
                        td60_reg <= td60_reg;
                        td61_reg <= td61_reg;
                        td62_reg <= td62_reg;
                        td63_reg <= td63_reg;
                        td64_reg <= td64_reg;
               end case;       
	       end if;
	   end if;
	end process;
	
	---------- Individual transducer mute register process  ----------
	process(clk)
	begin
	   if rising_edge(clk) then
	       if clr = '1' or rstn = '0' then
	           mutes_reg <= (others => '0');
	       else
	           mutes_reg <= mutes;
	       end if;
	   end if;
	end process;

    -- Output assignments
    pwm      <= pwm_reg_buff and mutes_reg;
    full     <= full_reg;
   
    -- Test signals
    --shift_reg_out         <= shift_reg;
    --counter12_out         <= count_reg;
    --tst_addr_offset_flg   <= addr_offset_flg_reg;
    --tst_addr_mismatch_flg <= addr_mismatch_flg_reg_b;
    --tst_addr_pipe_rega    <= addr_temp_reg_a;
    --tst_addr_pipe_regb    <= addr_temp_reg_b;
    --tst_addr_reg          <= addr_reg;
    
    --td1_out  <= td1_reg;
    --td2_out  <= td2_reg;
    --td3_out  <= td3_reg;
    --td4_out  <= td4_reg;
    --td5_out  <= td5_reg;
    --td6_out  <= td6_reg;
    --td7_out  <= td7_reg;
    --td8_out  <= td8_reg;
    --td9_out  <= td9_reg;
    --td10_out <= td10_reg;
    --td11_out <= td11_reg;
    --td12_out <= td12_reg;
    --td13_out <= td13_reg;
    --td14_out <= td14_reg;
    --td15_out <= td15_reg;
    --td16_out <= td16_reg;
    --td17_out <= td17_reg;
    --td18_out <= td18_reg;
    --td19_out <= td19_reg;
    --td20_out <= td20_reg;
    --td21_out <= td21_reg;
    --td22_out <= td22_reg;
    --td23_out <= td23_reg;
    --td24_out <= td24_reg;
    --td25_out <= td25_reg;
    --td26_out <= td26_reg;
    --td27_out <= td27_reg;
    --td28_out <= td28_reg;
    --td29_out <= td29_reg;
    --td30_out <= td30_reg;
    --td31_out <= td31_reg;
    --td32_out <= td32_reg;
    --td33_out <= td33_reg;
    --td34_out <= td34_reg;
    --td35_out <= td35_reg;
    --td36_out <= td36_reg;
    --td37_out <= td37_reg;
    --td38_out <= td38_reg;
    --td39_out <= td39_reg;
    --td40_out <= td40_reg;
    --td41_out <= td41_reg;
    --td42_out <= td42_reg;
    --td43_out <= td43_reg;
    --td44_out <= td44_reg;
    --td45_out <= td45_reg;
    --td46_out <= td46_reg;
    --td47_out <= td47_reg;
    --td48_out <= td48_reg;
    --td49_out <= td49_reg;
    --td50_out <= td50_reg;
    --td51_out <= td51_reg;
    --td52_out <= td52_reg;
    --td53_out <= td53_reg;
    --td54_out <= td54_reg;
    --td55_out <= td55_reg;
    --td56_out <= td56_reg;
    --td57_out <= td57_reg;
    --td58_out <= td58_reg;
    --td59_out <= td59_reg;
    --td60_out <= td60_reg;
    --td61_out <= td61_reg;
    --td62_out <= td62_reg;
    --td63_out <= td63_reg;
    --td64_out <= td64_reg;

end Behavioral;