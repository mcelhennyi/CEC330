----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/01/2015 03:59:09 PM
-- Design Name: 
-- Module Name: Processor - Behavioral
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

entity Processor is
    Port ( BTNL : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           instruction_in : in STD_LOGIC_VECTOR (3 downto 0);
           ram_address_A : in STD_LOGIC_VECTOR (3 downto 0);
           ram_address_B : in STD_LOGIC_VECTOR (3 downto 0)
           );
end Processor;

architecture Behavioral of Processor is

begin


end Behavioral;
