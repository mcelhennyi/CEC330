----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/01/2015 04:03:02 PM
-- Design Name: 
-- Module Name: Memory_controller - Behavioral
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

entity Memory_controller is
    Port ( BTNC : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           CLK_SLOW : in STD_LOGIC;
           address_out : out STD_LOGIC_VECTOR (3 downto 0);
           data_out : out STD_LOGIC_VECTOR (7 downto 0)
           );
end Memory_controller;

architecture Behavioral of Memory_controller is

signal address : STD_LOGIC_VECTOR (3 downto 0) := "0000";

begin

memory_control: process(BTNC, BTNU, BTND, CLK_SLOW)   
    begin
    
--        if BTNC = '1' then 
--            data_out <= SW;
--        end if;
        
--        --Buttons Up and Down work off of the 1Hz clock signal
--        if (rising_edge(CLK_SLOW)) then
--            if BTNU = '1' then
--                if address < "1111" then
--                    address <= address + 1;
--                else
--                    address <= "0000";
--                end if;
--            elsif BTND = '1' then
--                if review > "0000" then
--                    address <= address - 1;
--                else
--                    address <= "1111";
--                end if;
--            end if;
--        end if;
--        --
--        address_out <= address;


    end process memory_control;        

end Behavioral;
