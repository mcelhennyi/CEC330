----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/01/2015 03:11:48 PM
-- Design Name: 
-- Module Name: Memory - Behavioral
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

entity Memory is
    Port ( CLK : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (3 downto 0);
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           WE : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0)
           );
end Memory;

architecture Behavioral of Memory is

    --makes an array for the RAM
    type RAM_array is array (15 downto 0) of STD_LOGIC_VECTOR (7 downto 0); 
    signal RAM : RAM_array;

begin

memory_control: process(CLK)
variable index_address : integer := to_integer(signed(address)); --makes integer value of test count from sequencer
  
    begin
    
        if (CLK'event and CLK = '1') then
            if (WE = '1') then
                RAM(index_address) <= data_in;
            end if;
        end if;

    data_out <= RAM(index_address);
                
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

    end process memory_control;        

end Behavioral;
