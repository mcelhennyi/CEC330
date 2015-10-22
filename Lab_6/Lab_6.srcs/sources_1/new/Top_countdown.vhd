----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2015 09:48:08 PM
-- Design Name: 
-- Module Name: Top_countdown - Behavioral
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

entity Top_countdown is
    Port ( CLK_IN : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           SEG : out STD_LOGIC_VECTOR (7 downto 0)
           );
end Top_countdown;

architecture Behavioral of Top_countdown is
-----------------------------------
--Signals--------------------------
-----------------------------------
signal clk_slow : STD_LOGIC := '0'; --The one Hz clock
signal clk_an : STD_LOGIC; --Clock that is around 70Hz going to the annodes and cathode counter
signal clk_state : STD_LOGIC; --Clock to change State Machine
signal pwm_clk : STD_LOGIC; --Clock that goes to PWM module

signal pwm_level : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00"; --level of pwm
signal pwm_out : STD_LOGIC; --one bit value for pwm signal to LEDs

-----------------------------------
--COMPONETS------------------------
-----------------------------------
--Divides the clock into a 1hz slow signal and a ~70hz signal for the display switching
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_SLOW : out STD_LOGIC;
           CLK_OUT_AN : out STD_LOGIC;
           CLK_OUT_STATE : out STD_LOGIC
           );
end component Divider;

component PWM
    Port ( CLK_IN : in STD_LOGIC;
           PWM_LEVEL : in STD_LOGIC_VECTOR (7 downto 0);
           PWM_OUT : out STD_LOGIC
           );
end component PWM;

begin
------------------------------------
--PORT MAPS-------------------------
------------------------------------
-- maps the divider to the annode/cathode clock and the slow 1hz clock and 8 bit random number      
divider_map: Divider
     port map ( CLK_IN  => CLK_IN,
                CLK_OUT_SLOW => clk_slow,
                CLK_OUT_AN => clk_an,
                CLK_OUT_STATE => clk_state
              );
pwm_map: PWM
    port map ( CLK_IN => pwm_clk,
               PWM_LEVEL => pwm_level,
               PWM_OUT => pwm_out
              );
------------------------------------
--State Machine Code----------------
------------------------------------
----Switches the state to the next state every clock cycle of CLK_IN
--SYNC_PROC: process (CLK_IN)
--   begin
--      if (clk_state'event and clk_state = '1') then
--            state <= next_state;
--      end if;
--   end process SYNC_PROC;
--Counts for the 16 second timer
timer: process(CLK_SLOW)
    begin
        if BNTC = '0'
            if timer > 0 then
                if(rising_edge(CLK_SLOW)) then 
                    timer <= timer - 1; 
                end if;
            end if;
        elsif BTNC = '1'
            timer <= "1111"; 
    end process timer;
--The operations of each state
output_driver: process (CLK_SLOW)
begin
  case timer is
        when "1111" => --16
            -- 0%
            pwm_level = "00000000"
            LED(8 downto 7) <= pwm_out;  
        when "1110" => --15
            -- 6.25%
            pwm_level = "00010000" 
            LED(8 downto 7) <= pwm_out;  
        when "1101" => --14
            -- 12.5%
            pwm_level = "00100000"
            LED(9 downto 6) <= pwm_out;  
        when "1100" => --13
            -- 18.75%
            pwm_level = "00110000"
            LED(9 downto 6) <= pwm_out;  
        when "1011" => --12
            -- 25%
            pwm_level = "01000000"
            LED(10 downto 5) <= pwm_out;  
        when "1011" => --11
            -- 31.25%
            pwm_level = "01010000"
            LED(10 downto 5) <= pwm_out;  
        when "1010" => --10
            -- 37.5%
            pwm_level = "01100000"
            LED(11 downto 4) <= pwm_out;  
        when "1001" => --9
            -- 43.75%
            pwm_level = "01110000"
            LED(11 downto 4) <= pwm_out;  
        when "1000" => --8
            -- 50%
            pwm_level = "10000000"
            LED(12 downto 3) <= pwm_out;  
        when "0111" => --7
            -- 56.25%
            pwm_level = "10010000"
            LED(12 downto 3) <= pwm_out;  
        when "0110" => --6
            -- 62.5%
            pwm_level = "10100000"
            LED(13 downto 2) <= pwm_out;  
        when "0101" => --5
            -- 68.75%
            pwm_level = "10110000"
            LED(13 downto 2) <= pwm_out;  
        when "0100" => --4
            -- 75%
            pwm_level = "11000000"
            LED(14 downto 1) <= pwm_out;  
        when "0011" => --3
            -- 81.25%
            pwm_level = "11010000"
            LED(14 downto 1) <= pwm_out;  
        when "0010" => --2
            -- 87.5%
            pwm_level = "11100000"
            LED(15 downto 0) <= pwm_out;  
        when "0001" => --1
            --93.75%
            pwm_level = "11110000"
            LED(15 downto 0) <= pwm_out;  
        when "0000" => --0
            -- 100%
            pwm_level = "11111111"
            LED(15 downto 0) <= pwm_out;  
        when others => null;
  end case;
end process OUTPUT_DECODE;

----Chooses the next state depending on button presses
--NEXT_STATE_DECODE: process (state, BTNC, BTNU, BTND, BTNL, BTNR)
--begin
--    next_state <= state;  
  
--    --state case statement to change a state on rising edge  
--    case (state) is
--        when st1_wait =>
--            if BTNC = '0' then
--                next_state <= st2_6_25;
--            end if;
--        when st2_6_25 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 13 then
--                next_state <= st2_12_5;
--            end if;
--        when st2_12_5 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 12 then
--                next_state <= st2_18_75;
--            end if;
--        when st2_18_75 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 11 then
--                next_state <= st2_25;
--            end if;
--        when st2_25 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 10 then 
--                next_state <= st2_31_25;
--            end if;
--        when st2_31_25 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 9 then 
--                next_state <= st2_37_5;
--            end if;
--        when st2_37_5 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 8 then
--                next_state <= st2_43_75;
--            end if;
--        when st2_43_75 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 7 then
--                next_state <= st2_50;
--            end if;
--        when st2_50 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 6 then
--                next_state <= st2_56_25;
--            end if;        
--        when st2_56_25 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 5 then
--                next_state <= st2_62_5;
--            end if;
--        when st2_62_5 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 4 then
--                next_state <= st2_75;
--            end if;
--        when st2_75 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 3 then
--                next_state <= st2_81_25;
--            end if;
--        when st2_81_25 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 2 then 
--                next_state <= st2_87_5;
--            end if;
--        when st2_87_5 =>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 1 then
--                next_state <= st2_93_75;
--            end if;
--        when st2_93_75=>
--            if  BTNC = '1' then
--                next_state <= st1_wait;
--            elsif timer = 0 then
--                next_state <= st2_100;
--            end if;
--        when st2_100 =>
--            if  BTNC = '1' then
--               next_state <= st1_wait;
--            end if;     
--        when others =>
--            next_state <= st1_wait;
            
    end case;      
end process;
                


end Behavioral;
