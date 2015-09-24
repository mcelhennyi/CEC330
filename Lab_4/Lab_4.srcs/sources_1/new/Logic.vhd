----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/24/2015 06:36:40 PM
-- Design Name: 
-- Module Name: Logic - Behavioral
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

entity Logic is
    Port ( FLAG_0 : in STD_LOGIC;
           FLAG_15 : in STD_LOGIC;
           FLAG_17 : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           FLAG_an : out STD_LOGIC;
           Disp1 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp2 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp3 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp4 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp5 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp6 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp7 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp8 : out STD_LOGIC_VECTOR (3 downto 0);
           BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC
           );
end Logic;

architecture Behavioral of Logic is

begin

logic_sequence: process(FLAG_0, FLAG_15, FLAG_17)
    begin
        if FLAG_0 = '1' then
            --start process
            --generate A1, B1
            --store A1 and B1 to RAM
            --
            --display A1
            --display B1
            --display sw
            --
        elsif FLAG_15 = '1' then
            --start 15 sec process
        elsif FLAG_17 = '1' then
            --start 17 sec process
        end if;
    end process logic_sequence;

end Behavioral;
