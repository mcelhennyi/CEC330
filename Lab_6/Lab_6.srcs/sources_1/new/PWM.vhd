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
           PWM_LEVEL : in STD_LOGIC_VECTOR (7 downto 0);
           PWM_OUT : out STD_LOGIC
           );
end PWM;

architecture Behavioral of PWM is

signal register_counter : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00"; --counter to compare pwm level to
signal output : STD_LOGIC:= '0'; --momentary output value for pwm 

--Counts for the PWM level logic below counter
begin
counter: process(CLK_IN)
begin
    if rising_edge(CLK_IN) then 
        register_counter <= register_counter + 1;
    end if;
end process counter;

--If the counter is lower than the PWM level the output is high else output low
pwm_driver: process(CLK_IN)
begin
    if register_counter < PWM_LEVEL then 
        output <= '1';
    else
        output <= '0';
    end if;
end process pwm_driver;

PWM_OUT <= output; --Connects the PWM output to the correct pwm signal

end Behavioral;
