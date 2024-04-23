----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01/15/2024 01:58:18 AM
-- Design Name: 
-- Module Name: serial_adc_pwm_fsm - Behavioral
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

-- need to take command input from gpio periph
-- high 16 bits are for steering, low 16 bits are for commands
entity serial_adc_pwm_fsm is
    port( 
          -- FSM System Input Ports
          clk               : in std_logic;            -- Main clock input (intended for system clock for fast state cycling)
          rstn              : in std_logic;            -- System rst
          
          -- FSM Inputs
          counter_done      : in std_logic;                     -- counter_done from serial peripheral - used to advance the state machine
          fifo_full         : in std_logic;
          flag              : in std_logic;  -- flag that channel has changed (need to empty fifo and wiat for full flag)
          reg_read          : in std_logic;
          reconfig          : in std_logic;
          en                : in std_logic;
          
          -- FSM Outputs
          sda_reg_clr       : out std_logic;            -- Clears SDA reg... ?
		  adc_en            : out std_logic;            -- Signal to datapath for starting a conversion or 16-bit register r/w operation);
          gpio_level        : out std_logic;
		  rom_strobe        : out std_logic;            -- Strobes ROM s_axi_aclk for updating the LUT output based on an input addr change (counter_done goes high)
          sdi_sel           : out std_logic_vector(2 downto 0);
          shiftreg_clr      : out std_logic;
          flag_ack          : out std_logic;
          fan_pwm_en        : out std_logic; -- these signals are simply anded with the enable bit from the axi registers to provide some sync with the FSM
          tx_active_pwm_en  : out std_logic;
          heartbeat_pwm_en  : out std_logic;
          rom_trig          : out std_logic;
          state             : out unsigned(4 downto 0)); -- Internal state output for debugging purposes); -- Stores commands for configuring the ADC in any one of the possible operating modes. See below for config options.
end serial_adc_pwm_fsm;

architecture Behavioral of serial_adc_pwm_fsm is

-- signals and components here
type STATE_NAMES is (STATE_A, STATE_B, STATE_C, STATE_D, STATE_E, STATE_F, STATE_G, STATE_H, STATE_I, STATE_J);
signal CURRENT_STATE, NEXT_STATE : STATE_NAMES; 

