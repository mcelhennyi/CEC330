----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/21/2015 10:07:40 PM
-- Design Name: 
-- Module Name: PWM - Behavioral
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

entity PWM is
    Port ( CLK_IN : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR(15 downto 0)
           );
end PWM;

architecture Behavioral of PWM is
signal register_counter : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00"; --counter to compare pwm level to
signal output : STD_LOGIC:= '0'; --momentary output value for pwm 
signal counter16Hz : STD_LOGIC_VECTOR (23 DOWNTO 0) := x"000000";
signal clk_out16Hz : STD_LOGIC := '0';
signal counter50Hz : STD_LOGIC_VECTOR (12 DOWNTO 0) := "0000000000000";
signal clk_out50Hz : STD_LOGIC := '0';
signal pwm_level : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00"; --level of pwm


begin

--16Hz clock
counter16: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            counter16Hz <= counter16Hz +1;
            if counter16Hz = "001011111010111100001000" then
                clk_out16Hz <= '1';
            elsif counter16Hz = "010111110101111000010000" then
                clk_out16Hz <= '0';
                counter16Hz <= x"000000";
            end if;
        end if;
end process counter16;

--50Hz clock
counter50: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            counter50Hz <= counter50Hz +1;
            if counter50Hz = "0111101000010" then
                clk_out50Hz <= '1';
            elsif counter50Hz = "1111010000100" then
                clk_out50Hz <= '0';
                counter50Hz <= "0000000000000";
            end if;
        end if;
end process counter50;

-- a fader that can fade the PWM to full power after 16 seconds
timer2: process(clk_out16Hz)
    begin
        if pwm_level /= x"ff" then
            if(rising_edge(clk_out16Hz)) then 
                pwm_level <= pwm_level + '1';
            end if;
        end if;
end process timer2;
    
    
-----------------------------------------
--PWM MODULE-----------------------------
-----------------------------------------    
--Counts for the PWM level logic below counter
counter: process(clk_out50Hz)
begin
    if rising_edge(clk_out50Hz) then 
        register_counter <= register_counter + 1;
    end if;
end process counter;

--If the counter is lower than the PWM level the output is high else output low
pwm_driver: process(clk_out50Hz)
begin
    if register_counter < PWM_LEVEL then 
        output <= '1';
    else
        output <= '0';
    end if;
end process pwm_driver;

LED(0) <= output; --Connects the PWM output to the correct pwm signal

end Behavioral;
