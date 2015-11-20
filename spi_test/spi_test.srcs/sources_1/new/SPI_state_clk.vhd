----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/20/2015 11:17:29 AM
-- Design Name: 
-- Module Name: SPI_state_clk - Behavioral
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

entity SPI_state_clk is
    Port ( CLK_200KHz : in STD_LOGIC;
           CLK_EN : in STD_LOGIC;
           TX_DONE : out STD_LOGIC;
           SPI_CLK : out STD_LOGIC--should produce a 100KHz clk output for 8 rising edges
           );
end SPI_state_clk;

architecture Behavioral of SPI_state_clk is
-----------------------------------
--Signals--------------------------
-----------------------------------

--States for the FSM
type FSM_state_type is (
st1_wait, 
st2_high, st2_low,
st3_high, st3_low, 
st4_high, st4_low, 
st5_high, st5_low, 
st6_high, st6_low, 
st7_high, st7_low,  
st8_high, st8_low, 
st9_high, st9_low); 
signal state, next_state : FSM_state_type;


begin
------------------------------------
--State Machine---------------------
------------------------------------

--Switches the state to the next state every clock cycle of CLK_IN
SYNC_PROC: process (CLK_200KHz)
begin
   if (CLK_200KHz'event and CLK_200KHz = '1') then
       state <= next_state;
   end if;
end process;

--The operations of eache state
OUTPUT_DECODE: process (state)
begin
   case state is
       when st1_wait =>
           SPI_CLK <= '0';
           TX_DONE <= '1';

       when st2_high =>
           SPI_CLK <= '1';
           TX_DONE <= '0';
           
       when st2_low => 
           SPI_CLK <= '0';
           TX_DONE <= '0';
           
       when st3_high =>
           SPI_CLK <= '1';
           TX_DONE <= '0';
       
       when st3_low => 
           SPI_CLK <= '0';
           TX_DONE <= '0';

       when st4_high =>
           SPI_CLK <= '1';
           TX_DONE <= '0';
                       
       when st4_low => 
           SPI_CLK <= '0';
           TX_DONE <= '0';

       when st5_high =>
           SPI_CLK <= '1';
           TX_DONE <= '0';
                               
       when st5_low => 
           SPI_CLK <= '0';
           TX_DONE <= '0';

       when st6_high =>
           SPI_CLK <= '1';
           TX_DONE <= '0';
                               
       when st6_low => 
           SPI_CLK <= '0';
           TX_DONE <= '0';
           
       when st7_high =>
           SPI_CLK <= '1';
           TX_DONE <= '0';
                               
       when st7_low => 
           SPI_CLK <= '0';
           TX_DONE <= '0';
                   
       when st8_high =>
           SPI_CLK <= '1';
           TX_DONE <= '0';
                               
       when st8_low => 
           SPI_CLK <= '0';
           TX_DONE <= '0';
           
       when st9_high =>
           SPI_CLK <= '1';
           TX_DONE <= '0';
                                      
       when st9_low => 
           SPI_CLK <= '0';
           TX_DONE <= '0';
    
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
        if CLK_EN = '1' then
            next_state <= st2_high;
        end if;
       
    when st2_high  =>
        next_state <= st2_low;
       
    when st2_low =>
        next_state <= st3_high;
       
    when st3_high  =>
        next_state <= st3_low;
                   
    when st3_low =>
        next_state <= st4_high;
       
    when st4_high  =>
        next_state <= st4_low;
                   
    when st4_low =>
        next_state <= st5_high;     
      
    when st5_high  =>
        next_state <= st5_low;
                           
    when st5_low =>
        next_state <= st6_high;
       
    when st6_high  =>
        next_state <= st6_low;
                           
    when st6_low =>
        next_state <= st7_high;
       
    when st7_high  =>
        next_state <= st7_low;
                           
    when st7_low =>
        next_state <= st8_high;
               
    when st8_high  =>
        next_state <= st8_low;
                           
    when st8_low =>
        next_state <= st9_high;
        
    when st9_high  =>
        next_state <= st9_low;
                           
    when st9_low =>
        next_state <= st1_wait;
    
    when others =>
        next_state <= st1_wait;
    
    end case;      
end process;


end Behavioral;
