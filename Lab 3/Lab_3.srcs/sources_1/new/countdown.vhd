----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/18/2015 10:30:26 PM
-- Design Name: 
-- Module Name: countdown - Behavioral
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
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity countdown is
    Port ( CLK_IN : in STD_LOGIC;
           BTNC : in STD_LOGIC; 
           registerIn : in STD_LOGIC_VECTOR (15 downto 0);
           FLAG : out STD_LOGIC;
           registerOut : out STD_LOGIC_VECTOR (15 downto 0);
           clk_slow: in STD_LOGIC;
           LED3: out STD_LOGIC
           );
end countdown;

-------------------------------------------
--This module handles the countdown of the register (16bit)
--This module takes in the 1hz clock, register value from SW2REG, and BTNC
--This module outputs a flag that a process is running on the register, as well as outputs LED3, and the countdown value of the register
-------------------------------------------

architecture Behavioral of countdown is

signal registerMiddle : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"0000";
signal countdown : STD_LOGIC := '0';

begin

countdown_process: process(CLK_IN)
begin
    --sets a flag that will tell the SW2REG module to not change register value and allows countdown to start
    if (BTNC = '1') then
        countdown <= '1';
        registerMiddle <= registerIn;
    end if;
 
    --sets countdown to off state if register is 0 and turns led 3 on
    if (registerMiddle = x"0000") then
        countdown <= '0';
        LED3 <= '1';
    --If rising edge and count down is enabled count down
    elsif (rising_edge(clk_slow) AND (countdown = '1')) then
        registerMiddle <= registerMiddle - 1;
        registerOut <= registerMiddle;
        LED3 <= '0';
    end if;
registerOut <= registerMiddle; --outputs the register with the one less value
FLAG <= countdown; -- displays the flag for other modules

end process countdown_process;  

end Behavioral;
