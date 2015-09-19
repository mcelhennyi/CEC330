----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2015 02:19:57 PM
-- Design Name: 
-- Module Name: Seven_seg_driver - Behavioral
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

entity Seven_seg_driver is
    Port ( CLK_AN : in STD_LOGIC;
           REG : in STD_LOGIC_VECTOR (15 DOWNTO 0);
           Display_out : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           AN : out STD_LOGIC_VECTOR (3 DOWNTO 0)
           );
end Seven_seg_driver;

architecture Behavioral of Seven_seg_driver is

    signal Disp_counter : STD_LOGIC_VECTOR (1 DOWNTO 0) := "00";
    signal Display : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";

begin
--counts from 0 to 3
counter: process(CLK_AN)
    begin
        if (rising_edge(CLK_AN)) then
            Disp_counter <= Disp_counter + 1;
        end if;
    end process counter;
--decides which digit to decode
WITH Disp_counter SELECT
--        Display <= "1000" WHEN "00", 
--                   "0001" WHEN "01", 
--                   "1100" WHEN "10", 
--                   "0010" WHEN "11";
         Display <= REG(15 downto 12) WHEN "00", 
                     REG(11 downto 8) WHEN "01", 
                     REG(7 downto 4) WHEN "10", 
                     REG(3 downto 0) WHEN "11";
--decides which 7 segment display to turn on
WITH Disp_counter SELECT
        AN <= "0111" WHEN "00", 
              "1011" WHEN "01", 
              "1101" WHEN "10", 
              "1110" WHEN "11";
--decodes a four bit number for the 7 segment display
WITH Display SELECT
        Display_out <= "11000000" WHEN x"0", -- number 0 on seven seg display
        "11111001" WHEN x"1", -- number 1 on seven seg display
        "10100100" WHEN x"2", -- number 2 on seven seg display
        "10110000" WHEN x"3", -- number 3 on seven seg display
        "10011001" WHEN x"4", -- number 4 on seven seg display
        "10010010" WHEN x"5", -- number 5 on seven seg display
        "10000011" WHEN x"6", -- number 6 on seven seg display
        "11111000" WHEN x"7", -- number 7 on seven seg display
        "10000000" WHEN x"8", -- number 8 on seven seg display
        "10011000" WHEN x"9", -- number 9 on seven seg display   
        "10001000" WHEN x"a", -- number A on seven seg display 
        "10000011" WHEN x"b", -- number B on seven seg display 
        "10100111" WHEN x"c", -- number C on seven seg display 
        "10100001" WHEN x"d", -- number D on seven seg display 
        "10000110" WHEN x"e", -- number E on seven seg display 
        "10001110" WHEN x"f"; -- number F on seven seg display 

end Behavioral;
