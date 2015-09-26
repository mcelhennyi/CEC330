----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/24/2015 03:07:47 PM
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
use ieee.std_logic_arith.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Divider is
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_SLOW : out STD_LOGIC;
           CLK_OUT_AN : out STD_LOGIC;
           RAND_OUT : out STD_LOGIC_VECTOR (7 downto 0)
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
    
CLK_OUT_SLOW <= register_counter(26);--Slow 1Hz clock
CLK_OUT_AN <= register_counter(14);--About 70Hz for display switching
RAND_OUT <= register_counter(15 downto 8);

end Behavioral;
