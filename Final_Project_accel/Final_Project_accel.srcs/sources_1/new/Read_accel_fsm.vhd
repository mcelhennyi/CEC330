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
           RX_DATA : in STD_LOGIC_VECTOR(15 downto 0);--data from accel
           READ_DONE : in STD_LOGIC;--When the 8 clock cycles are done
           TX_DATA: out STD_LOGIC_VECTOR(7 downto 0);--sends the data to transmit to ADXL_fsm
           TX_ADDR : out STD_LOGIC_VECTOR(7 downto 0);--sends addr data to ADXL_fsm 
           TX_CMD : out STD_LOGIC_VECTOR(7 downto 0);--sends to read or write command to ADXL_fsm
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
st2_prep, st2_start, st2_read_x, 
st3_prep, st3_start, st3_read_y,
st4_prep, st4_start, st4_read_z, 
st5_prep, st5_start, st5_read_temp
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
        when st2_prep  =>
            START <= '0';
            --prep stage
            TX_CMD <= x"0D";
            TX_ADDR <= x"00";
            TX_DATA <= x"00";
            
        when st2_start =>
            START <= '1';
            
        when st2_read_x =>
            START <= '0';
            x_value <= RX_DATA(7 downto 0) & RX_DATA(15 downto 8);
       
        ---------------------------------------------------------------
        when st3_prep  =>
            START <= '0';
            --prep stage
            TX_CMD <= x"0D";
            TX_ADDR <= x"00";
            TX_DATA <= x"00";
                    
        when st3_start =>
            START <= '1';
        
        when st3_read_y =>
            START <= '0';
            y_value <= RX_DATA(7 downto 0) & RX_DATA(15 downto 8);
            
        ---------------------------------------------------------------
        when st4_prep  =>
            START <= '0';
            --prep stage
            TX_CMD <= x"0D";
            TX_ADDR <= x"00";
            TX_DATA <= x"00";
            
        when st4_start =>
            START <= '1';
        
        when st4_read_z =>
            START <= '0';
            z_value <= RX_DATA(7 downto 0) & RX_DATA(15 downto 8);
            
        ---------------------------------------------------------------
        when st5_prep  =>
            START <= '0';
            --prep stage
            TX_CMD <= x"0D";
            TX_ADDR <= x"00";
            TX_DATA <= x"00";
                    
        when st5_start =>
            START <= '1';
        
        when st5_read_temp =>
            START <= '0';
            temperature_value <= RX_DATA(7 downto 0) & RX_DATA(15 downto 8);

        when others => null;
    end case;
end process OUTPUT_DECODE;

--Chooses the next state depending on button presses
NEXT_STATE_DECODE: process (state,READ_EN,READ_DONE)
begin
    next_state <= state;  
 
--state case statement to change a state on rising edge  
    case (state) is
        when st1_wait =>
            if READ_EN = '1' then
                next_state <= st2_prep;
            end if;
            
        ---------------------------------------------------------------
        when st2_prep =>
            next_state <= st2_start;
            
        when st2_start =>
            if READ_DONE = '1' then
                next_state <= st2_read_x;
            end if;
        
        when st2_read_x =>
            next_state <= st3_prep;
        
        ---------------------------------------------------------------
        when st3_prep =>
            next_state <= st3_start;
            
        when st3_start =>
            if READ_DONE = '1' then
                next_state <= st3_read_y;
            end if;
        
        when st3_read_y =>
            next_state <= st4_prep;
            
        ---------------------------------------------------------------
        when st4_prep =>
            next_state <= st4_start;
            
        when st4_start =>
            if READ_DONE = '1' then
                next_state <= st4_read_z;
            end if;
        
        when st4_read_z =>
            next_state <= st5_prep;
            
        ---------------------------------------------------------------
        when st5_prep =>
            next_state <= st5_start;
            
        when st5_start =>
            if READ_DONE = '1' then
                next_state <= st5_read_temp;
            end if;
        
        when st5_read_temp =>
            next_state <= st1_wait;
            
        ---------------------------------------------------------------    
        when others => 
            next_state <= st1_wait;
        
    end case;      
end process;


end Behavioral;
