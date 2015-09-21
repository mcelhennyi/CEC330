----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2015 02:31:09 PM
-- Design Name: 
-- Module Name: Counter - Behavioral
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

entity Counter is
    Port ( CLK_IN : in STD_LOGIC;
           Q : out STD_LOGIC_VECTOR (3 DOWNTO 0) 
           );
end Counter;

architecture Behavioral of Counter is

    signal register_counter : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";

begin

counter: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            register_counter <= register_counter + 1;
        end if;
    end process counter;
    
Q <= register_counter;


end Behavioral;
