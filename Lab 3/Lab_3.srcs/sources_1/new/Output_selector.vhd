----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/21/2015 01:49:48 PM
-- Design Name: 
-- Module Name: Output_selector - Behavioral
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

entity Output_selector is
    Port ( switch_in : in STD_LOGIC_VECTOR (15 downto 0);
           count_in : in STD_LOGIC_VECTOR (15 downto 0);
           FLAG : in STD_LOGIC;
           reg_to_driver : out STD_LOGIC_VECTOR (15 downto 0)
           );
end Output_selector;

architecture Behavioral of Output_selector is

begin

--decides which register value to show
WITH FLAG SELECT
    reg_to_driver <= switch_in WHEN '0', --sw2reg value 
                     count_in WHEN '1'; --countdown value
end Behavioral;
