----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/25/2015 03:30:05 PM
-- Design Name: 
-- Module Name: top_divide - Behavioral
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
use IEEE.math_real.all;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use ieee.numeric_std.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_divide is
    Port ( CLK_IN : in STD_LOGIC
           );
end top_divide;

architecture Behavioral of top_divide is


--signal x_average : STD_LOGIC_VECTOR (11 downto 0);
signal x_in : STD_LOGIC_VECTOR (11 downto 0) := x"123";

--variable x_average : STD_LOGIC_VECTOR (11 downto 0);
--variable x_in : STD_LOGIC_VECTOR (11 downto 0);

begin

divide: process(CLK_IN)
variable x_average : integer;
variable x_in_int : integer (0 to 4095);-- := to_integer(unsigned(x_in));
    begin
        x_in_int := to_integer(unsigned(x_in));
        x_average := x_average /2;
    end process divide;

--x_average <= std_logic_vector(to_integer(unsigned(x_average + X_IN)) / 2);


end Behavioral;


















