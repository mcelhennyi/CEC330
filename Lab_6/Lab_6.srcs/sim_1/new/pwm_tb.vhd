----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/26/2015 11:38:39 PM
-- Design Name: 
-- Module Name: pwm_tb - Behavioral
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

entity pwm_tb is
--  Port ( );
end pwm_tb;

architecture Behavioral of pwm_tb is
component PWM
    Port ( CLK_IN : in STD_LOGIC;
           PWM_LEVEL : in STD_LOGIC_VECTOR (7 downto 0);
           PWM_OUT : out STD_LOGIC
           );
end component PWM;


--Inputs
    signal clk_50Hz : std_logic := '1';
    signal pwm_level :  STD_LOGIC_VECTOR (7 downto 0):= "00000000";
    --Outputs
    signal pwm_out :  STD_LOGIC;
    --Clock Period
    constant CLK_period : time := 200000000 ns;
    
begin
uut: PWM
    port map ( CLK_IN => clk_50Hz,
               PWM_LEVEL => pwm_level,
               PWM_OUT => pwm_out
               );  
--clock process clock of 50 Hz
CLK_IN_PROCESS: process
begin
   clk_50Hz <= '0';
   wait for CLK_period/2;
   clk_50Hz <= '1';
   wait for CLK_period/2;
end process CLK_IN_PROCESS;

--stimulus to write to memory
stim_proc: process
begin
--set level
    pwm_level <= "11111111";
    wait for 400000000 ns;
    pwm_level <= "00000000";
    wait for 400000000 ns;
    pwm_level <= "10000000";
    wait for 400000000 ns;
    wait;
    
end process stim_proc;


end Behavioral;
