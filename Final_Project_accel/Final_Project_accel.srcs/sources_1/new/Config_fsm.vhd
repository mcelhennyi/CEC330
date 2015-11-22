----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2015 06:11:52 PM
-- Design Name: 
-- Module Name: config_fsm - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Config_fsm is
    Port ( 
           FSM_CLOCK : in STD_LOGIC;--gives the FSM speed clock to configuration FSM
           CONFIG_EN : in STD_LOGIC;--starts the configuration FSM steps
           ADDR_DONE : in STD_LOGIC;--from ADXL362_com_fsm telling the transmission of data, addr, and cmd are done
           CONFIG_DONE : out STD_LOGIC;--Tells controlling FSM/module that the configuration of the accel is done
           TX_DATA: out STD_LOGIC_VECTOR(7 downto 0);--sends the data to transmit to ADXL_fsm
           TX_ADDR : out STD_LOGIC_VECTOR(7 downto 0);--sends addr data to ADXL_fsm 
           TX_CMD : out STD_LOGIC_VECTOR(7 downto 0);--sends to read or write command to ADXL_fsm
           START : out STD_LOGIC--starts the communication for one register location
           );
end Config_fsm;

architecture Behavioral of Config_fsm is
---------------------------------
--Signals------------------------
---------------------------------
--States for the FSM
type FSM_state_type is (
st1_wait, 
st2_prep_x20, st2_send_x20,
st3_prep_x21, st3_send_x21, 
st4_prep_x22, st4_send_x22, 
st5_prep_x23, st5_send_x23, 
st6_prep_x24, st6_send_x24, 
st7_prep_x25, st7_send_x25,  
st8_prep_x26, st8_send_x26, 
st9_prep_x27, st9_send_x27, 
st10_prep_x28, st10_send_x28, 
st11_prep_x29, st11_send_x29,
st12_prep_x2A, st12_send_x2A,
st13_prep_x2B, st13_send_x2B,
st14_prep_x2C, st14_send_x2C,
st15_prep_x2D, st15_send_x2D,
st16_buffer, 
st17_config_done); 
signal state, next_state : FSM_state_type;

