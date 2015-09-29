----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/24/2015 06:22:55 PM
-- Design Name: 
-- Module Name: sequencer - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity sequencer is
    Port ( reset : in STD_LOGIC;
           clk_slow : in STD_LOGIC;
           sw_15 : in STD_LOGIC;
           flag_0 : out STD_LOGIC;
           flag_15 : out STD_LOGIC;
           flag_17 : out STD_LOGIC;
           test_count : out STD_LOGIC_VECTOR (2 downto 0);
           led15 : out STD_LOGIC;
           LED7 : out STD_LOGIC;
           LED8 : out STD_LOGIC
           );
end sequencer;

architecture Behavioral of sequencer is

signal state_counter : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000"; 
signal counter_for_logic : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";

begin

sequence_counter: process(clk_slow, reset, sw_15)
    begin
        --reset statement
        if reset = '1' then
            --reset all counters to zero which will reinitiate whole process
            state_counter <= "00000";
            counter_for_logic <= "000";
            test_count <= "000";
        else
            if counter_for_logic < "100" then 
                ----------------
                --TESTING MODE--
                ----------------
                if sw_15 = '1' then --sw if statement to pause the process
                    --blink LED
                    led15 <= clk_slow;
                else
                    --turn off LED 15  
                    led15 <= '0';
                    --increment timer
                    if (rising_edge(clk_slow)) then
                        state_counter <= state_counter +1;
                        if state_counter = "10001" then
                            --increment counter for logic
                            counter_for_logic <= counter_for_logic + 1;
                            test_count <= counter_for_logic;
                            state_counter <= "00000";                        
                        end if;
                    end if;
                    
                    if state_counter < "01111" then --less than 15
                        --flag start state
                        flag_0 <= '1';
                        flag_15 <= '0';
                        flag_17 <= '0';
                        --Light LED 7 and 8 for test mode
                        LED7 <= '1';
                        LED8 <= '1';
                    elsif state_counter >= "01111" and state_counter < "10001" then -->= 15 and < 17
                        --flag 15 seconds state
                        flag_0 <= '0';
                        flag_15 <= '1';   
                        flag_17 <= '0';
                        --turn off LED7 and 8 for display during test mode
                        LED7 <= '0';
                        LED8 <= '0';
                    end if;
                end if;
            else --counter is 4 or more
                ----------------
                --LISTING MODE--
                ----------------
                --do not increment counters or reset
                --flash LED 7 and LED 8    
                LED7 <= clk_slow;
                LED8 <= clk_slow;
            end if;  
        end if;
        
end process sequence_counter;

end Behavioral;
