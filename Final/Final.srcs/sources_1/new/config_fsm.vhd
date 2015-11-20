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

entity config_fsm is
    Port ( 
           FSM_CLOCK : in STD_LOGIC;
           CONFIG_EN : in STD_LOGIC;
           CONFIG_DONE : out STD_LOGIC;
           TX_DATA: out STD_LOGIC_VECTOR(7 downto 0);
           TX_DONE : in STD_LOGIC;
           CE : out STD_LOGIC
           );
end config_fsm;

architecture Behavioral of config_fsm is
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
st16_tx_done); 
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
--            tx_enable <= '0';
--            saved_data <= '0';
--            data_accepted <= '0';

        when st2_prep_x20 =>

        when st2_send_x20 =>



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
        next_state <= st2_prep_x20;
    when st2_prep_x20  =>
        next_state <= st2_send_x20;
        
    when st2_send_x20 => 
        if TX_DONE = '1' then
            next_state <= st3_prep_x21;
        end if;
    when st3_prep_x21  =>
        next_state <= st3_send_x21;
                    
    when st3_send_x21 => 
        if TX_DONE = '1' then
            next_state <= st4_prep_x22;            
        end if;
    when st4_prep_x22  =>
        next_state <= st4_send_x22;
                    
    when st4_send_x22 => 
        if TX_DONE = '1' then
            next_state <= st5_prep_x23;    
        end if;
    when st5_prep_x23  =>
        next_state <= st5_send_x23;
                            
    when st5_send_x23 => 
        if TX_DONE = '1' then
            next_state <= st6_prep_x24;             
        end if;
    when st6_prep_x24  =>
        next_state <= st6_send_x24;
                            
    when st6_send_x24 => 
        if TX_DONE = '1' then
            next_state <= st7_prep_x25;
        end if;
        
    when st7_prep_x25  =>
        next_state <= st7_send_x25;
                            
    when st7_send_x25 => 
        if TX_DONE = '1' then
            next_state <= st8_prep_x26;
        end if;    
                
    when st8_prep_x26  =>
        next_state <= st8_send_x26;
                            
    when st8_send_x26 => 
        if TX_DONE = '1' then
            next_state <= st9_prep_x27;
        end if;            
     
    when st9_prep_x27  =>
        next_state <= st9_send_x27;
                                
    when st9_send_x27 => 
        if TX_DONE = '1' then
            next_state <= st10_prep_x28;
        end if;            
            
    when st10_prep_x28  =>
        next_state <= st10_send_x28;
                                    
    when st10_send_x28 => 
        if TX_DONE = '1' then
            next_state <= st11_prep_x29;
        end if;          
        
    when st11_prep_x29  =>
        next_state <= st11_send_x29;
                                    
    when st11_send_x29 => 
        if TX_DONE = '1' then
            next_state <= st12_prep_x2A;
        end if;                  
        
    when st12_prep_x2A  =>
        next_state <= st12_send_x2A;
                                    
    when st12_send_x2A => 
        if TX_DONE = '1' then
            next_state <= st13_prep_x2B;
        end if;   
        
    when st13_prep_x2B  =>
        next_state <= st13_send_x2B;
                                    
    when st13_send_x2B => 
        if TX_DONE = '1' then
            next_state <= st14_prep_x2C;
        end if;   
           
    when st14_prep_x2C  =>
        next_state <= st14_send_x2C;
                                    
    when st14_send_x2C => 
        if TX_DONE = '1' then
            next_state <= st15_prep_x2D;
        end if;   
           
    when st15_prep_x2D  =>
        next_state <= st15_send_x2D;
                                    
    when st15_send_x2D => 
        if TX_DONE = '1' then
            next_state <= st16_tx_done;
        end if; 
        
    when st16_tx_done =>
        next_state <= st1_wait;

    when others =>
    
    
    end case;      
end process;


end Behavioral;