begin

    process(clk)
    begin
        if rising_edge(clk) then
            if rstn = '0' then
                CURRENT_STATE <= STATE_A;
            else
                CURRENT_STATE <= NEXT_STATE;
            end if;
        end if;
    end process;
    
    --mb_cmd format bits(15:7) - empty, bit 6 - adc_start_trig, bit 5 - chan sel for pwm output, bit 4 - chan sel for microblaze output, bits (3:0) - adc cfg
    --process(CURRENT_STATE, NEXT_STATE, en, counter_done, fifo_full, flag, reg_read, reconfig)
    process(CURRENT_STATE, en, counter_done, fifo_full, flag, reg_read, reconfig)
    --process(CURRENT_STATE)
    begin
        case CURRENT_STATE is
        
            -- Reset state
            when STATE_A =>
                if en = '1' then
                    NEXT_STATE <= STATE_B;
                else
                    NEXT_STATE <= STATE_A;
                end if;
                
             -- ADC init state; defaults to 16 bit with 8x oversampling. Reconfiguration is possible by writing bit 0 of axi slv reg 65 low (disabling module), then writing bit 1 high (reconfig = '1'), then loading bits 5:3 with the code for the desired configuration (see table), and retoggling bit 0 to high (enable) of the same reg.
             when STATE_B =>
                if counter_done = '0' then -- NOTE: COUNTER_DONE REFEERS TO THE CYCLE COUNTER DRIVING ADC SERIAL COMMS AT 40MHz, INTRODUCING A CLOCK DOMAIN CROSSING. THIS SIGNAL IS DOUBLE FLOPPED TO PREVENT METASTIBILITY ISSUEES AND TO SYNC WITH FASTER CLK
                    NEXT_STATE <= STATE_J;
                else
                    NEXT_STATE <= STATE_B;
                end if;
             
             -- Buffer state to ensure that counter done toggles (this signal is sync'd to the slower, 40MHz system clock used for ADC serial comms)
             when STATE_J =>
                if counter_done = '1' then -- NOTE: COUNTER_DONE REFEERS TO THE CYCLE COUNTER DRIVING ADC SERIAL COMMS AT 40MHz, INTRODUCING A CLOCK DOMAIN CROSSING. THIS SIGNAL IS DOUBLE FLOPPED TO PREVENT METASTIBILITY ISSUEES AND TO SYNC WITH FASTER CLK
                    NEXT_STATE <= STATE_C;
                else
                    NEXT_STATE <= STATE_J;
                end if;
                
             -- System Idle State
             when STATE_C =>
                if (en = '1' and fifo_full = '1') and flag = '0' then -- Enter main audio loop
                    NEXT_STATE <= STATE_D;
                elsif flag = '1' then                -- User requested channel change, enter fifo refill loop
                    NEXT_STATE <= STATE_H;  
                elsif reconfig = '1' then            -- User requested adc reconfig, go back to state A and wait for re-enable
                    NEXT_STATE <= STATE_A;  
                elsif reg_read = '1' then            -- User requested adc register readback. Take specified address from axi reg 65 (LOCAL ADC CTRL REG) and perform read op via sdi, cs, scl channels
                    NEXT_STATE <= STATE_F;
                else                                 -- Remain in the idle state           
                    NEXT_STATE <= STATE_C;
                end if;
             
             -- ADC simultaneous continuous conversion state entry
             when STATE_D =>
                if counter_done = '0' then
                    NEXT_STATE <= STATE_E;     -- Serial comms cycle counter has started (1uS cycles at 40MHz). Advance to next state and check user requests
                else
                    NEXT_STATE <= STATE_D;
                end if;
             
             -- ADC simultaneous continuous conversion state exit
             when STATE_E =>
                if en = '0' or flag = '1' then  -- Back out to idle state as the user has disabled the component, and or a channel change has occurred, requiring a FIFO refill (takes 25uS, ie 2500 * 10nS clk period)
                    NEXT_STATE <= STATE_C;
                elsif counter_done = '1' then   -- Go back to state D and continue getting conversions
                    NEXT_STATE <= STATE_D;
                else
                    NEXT_STATE <= STATE_E;      -- Remain in this state until cycle complete
                end if;
                
             -- ADC register readback entry state
             when STATE_F =>
                if counter_done = '1' then
                    NEXT_STATE <= STATE_G;
                else
                    NEXT_STATE <= STATE_F;
                end if;
              
              -- ADC register readback exit state (propagate NOP and fill sdoa with data from ADC)
              when STATE_G =>
                if counter_done = '1' then -- stop conversion
                    NEXT_STATE <= STATE_C;
                else
                    NEXT_STATE <= STATE_G;
                end if;   
                
              -- Begin refill FIFO state (channel change)
              when STATE_H =>
                    NEXT_STATE <= STATE_I;
               
              -- FIFO refill loop   
              when STATE_I =>
                if fifo_full = '1' then 
                    NEXT_STATE <= STATE_C;
                else
                    NEXT_STATE <= STATE_I;
                end if;   
           
              -- If we get here there are serious issues
              when others =>
                    NEXT_STATE <= STATE_A;
        end case;
    end process;
    
    process(CURRENT_STATE)
    begin
        case CURRENT_STATE is
        
            -- Reset/Preinitialized State
            when (STATE_A) =>
                sda_reg_clr          <= '1'; -- '1' to manually clear the contents of the shift register for serial A/D comms                 
                adc_en               <= '0'; -- '1' start, '0' for disabled                
		        rom_strobe           <= '0'; -- '1' to clock the ROM that contains the mapping of 2's complement ADC data to counts for PWM
                sdi_sel              <= "000"; -- This is muxed with a debug port from axi register...
                gpio_level           <= '0';
                shiftreg_clr         <= '1';    -- changed to 1 on 04/15
		        flag_ack             <= '0';
		        fan_pwm_en           <= '0';
                tx_active_pwm_en     <= '0';
                heartbeat_pwm_en     <= '0';
                rom_trig             <= '0';
                state                <= to_unsigned(1, 5);  -- debug port for observing the current state of the system

            -- ADC init state; defaults to 16 bit with 8x oversampling. Reconfiguration is possible by writing bit 0 of axi slv reg 65 low (disabling module), then writing bit 1 high (reconfig = '1'), then loading bits 5:3 with the code for the desired configuration (see table), and retoggling bit 0 to high (enable) of the same reg.
		    when (STATE_B) =>
		        sda_reg_clr          <= '0'; -- '1' to manually clear the contents of the shift register for serial A/D comms                
                adc_en               <= '1'; -- '1' start, '0' for disabled                     
		        rom_strobe           <= '0'; -- '1' to clock the ROM that contains the mapping of 2's complement ADC data to counts for PWM
                sdi_sel              <= "000"; -- "0001" sets for 18bit, 8x osr, external vref operation. these bits are from "mb_cmd" 18 bit bus from microblaze
                gpio_level           <= '0';
                shiftreg_clr         <= '0';
                flag_ack             <= '0';
                fan_pwm_en           <= '1';
                tx_active_pwm_en     <= '1';
                heartbeat_pwm_en     <= '1';
                rom_trig             <= '0';
                state                <= to_unsigned(2, 5);  -- debug port for observing the current state of the system
             
             -- Extra buffer state
             when (STATE_J) =>
		        sda_reg_clr          <= '0'; -- '1' to manually clear the contents of the shift register for serial A/D comms                
                adc_en               <= '1'; -- '1' start, '0' for disabled                     
		        rom_strobe           <= '0'; -- '1' to clock the ROM that contains the mapping of 2's complement ADC data to counts for PWM
                sdi_sel              <= "000"; -- "0001" sets for 18bit, 8x osr, external vref operation. these bits are from "mb_cmd" 18 bit bus from microblaze
                gpio_level           <= '0';
                shiftreg_clr         <= '0';
                flag_ack             <= '0';
                fan_pwm_en           <= '1';
                tx_active_pwm_en     <= '1';
                heartbeat_pwm_en     <= '1';
                rom_trig             <= '0';
                state                <= to_unsigned(10, 5);  -- debug port for observing the current state of the system

             -- System Idle State
             when (STATE_C) =>
                sda_reg_clr          <= '0'; -- '1' to manually clear the contents of the shift register for serial A/D comms                 
                adc_en               <= '0'; -- '1' start, '0' for disabled                
		        rom_strobe           <= '0'; -- '1' to clock the ROM that contains the mapping of 2's complement ADC data to counts for PWM
                sdi_sel              <= "011"; -- "0001" sets for 18bit, 8x osr, external vref operation. these bits are from "mb_cmd" 18 bit bus from microblaze
                gpio_level           <= '0';
                shiftreg_clr         <= '0';
                flag_ack             <= '0';
                fan_pwm_en           <= '1';
                tx_active_pwm_en     <= '1';
                heartbeat_pwm_en     <= '1';
                rom_trig             <= '0';
                state                <= to_unsigned(3, 5);  -- debug port for observing the current state of the system
            
            -- ADC simultaneous continuous conversion state entry
            when (STATE_D) => 
                sda_reg_clr          <= '0'; -- '1' to manually clear the contents of the shift register for serial A/D comms            	   
                adc_en               <= '1'; -- '1' start, '0' for disabled                         
		        rom_strobe           <= '1'; -- '1' to clock the ROM that contains the mapping of 2's complement ADC data to counts for PWM
                sdi_sel              <= "011"; -- No OP/All zeroes
                gpio_level           <= '1';
                shiftreg_clr         <= '0';
                flag_ack             <= '0';
                fan_pwm_en           <= '1';
                tx_active_pwm_en     <= '1';
                heartbeat_pwm_en     <= '1';
                rom_trig             <= '1';
                state                <= to_unsigned(4, 5);  -- debug port for observing the current state of the system
             
             -- ADC simultaneous continuous conversion state exit
             when (STATE_E) =>
                sda_reg_clr          <= '0'; -- '1' to manually clear the contents of the shift register for serial A/D comms	    
                adc_en               <= '1'; -- '1' start, '0' for disabled                        
		        rom_strobe           <= '0'; -- '1' to clock the ROM that contains the mapping of 2's complement ADC data to counts for PWM
                sdi_sel              <= "011"; -- No OP/All zeroes
                gpio_level           <= '1';
                shiftreg_clr         <= '0';
                flag_ack             <= '0';
                fan_pwm_en           <= '1';
                tx_active_pwm_en     <= '1';
                heartbeat_pwm_en     <= '1';
                rom_trig             <= '0';
                state                <= to_unsigned(5, 5);  -- debug port for observing the current state of the system
                
             -- ADC register readback entry state
             when (STATE_F) =>
                sda_reg_clr          <= '0'; -- '1' to manually clear the contents of the shift register for serial A/D comms               
                adc_en               <= '1'; -- '1' start, '0' for disabled                
		        rom_strobe           <= '0'; -- '1' to clock the ROM that contains the mapping of 2's complement ADC data to counts for PWM
                sdi_sel              <= "111"; -- READ REG
                gpio_level           <= '0';
                shiftreg_clr         <= '0';
                flag_ack             <= '0';
                fan_pwm_en           <= '1';
                tx_active_pwm_en     <= '1';
                heartbeat_pwm_en     <= '1';
                rom_trig             <= '0';
                state                <= to_unsigned(6, 5);  -- debug port for observing the current state of the system
                
            -- ADC register readback exit state (propagate NOP and fill sdoa with data from ADC)
            when (STATE_G) =>
                sda_reg_clr          <= '0'; -- '1' to manually clear the contents of the shift register for serial A/D comms                    
                adc_en               <= '1'; -- '1' start, '0' for disabled                 
		        rom_strobe           <= '0'; -- '1' to clock the ROM that contains the mapping of 2's complement ADC data to counts for PWM
                sdi_sel              <= "011";
                gpio_level           <= '0';
                shiftreg_clr         <= '0';
                flag_ack             <= '0';
                fan_pwm_en           <= '1';
                tx_active_pwm_en     <= '1';
                heartbeat_pwm_en     <= '1';
                rom_trig             <= '0';
                state                <= to_unsigned(7, 5);  -- debug port for observing the current state of the system
            
            -- Begin refill FIFO state (channel change)
            when (STATE_H) =>
                sda_reg_clr          <= '0'; -- '1' to manually clear the contents of the shift register for serial A/D comms                    
                adc_en               <= '0'; -- '1' start, '0' for disabled                 
		        rom_strobe           <= '0'; -- '1' to clock the ROM that contains the mapping of 2's complement ADC data to counts for PWM
                sdi_sel              <= "011";
                gpio_level           <= '0';
                shiftreg_clr         <= '1';
                flag_ack             <= '1';
                fan_pwm_en           <= '1';
                tx_active_pwm_en     <= '1';
                heartbeat_pwm_en     <= '1';
                rom_trig             <= '0';
                state                <= to_unsigned(8, 5);  -- debug port for observing the current state of the system
            
            -- FIFO refill loop   
            when (STATE_I) =>
                sda_reg_clr          <= '0'; -- '1' to manually clear the contents of the shift register for serial A/D comms                    
                adc_en               <= '0'; -- '1' start, '0' for disabled                 
		        rom_strobe           <= '0'; -- '1' to clock the ROM that contains the mapping of 2's complement ADC data to counts for PWM
                sdi_sel              <= "011"; -- READ ALERT REG
                gpio_level           <= '0';
                shiftreg_clr         <= '0'; 
                flag_ack             <= '0';
                fan_pwm_en           <= '1';
                tx_active_pwm_en     <= '1';
                heartbeat_pwm_en     <= '1';
                rom_trig             <= '0';
                state                <= to_unsigned(9, 5);  -- debug port for observing the current state of the system
                   
            -- Identical outputs as rst state    
            when others =>
                sda_reg_clr          <= '1'; -- '1' to manually clear the contents of the shift register for serial A/D comms                 
                adc_en               <= '0'; -- '1' start, '0' for disabled                
		        rom_strobe           <= '0'; -- '1' to clock the ROM that contains the mapping of 2's complement ADC data to counts for PWM
                sdi_sel              <= "011"; -- This is muxed with a debug port from axi register...
                gpio_level           <= '0';
                shiftreg_clr         <= '1';    -- changed to 1 on 04/15
		        flag_ack             <= '0';
		        fan_pwm_en           <= '0';
                tx_active_pwm_en     <= '0';
                heartbeat_pwm_en     <= '0';
                rom_trig             <= '0';
                state                <= to_unsigned(0, 5);  -- debug port for observing the current state of the system
        end case;
    end process;
    
end Behavioral;

