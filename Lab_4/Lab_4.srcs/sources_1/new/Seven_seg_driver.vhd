----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/24/2015 02:58:12 PM
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Seven_seg_driver is
    Port ( CLK_AN : in STD_LOGIC;
           Disp1 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp2 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp3 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp4 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp5 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp6 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp7 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp8 : in STD_LOGIC_VECTOR (3 downto 0);
           Display_out : out STD_LOGIC_VECTOR (7 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0)
           );
end Seven_seg_driver;

architecture Behavioral of Seven_seg_driver is

    signal Disp_counter : STD_LOGIC_VECTOR (2 DOWNTO 0) := "000";
    signal Display : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000";

begin
--counts from 0 to 3
counter: process(CLK_AN)
    begin
        if (rising_edge(CLK_AN)) then
            Disp_counter <= Disp_counter + 1;
        end if;
    end process counter;
--decides which digit to decode based on count
WITH Disp_counter SELECT
    Display <= Disp1 WHEN "000", 
               --Disp2 WHEN "001", 
               Disp3 WHEN "010", 
               --Disp4 WHEN "011",
               Disp5 WHEN "100",
               Disp6 WHEN "101",
               Disp7 WHEN "110",
               Disp8 WHEN "111";
--decides which 7 segment display to turn on based on count
WITH Disp_counter SELECT
    AN <= "11111110" WHEN "000", --Display1 on
          --"11111101" WHEN "001", --Display2 on
          "11111011" WHEN "010", --Display3 on
          --"11110111" WHEN "011", --Display4 on
          "11101111" WHEN "100", --Display5 on
          "11011111" WHEN "101", --Display6 on
          "10111111" WHEN "110", --Display7 on
          "01111111" WHEN "111"; --Display8 on
--decodes a four bit number for the 7 segment display
WITH Display SELECT
    Display_out <=  "11000000" WHEN x"0", -- number 0 on seven seg display
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

