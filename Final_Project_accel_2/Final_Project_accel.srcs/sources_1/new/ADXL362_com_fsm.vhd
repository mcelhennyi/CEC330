----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/19/2015 08:22:33 PM
-- Design Name: 
-- Module Name: ADXL362_com_fsm - Behavioral
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

entity ADXL362_com_fsm is
    Port ( Disp3 : out STD_LOGIC_VECTOR(3 downto 0);
           FSM_CLOCK : in STD_LOGIC; --State machine clock
           CMD : in STD_LOGIC_VECTOR (7 downto 0);--COMMAND TO WRITE OR READ
           ADDR : in STD_LOGIC_VECTOR (7 downto 0);--ADDRESS OF DATA TO SEND
           DATA : in STD_LOGIC_VECTOR (7 downto 0);--DATA TO SEND TO ACCEL
           START : in STD_LOGIC;--FLAG TO START COMMUNICATING WITH ACCELEROMETER
           TX_DONE : in STD_LOGIC; --FROM THE COUNTER OF THE SPI CLOCK
           DONE : out STD_LOGIC;--Tells the controlling module that it has finsihed
           TX_ENABLE : out STD_LOGIC;--TELLS THE COUNTER, SPI module AND CLOCK TO START TO ALLOW 8 BITS TO TRANSFER
           LOAD_ENABLE : OUT STD_LOGIC;--TELLS THE SPI BUS TO LOAD THE VALUE TO ITS SHIFT REGISTER BEFORE SHIFTING
           TX_DATA : out STD_LOGIC_VECTOR (7 downto 0);--BYTE OF DATA TO SPI MODULE
           CS : out STD_LOGIC);--CHIP SELECT FOR THE ACCELEROMETER
end ADXL362_com_fsm;

architecture Behavioral of ADXL362_com_fsm is
---------------------------------
--Signals------------------------
---------------------------------


--States for the FSM
type FSM_state_type is (
st1_wait, 
st2_prep_cmd, st2_load_cmd, st2_send_cmd,
st3_prep_addr, st3_load_addr, st3_send_addr,
st4_prep_data, st4_load_data, st4_send_data,
st5_buffer,
st6_tx_done
); 
signal state, next_state : FSM_state_type;

begin

