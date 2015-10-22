----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/24/2015 03:07:47 PM
-- Design Name: 
-- Module Name: Divider - Behavioral
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

entity Divider is
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_SLOW : out STD_LOGIC;
           CLK_OUT_AN : out STD_LOGIC;
           CLK_OUT_STATE : out STD_LOGIC
           );
end Divider;

architecture Behavioral of Divider is

signal register_counter : STD_LOGIC_VECTOR (26 DOWNTO 0) := "000" & x"000000";

signal counter1Hz : STD_LOGIC_VECTOR (31 DOWNTO 0) := x"00000000";
signal clk_out1Hz : STD_LOGIC := 0;

signal counter16Hz : STD_LOGIC_VECTOR (23 DOWNTO 0) := x"000000";
signal clk_out16Hz : STD_LOGIC := 0;

begin

--16Hz clock
counter: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            register_counter <= register_counter +1;
            if counter16Hz = "001011111010111100001000" then
                clk_out16Hz = '1';
            elsif counter16Hz = "010111110101111000010000" then
                clk_out16Hz = '0';
                counter16Hz = x"000000";
            end if;
            
        end if;
    end process counter;
    
--1Hz clock
    counter: process(CLK_IN)
        begin
            if (rising_edge(CLK_IN)) then
                register_counter <= register_counter +1;
                if counter1Hz = "00011101110011010110010100000000" then
                    clk_out1Hz = '1';
                elsif counter1Hz = "00111011100110101100101000000000" then
                    clk_out1Hz = '0';
                    counter1Hz = x"00000000";
                end if;
                
            end if;
        end process counter;
        
CLK_OUT_SLOW <= clk_out1Hz;--Slow 1Hz clock

CLK_OUT_AN <= register_counter(14);--About 70Hz for display switching
CLK_OUT_STATE <= register_counter(4); --Counter to change a state machine

end Behavioral;
