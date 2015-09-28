----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/27/2015 11:38:34 PM
-- Design Name: 
-- Module Name: random - Behavioral
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

entity random is
    Port ( clk_in : in STD_LOGIC;
           rand_out : out STD_LOGIC_VECTOR (7 downto 0)
           );
end random;

architecture Behavioral of random is

signal register_1 : STD_LOGIC_VECTOR (19 DOWNTO 0) := x"00000";

begin

--counts up every clock for a clock divider
counter: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            register_1 <= register_1 + 1;
        end if;
    end process counter;
    
rand_out(7) <= register_1(4) and register_1(2);
rand_out(6) <= register_1(18) and register_1(16);
rand_out(5) <= register_1(14) xor register_1(12);
rand_out(4) <= register_1(3) xor register_1(4);
rand_out(3) <= register_1(7) xor register_1(2);
rand_out(2) <= register_1(9) xor register_1(12);
rand_out(1) <= register_1(14) xor register_1(12);
rand_out(0) <= register_1(19) xor register_1(0);


end Behavioral;
