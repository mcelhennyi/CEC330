----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2015 03:12:27 PM
-- Design Name: 
-- Module Name: Divider - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Divider is
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_slower : out STD_LOGIC;
           CLK_OUT_an : out STD_LOGIC
           );
end Divider;

architecture Behavioral of Divider is

signal register_counter : STD_LOGIC_VECTOR (26 DOWNTO 0) := "000" & x"000000";

begin

--counts up every clock for a clock divider
counter: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            register_counter <= register_counter +1;
        end if;
    end process counter;
    
CLK_OUT_slower <= register_counter(26);--Slow 1Hz clock
CLK_OUT_an <= register_counter(15);--About 70Hz for display switching

end Behavioral;
