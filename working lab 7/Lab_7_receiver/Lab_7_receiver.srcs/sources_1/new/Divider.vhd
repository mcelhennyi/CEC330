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
           CLK_OUT_AN : out STD_LOGIC
           );
end Divider;

architecture Behavioral of Divider is

--50Hz counter signals
signal counter50Hz : STD_LOGIC_VECTOR (12 DOWNTO 0) := "0000000000000";
signal clk_out50Hz : STD_LOGIC := '0';


begin
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
    
CLK_OUT_AN <= clk_out50Hz;--For seven segment display switching

end Behavioral;