--LED (9) <= START;
------------------------------------
--State Machine---------------------
------------------------------------
--Switches the state to the next state every clock cycle of CLK_IN
SYNC_PROC: process (FSM_CLOCK)
begin
    if (FSM_CLOCK'event and FSM_CLOCK = '1') then
        state <= next_state;
    end if;
end process SYNC_PROC;
--The operations of eache state
OUTPUT_DECODE: process (state)
begin
    case state is
        when st1_wait =>--nothing happens, waiting to be told to send some data to accel
            --state variables            
            CS <= '1';
            DONE <= '0';
            TX_ENABLE <= '0';
            LOAD_ENABLE <= '0';
            
            TX_DATA <= x"00";
            
            Disp3 <= x"0";
        
        when st2_prep_cmd  =>
            --state variables
            CS <= '0';
            DONE <= '0';
            TX_ENABLE <= '0';
            LOAD_ENABLE <= '0';
            --prep stage
            TX_DATA <= CMD;--commented out for testing
            
            --TX_DATA <= x"ab";---------------------------------------------------------------------------------
            
            Disp3 <= x"1";
        
        when st2_load_cmd =>
            --state variables
            CS <= '0';
            DONE <= '0';
            TX_ENABLE <= '0';
            LOAD_ENABLE <= '1';
            
            TX_DATA <= CMD;
            
--            TX_DATA <= x"ab";---------------------------------------------------------------------------------
            
            Disp3 <= x"2";
        
        when st2_send_cmd => 
            --state variables            
            CS <= '0';
            DONE <= '0';
            TX_ENABLE <= '1';
            LOAD_ENABLE <= '0';
            
            TX_DATA <= CMD;
            
--            TX_DATA <= x"ab";---------------------------------------------------------------------------------
            
            Disp3 <= x"3";
       
        when st3_prep_addr  =>
            --state variables            
            CS <= '0';
            DONE <= '0';
            TX_ENABLE <= '0';
            LOAD_ENABLE <= '0';
            --prep stage
            TX_DATA <= ADDR;
            
--            TX_DATA <= x"cd";-------------------------------------------------------------------------------
            
            Disp3 <= x"4";
            
        when st3_load_addr =>
            --state variables
            CS <= '0';
            DONE <= '0';
            TX_ENABLE <= '0';
            LOAD_ENABLE <= '1';
            
            TX_DATA <= ADDR;
            
--            TX_DATA <= x"cd";-------------------------------------------------------------------------------
            
            Disp3 <= x"5";
        
        when st3_send_addr => 
            --state variables            
            CS <= '0';
            DONE <= '0';
            TX_ENABLE <= '1';
            LOAD_ENABLE <= '0';
            
            TX_DATA <= ADDR;
            
--            TX_DATA <= x"cd";-------------------------------------------------------------------------------
            
            Disp3 <= x"6";
    
        when st4_prep_data  =>
            --state variables            
            CS <= '0';
            DONE <= '0';
            TX_ENABLE <= '0';
            LOAD_ENABLE <= '0';
            --prep stage
            TX_DATA <= DATA;
            
--            TX_DATA <= x"ef";--------------------------------------------------------------------------------
            
            Disp3 <= x"7";

        when st4_load_data =>
            --state variables
            CS <= '0';
            DONE <= '0';
            TX_ENABLE <= '0';
            LOAD_ENABLE <= '1';
            
            TX_DATA <= DATA;
            
--            TX_DATA <= x"ef";--------------------------------------------------------------------------------
            
            Disp3 <= x"8";

        when st4_send_data => 
            --state variables            
            CS <= '0';
            DONE <= '0';
            TX_ENABLE <= '1';
            LOAD_ENABLE <= '0';
            
            TX_DATA <= DATA;
            
--            TX_DATA <= x"ef";--------------------------------------------------------------------------------
            
            Disp3 <= x"9";
           
        when st5_buffer => --gives the system an additional clock cycle to settle before going back to wait state
            --state variables            
            CS <= '0';
            DONE <= '0';
            TX_ENABLE <= '0';
            LOAD_ENABLE <= '0';
            
            TX_DATA <= x"00";
            
            Disp3 <= x"A";
            
        when st6_tx_done =>
            --state variables            
            CS <= '1';
            DONE <= '1';
            TX_ENABLE <= '0';
            LOAD_ENABLE <= '0'; 
            
            TX_DATA <= x"00";
            
            Disp3 <= x"B";  
                   
        when others => null;
    end case;
end process OUTPUT_DECODE;

--Chooses the next state depending on button presses
NEXT_STATE_DECODE: process (state)
begin
 next_state <= state;  
 
--state case statement to change a state on rising edge  
case (state) is
    when st1_wait =>
        if START = '1' then 
            next_state <= st2_prep_cmd;
        end if;
            
    when st2_prep_cmd  =>
        next_state <= st2_load_cmd;
        
    when st2_load_cmd  =>
        next_state <= st2_send_cmd;    
        
    when st2_send_cmd => 
        if TX_DONE = '1' then
            next_state <= st3_prep_addr;
        end if;
        
    when st3_prep_addr  =>
        next_state <= st3_load_addr;
        
    when st3_load_addr  =>
        next_state <= st3_send_addr;
                                
    when st3_send_addr => 
        if TX_DONE = '1' then
            next_state <= st4_prep_data;            
        end if;
    
    when st4_prep_data  =>
        next_state <= st4_load_data;
    
    when st4_load_data  =>
        next_state <= st4_send_data;
                                
    when st4_send_data => 
        if TX_DONE = '1' then
            next_state <= st5_buffer;            
        end if; 
           
    when st5_buffer => --gives the system an additional clock cycle to settle before going back to wait state
        next_state <= st6_tx_done;
        
    when st6_tx_done => --send the tx done signal before returning to wait 
        next_state <= st1_wait;

        
    when others =>
        next_state <= st1_wait;
  
    end case;      
end process NEXT_STATE_DECODE;


end Behavioral;
