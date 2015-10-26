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
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.std_logic_arith.ALL;

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
--display signals for the seven segment displays
signal Disp1 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp2 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp3 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp4 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp5 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp6 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp7 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp8 : STD_LOGIC_VECTOR (3 downto 0);

signal clk_slow : STD_LOGIC := '0'; --The one Hz clock
signal clk_16Hz : STD_LOGIC := '0'; --16Hz clock
signal clk_50Hz : STD_LOGIC := '0'; --16Hz clock
signal clk_an : STD_LOGIC; --Clock that is around 70Hz going to the annodes and cathode counter
signal clk_state : STD_LOGIC; --Clock to change State Machine
signal pwm_clk : STD_LOGIC; --Clock that goes to PWM module

signal pwm_level : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00"; --level of pwm
signal pwm_out : STD_LOGIC; --one bit value for pwm signal to LEDs
signal timer : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000"; --count down timer variable

signal button_center : STD_LOGIC;

-----------------------------------
--COMPONETS------------------------
-----------------------------------
--Divides the clock into a 1hz slow signal and a ~70hz signal for the display switching
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_1Hz : out STD_LOGIC;
           CLK_OUT_16Hz : out STD_LOGIC;
           CLK_OUT_50Hz :  out STD_LOGIC;
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
--Drives the seven segment displays
component Seven_seg_driver
    Port ( CLK_AN : in STD_LOGIC;
           Disp1 : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           Disp2 : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           Disp3 : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           Disp4 : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           Disp5 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp6 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp7 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp8 : in STD_LOGIC_VECTOR (3 downto 0);
--           FLAG_an : in STD_LOGIC;
           Display_out : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           AN_out : out STD_LOGIC_VECTOR (7 DOWNTO 0)
           );
end component Seven_seg_driver;
--
component Binary_to_decimal
    Port ( CLK_IN : in STD_LOGIC;
           BINARY_IN : in STD_LOGIC_VECTOR (4 DOWNTO 0);
           DEC_OUT_1 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
           DEC_OUT_2 : out STD_LOGIC_VECTOR (3 DOWNTO 0)
           );
end component Binary_to_decimal;

begin
button_center <= BTNC;
--timer <= "0000" & clk_slow;

------------------------------------
--PORT MAPS-------------------------
------------------------------------
-- maps the divider to the annode/cathode clock and the slow 1hz clock and 8 bit random number      
divider_map: Divider
    port map ( CLK_IN  => CLK_IN,
               CLK_OUT_1Hz => clk_slow,
               CLK_OUT_16Hz => clk_16Hz,
               CLK_OUT_50Hz => clk_50Hz,
               CLK_OUT_AN => clk_an,
               CLK_OUT_STATE => clk_state
               );
--
pwm_map: PWM
    port map ( CLK_IN => clk_50Hz,
               PWM_LEVEL => pwm_level,
               PWM_OUT => pwm_out
               );  
--maps the driver 
Seven_seg_map: Seven_seg_driver
    port map ( CLK_AN => clk_an,
               Disp1 => Disp1,
               Disp2 => Disp2,
               Disp3 => Disp3,
               Disp4 => Disp4,
               Disp5 => Disp5,
               Disp6 => Disp6,
               Disp7 => Disp7,
               Disp8 => Disp8,
--               FLAG_an => flag_an,
               Display_out => SEG,
               AN_out => AN
               );  
--convert a binary number less than 20 to a 2 digit decimal number
Converter: Binary_to_decimal
    port map ( CLK_IN => CLK_IN,
               BINARY_IN => timer,
               DEC_OUT_1 => Disp1,
               DEC_OUT_2 => Disp2
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
timer1: process(CLK_IN, clk_slow)
    begin
        if button_center = '0' then
            if timer > "00000" then
                if(rising_edge(clk_slow)) then 
                    timer <= timer - 1; 
                end if;
            end if;
        elsif button_center = '1' then
            timer <= "10000"; 
        end if;
    end process timer1;
--
timer2: process(CLK_IN, clk_16Hz)
    begin
        if button_center = '0' then
            if pwm_level /= x"ff" then
                if(rising_edge(clk_16Hz)) then 
                    pwm_level <= pwm_level + '1';
                end if;
            end if;
        elsif button_center = '1' then
               pwm_level <= x"00";  
        end if;
    end process timer2;
--The operations of each state
output_driver: process (CLK_IN,timer)
begin
  case timer is
        when "10000" => --16
            LED(8 downto 7) <= pwm_out & pwm_out;
            LED(15 downto 9) <= "0000000";
            LED(6 downto 0) <= "0000000";
        when "01111" => --15
            LED(8 downto 7) <= pwm_out & pwm_out;  
        when "01110" => --14
            LED(9 downto 6) <= pwm_out & pwm_out & pwm_out & pwm_out;  
        when "01101" => --13
            LED(9 downto 6) <= pwm_out & pwm_out & pwm_out & pwm_out; 
        when "01100" => --12
            LED(10 downto 5) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out;  
        when "01011" => --11
            LED(10 downto 5) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out;    
        when "01010" => --10
            LED(11 downto 4) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out;  
        when "01001" => --9
            LED(11 downto 4) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out;  
        when "01000" => --8
            LED(12 downto 3) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out;
        when "00111" => --7
            LED(12 downto 3) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out;  
        when "00110" => --6
            LED(13 downto 2) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out;
        when "00101" => --5
            LED(13 downto 2) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out; 
        when "00100" => --4
            LED(14 downto 1) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out; 
        when "00011" => --3
            LED(14 downto 1) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out;  
        when "00010" => --2
            LED(15 downto 0) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out; 
        when "00001" => --1
            LED(15 downto 0) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out; 
        when "00000" => --0
            LED(15 downto 0) <= pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out & pwm_out; 
        when others => null;
  end case;
end process output_driver;

end Behavioral;
