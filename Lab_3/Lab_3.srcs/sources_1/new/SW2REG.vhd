----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/18/2015 12:35:24 PM
-- Design Name: 
-- Module Name: SW2REG - Behavioral
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

entity SW2REG is
    Port ( REG : out STD_LOGIC_VECTOR (15 downto 0);
           BTNR : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTND : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           FLAG : in STD_LOGIC
           );
end SW2REG;

architecture Behavioral of SW2REG is

--signal REG : STD_LOGIC_VECTOR (15 DOWNTO 0) := x"0000";

begin

SW2REG: process(FLAG,BTNL,BTNU,BTND,BTNR,SW)
    begin
        if (FLAG = '0') then
             if (BTNL = '1') then
                    REG(15 downto 12) <= SW;
                ELSIF (BTNU = '1') then
                    REG(11 downto 8) <= SW;
                ELSIF (BTND = '1') then
                    REG(7 downto 4) <= SW;
                ELSIF (BTNR = '1') then
                    REG(3 downto 0) <= SW;
             end if;
        end if;
        
       
    end process SW2REG;


end Behavioral;
