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
           led15 : out STD_LOGIC
           );
end sequencer;

architecture Behavioral of sequencer is

signal state_counter : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000"; 
signal counter_for_logic : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";

begin

sequence_counter: process(clk_slow, reset, sw_15)
    begin
        if counter_for_logic < "100" then
            --pause switch
            if sw_15 = '0' then
                led15 <= '0';
                --increments the state counter every slow clock cycle
                if (rising_edge(clk_slow)) then
                    state_counter <= state_counter +1;
                end if;
                
                if state_counter >= "10001" then --if the count is 17 set to zero
                    state_counter <=  "00000";
                    counter_for_logic <= counter_for_logic + 1;
                    test_count <= counter_for_logic;
                end if;
            elsif sw_15 = '1' then
                --flash led 15
                led15 <= clk_slow;
            end if;
        end if;
        --reset to reset the state to the first state
        if reset = '1' then
            state_counter <= "00000";
            test_count <= "000";
        end if;
end process sequence_counter;

sequence: process(clk_slow, reset, sw_15)
    begin     

        if state_counter < "01111" then
            --flag start state
            flag_0 <= '1';
            flag_17 <= '0';
            flag_15 <= '0';
            --led15 <= '1'; --debug statement delete at implementation
        elsif state_counter >= "01111" and state_counter < "10001" then -->= 15 and < 17
            --flag 15 seconds state
            flag_0 <= '0';
            flag_15 <= '1';
            --led15 <= '0'; --debug statement delete at implementation
        elsif state_counter >= "1000" then
            --flag 17 seconds state
            flag_15 <= '0';
--            if (rising_edge(clk_slow)) then
--                flag_17 <= '1';
--            end if;            
            flag_17 <= '1';
--            led15 <= '1'; --debug statement delete at implementation
            --state_counter <= "00000";
        end if;
        
    end process sequence;
end Behavioral;
