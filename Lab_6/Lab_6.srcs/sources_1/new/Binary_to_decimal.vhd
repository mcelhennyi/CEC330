----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/22/2015 04:06:49 PM
-- Design Name: 
-- Module Name: Binary_to_decimal - Behavioral
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

entity Binary_to_decimal is
    Port ( CLK_IN : in STD_LOGIC;
           BINARY_IN : in STD_LOGIC_VECTOR (4 DOWNTO 0);
           DEC_OUT_1 : out STD_LOGIC_VECTOR (3 DOWNTO 0);
           DEC_OUT_2 : out STD_LOGIC_VECTOR (3 DOWNTO 0)
           );
end Binary_to_decimal;

architecture Behavioral of Binary_to_decimal is

signal dec_1_middle : STD_LOGIC_VECTOR (4 DOWNTO 0) := "00000"; --Same size as the binary in
signal dec_2_middle : STD_LOGIC_VECTOR (3 DOWNTO 0) := "0000"; --Same size as DEC_OUT_2

begin

convert_to_decimal: process(CLK_IN,BINARY_IN)
variable dec_1_middle : STD_LOGIC_VECTOR (4 DOWNTO 0); --Same size as the binary in
variable dec_2_middle : STD_LOGIC_VECTOR (3 DOWNTO 0); --Same size as DEC_OUT_2
    begin
        dec_1_middle := BINARY_IN;
        dec_2_middle := "0000";
        --would need to use a while loop and more statements if the value was going to be bigger than 19
        if dec_1_middle > "1001" then
            dec_1_middle := dec_1_middle - "01010";
            dec_2_middle := dec_2_middle + 1;
        end if;
        
        DEC_OUT_1 <= dec_1_middle(3 downto 0);
        DEC_OUT_2 <= dec_2_middle;
    end process convert_to_decimal;
end Behavioral;