begin
------------------------------------
--State Machine---------------------
------------------------------------
--Switches the state to the next state every clock cycle of CLK_IN
SYNC_PROC: process (FSM_CLOCK)
begin
    if (FSM_CLOCK'event and FSM_CLOCK = '1') then
        state <= next_state;
    end if;
end process;
--The operations of eache state
OUTPUT_DECODE: process (state)
begin
    case state is
        when st1_wait =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
        
        --x20 - x27 set up activity and inactivity threashold information
        when st2_prep_x20  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"20";
            TX_DATA <= "00000000";
            
        when st2_send_x20 => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';
            
        when st3_prep_x21  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"21";        
            TX_DATA <= "00000000";
        
        when st3_send_x21 => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';

        when st4_prep_x22  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"22";
            TX_DATA <= "00000000";
                        
        when st4_send_x22 => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';

        when st5_prep_x23  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"23";
            TX_DATA <= "00000000";
                                
        when st5_send_x23 => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';

        when st6_prep_x24  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"24";
            TX_DATA <= "00000000";
                                
        when st6_send_x24 => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';
            
        when st7_prep_x25  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"25";
            TX_DATA <= "00000000";
                                
        when st7_send_x25 => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';
                    
        when st8_prep_x26  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"26";
            TX_DATA <= "00000000";
                                
        when st8_send_x26 => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';
        
        when st9_prep_x27  => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"27";
            TX_DATA <= "00000000";
                                    
        when st9_send_x27 => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';
        
        --Sets the Fifo control register, bit 1 and 0 put it into stream mode, bit 2 enables temperature to be included in xyz data        
        when st10_prep_x28  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"28";
            TX_DATA <= "00001110";
                                        
        when st10_send_x28 => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';
        
        --Fifo samples register 
        when st11_prep_x29  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"29";
            TX_DATA <= "00001000";
                                           
        when st11_send_x29 => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';
        
        --interupts for the int1 pin  
        when st12_prep_x2A  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"2A";
            TX_DATA <= "00000000";
                                        
        when st12_send_x2A => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';
        
        --interupts for the int2 pin  
        when st13_prep_x2B  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"2B";
            TX_DATA <= "00000000";
                                        
        when st13_send_x2B => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';
        
        --Filter control register 
        --[7:6] - Measurement range: +/- 4g
        --[5] - Reserved
        --[4] - Half Bandwidth: 0
        --[3] - External clock/sample enable if 1 int2 takes clock and the clock is the main clock for the accel
        --[2:0] - Ouput data rate, 100 is 200Hz and 101...111 is 400Hz    
        when st14_prep_x2C  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"2C";
            TX_DATA <= "01000100";
                                        
        when st14_send_x2C => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';
        
        --Power Control register
        --[7] - reserved
        --[6] - ext_clk: 0 disables external clock
        --[5:4] - low_noise: 10 Ultra low noise mode
        --[3] - Wakeup mode: 0 does not operate in wakeup mode
        --[2] - Autosleep: disabled 0
        --[1:0] - measure: 10 measurement mode
        when st15_prep_x2D  =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';
            --prep stage
            TX_CMD <= x"0A";
            TX_ADDR <= x"2D";
            TX_DATA <= "00100010";
                                        
        when st15_send_x2D => 
            --state variables            
            CONFIG_DONE <= '0';
            START <= '1';
            
        when st16_buffer =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';       
             
        when st17_config_done =>
            --state variables            
            CONFIG_DONE <= '0';
            START <= '0';       

        when others => null;
    end case;
end process OUTPUT_DECODE;

--Chooses the next state depending on button presses
NEXT_STATE_DECODE: process (state, BTNC, BTNU)
begin
 next_state <= state;  
 
--state case statement to change a state on rising edge  
case (state) is
    when st1_wait =>
        if CONFIG_EN = '1' then
            next_state <= st2_prep_x20;
        end if;
        
    when st2_prep_x20  =>
        next_state <= st2_send_x20;
        
    when st2_send_x20 => 
        if ADDR_DONE = '1' then
            next_state <= st3_prep_x21;
        end if;
    when st3_prep_x21  =>
        next_state <= st3_send_x21;
                    
    when st3_send_x21 => 
        if ADDR_DONE = '1' then
            next_state <= st4_prep_x22;            
        end if;
    when st4_prep_x22  =>
        next_state <= st4_send_x22;
                    
    when st4_send_x22 => 
        if ADDR_DONE = '1' then
            next_state <= st5_prep_x23;    
        end if;
    when st5_prep_x23  =>
        next_state <= st5_send_x23;
                            
    when st5_send_x23 => 
        if ADDR_DONE = '1' then
            next_state <= st6_prep_x24;             
        end if;
    when st6_prep_x24  =>
        next_state <= st6_send_x24;
                            
    when st6_send_x24 => 
        if ADDR_DONE = '1' then
            next_state <= st7_prep_x25;
        end if;
        
    when st7_prep_x25  =>
        next_state <= st7_send_x25;
                            
    when st7_send_x25 => 
        if ADDR_DONE = '1' then
            next_state <= st8_prep_x26;
        end if;    
                
    when st8_prep_x26  =>
        next_state <= st8_send_x26;
                            
    when st8_send_x26 => 
        if ADDR_DONE = '1' then
            next_state <= st9_prep_x27;
        end if;            
     
    when st9_prep_x27  =>
        next_state <= st9_send_x27;
                                
    when st9_send_x27 => 
        if ADDR_DONE = '1' then
            next_state <= st10_prep_x28;
        end if;            
            
    when st10_prep_x28  =>
        next_state <= st10_send_x28;
                                    
    when st10_send_x28 => 
        if ADDR_DONE = '1' then
            next_state <= st11_prep_x29;
        end if;          
        
    when st11_prep_x29  =>
        next_state <= st11_send_x29;
                                    
    when st11_send_x29 => 
        if ADDR_DONE = '1' then
            next_state <= st12_prep_x2A;
        end if;                  
        
    when st12_prep_x2A  =>
        next_state <= st12_send_x2A;
                                    
    when st12_send_x2A => 
        if ADDR_DONE = '1' then
            next_state <= st13_prep_x2B;
        end if;   
        
    when st13_prep_x2B  =>
        next_state <= st13_send_x2B;
                                    
    when st13_send_x2B => 
        if ADDR_DONE = '1' then
            next_state <= st14_prep_x2C;
        end if;   
           
    when st14_prep_x2C  =>
        next_state <= st14_send_x2C;
                                    
    when st14_send_x2C => 
        if ADDR_DONE = '1' then
            next_state <= st15_prep_x2D;
        end if;   
           
    when st15_prep_x2D  =>
        next_state <= st15_send_x2D;
                                    
    when st15_send_x2D => 
        if ADDR_DONE = '1' then
            next_state <= st16_buffer;
        end if; 
        
    when st16_buffer =>
        next_state <= st17_config_done;

    when st17_config_done =>
--        next_state <= 
        
    when others => 
        
    
    end case;      
end process;


end Behavioral;
