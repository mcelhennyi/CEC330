----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/21/2015 06:11:11 PM
-- Design Name: 
-- Module Name: Read_accel_fsm - Behavioral
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

entity Read_accel_fsm is
    Port ( FSM_CLOCK : in STD_LOGIC;--gives the FSM speed clock to configuration FSM
           READ_EN : in STD_LOGIC;--starts the read FSM steps
           RX_DATA : out STD_LOGIC_VECTOR(7 downto 0);
           START : out STD_LOGIC--starts the reading for 8 bits of data
           );
end Read_accel_fsm;

architecture Behavioral of Read_accel_fsm is
---------------------------------
--Signals------------------------
---------------------------------
signal x_value : STD_LOGIC_VECTOR(15 downto 0) := x"0000";
signal y_value : STD_LOGIC_VECTOR(15 downto 0) := x"0000";
signal z_value : STD_LOGIC_VECTOR(15 downto 0) := x"0000";
signal temperature_value : STD_LOGIC_VECTOR(15 downto 0) := x"0000";


--States for the FSM
type FSM_state_type is (
st1_wait, 
st2_start, st2_read_first_x, 
st3_start, st3_read_second_x,
st4_start, st4_read_first_y, 
st5_start, st5_read_second_y,
st6_start, st6_read_first_z, 
st7_start, st7_read_second_z,
st8_start, st8_read_first_temp,
st9_start, st9_read_second_temp
); 
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
            START <= '0';
            
        ---------------------------------------------------------------
        when st2_start =>
            START <= '1';
        
        when st2_read_first_x =>
            START <= '0';
            x_value (15 downto 8) <= RX_DATA;
            
        when st3_start =>
            START <= '1';
            
        when st3_read_second_x =>
            START <= '0';
            x_value (7 downto 0) <= RX_DATA;
            
        ---------------------------------------------------------------
        when st4_start =>
            START <= '1';
        
        when st4_read_first_y =>
            START <= '0';
            y_value (15 downto 8) <= RX_DATA;
        
        when st5_start =>
            START <= '1';
        
        when st5_read_second_y =>
            START <= '0';
            y_value (7 downto 0) <= RX_DATA;
            
        ---------------------------------------------------------------
        when st6_start =>
            START <= '1';
        
        when st6_read_first_z =>
            START <= '0';
            z_value (15 downto 8) <= RX_DATA;
        
        when st7_start =>
            START <= '1';
        
        when st7_read_second_z =>
            START <= '0';
            z_value (7 downto 0) <= RX_DATA;
            
        ---------------------------------------------------------------
        when st8_start =>
            START <= '1';
        
        when st8_read_first_temp =>
            START <= '0';
            temperature_value (15 downto 8) <= RX_DATA;
        
        when st9_start =>
            START <= '1';
        
        when st9_read_second_temp =>
            START <= '0';
            temperature_value (7 downto 0) <= RX_DATA;

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
        if READ_EN = '1' then
            next_state <= st2_start;
        end if;
        
    ---------------------------------------------------------------
    when st2_start =>
        if READ_DONE = '1' then
            next_state <= st2_read_first_x;
        end if;
    
    when st2_read_first_x =>
        next_state <= st3_start;
        
    when st3_start =>
        if READ_DONE = '1' then
            next_state <= st3_read_second_x;
        end if;
        
    when st3_read_second_x =>
        next_state <= st4_start;
        
    ---------------------------------------------------------------
    when st4_start =>
        if READ_DONE = '1' then
            next_state <= st4_read_first_y;
        end if;  
    
    when st4_read_first_y =>
        next_state <= st5_start;
    
    when st5_start =>
        if READ_DONE = '1' then
            next_state <= st5_read_second_y;
        end if;
    
    when st5_read_second_y =>
        next_state <= st6_start;
        
    ---------------------------------------------------------------
    when st6_start =>
        if READ_DONE = '1' then
            next_state <= st6_read_first_z;
        end if;
    
    when st6_read_first_z =>
        next_state <= st7_start;
    
    when st7_start =>
        if READ_DONE = '1' then
            next_state <= st7_read_second_z;
        end if;
    
    when st7_read_second_z =>
        next_state <= st8_start;
        
    ---------------------------------------------------------------
    when st8_start =>
        if READ_DONE = '1' then
            next_state <= st8_read_first_temp;
        end if;
    
    when st8_read_first_temp =>
        next_state <= st9_start;
    
    when st9_start =>
        if READ_DONE = '1' then
            next_state <= st9_read_second_temp;
        end if;
    
    when st9_read_second_temp =>
        
        
    when others => 
        
    
    end case;      
end process;


end Behavioral;
