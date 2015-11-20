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
           CLK_OUT_1Hz : out STD_LOGIC;
           CLK_OUT_16Hz : out STD_LOGIC;
           CLK_OUT_50Hz :  out STD_LOGIC;
           CLK_OUT_100KHz : out STD_LOGIC;
           CLK_OUT_200KHz : out STD_LOGIC;
           CLK_OUT_AN : out STD_LOGIC;
           CLK_OUT_STATE : out STD_LOGIC
           );
end Divider;

architecture Behavioral of Divider is

--1Hz counter signals
signal counter1Hz : STD_LOGIC_VECTOR (26 DOWNTO 0) := "000" & x"000000";
signal clk_out1Hz : STD_LOGIC := '0';
--16Hz counter signals
signal counter16Hz : STD_LOGIC_VECTOR (23 DOWNTO 0) := x"000000";
signal clk_out16Hz : STD_LOGIC := '0';
--50Hz counter signals
signal counter50Hz : STD_LOGIC_VECTOR (12 DOWNTO 0) := '0' & x"000";
signal clk_out50Hz : STD_LOGIC := '0';
--100KHz counter signals
signal counter100KHz : STD_LOGIC_VECTOR (12 DOWNTO 0) := '0' & x"000";
signal clk_out100KHz : STD_LOGIC := '0';
--200KHz counter signals
signal counter200KHz : STD_LOGIC_VECTOR (12 DOWNTO 0) := '0' & x"000";
signal clk_out200KHz : STD_LOGIC := '0';

begin
--SPI bus 100KHz clock
counter200K: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            counter200KHz <= counter200KHz +1;
            if counter200KHz = '0' & x"0FA" then
                clk_out200KHz <= '1';
            elsif counter200KHz = "0111110100" then
                clk_out200KHz <= '0';
                counter200KHz <= '0' & x"000";
            end if;
        end if;
end process counter200K;

--SPI bus 100KHz clock
counter100K: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            counter100KHz <= counter100KHz +1;
            if counter100KHz = "0111110100" then
                clk_out100KHz <= '1';
            elsif counter100KHz = "1111101000" then
                clk_out100KHz <= '0';
                counter100KHz <= '0' & x"000";
            end if;
        end if;
end process counter100K;

--50Hz clock
counter50: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            counter50Hz <= counter50Hz +1;
            if counter50Hz = "0111101000010" then
                clk_out50Hz <= '1';
            elsif counter50Hz = "1111010000100" then
                clk_out50Hz <= '0';
                counter50Hz <= '0' & x"000";
            end if;
        end if;
end process counter50;

--16Hz clock
counter16: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            counter16Hz <= counter16Hz +1;
            if counter16Hz = "001011111010111100001000" then
                clk_out16Hz <= '1';
            elsif counter16Hz = "010111110101111000010000" then
                clk_out16Hz <= '0';
                counter16Hz <= x"000000";
            end if;
            
        end if;
    end process counter16;
    
--1Hz clock
counter1: process(CLK_IN)
        begin
            if (rising_edge(CLK_IN)) then
                counter1Hz <= counter1Hz +1;
                if counter1Hz = "010111110101111000010000000" then
                    clk_out1Hz <= '1';
                elsif counter1Hz = "101111101011110000100000000" then
                    clk_out1Hz <= '0';
                    counter1Hz <= "000" & x"000000";
                end if;
                
            end if;
        end process counter1;
        
CLK_OUT_1Hz <= clk_out1Hz;--Slow 1Hz clock
CLK_OUT_16Hz <= clk_out16Hz;--16Hz clock
CLK_OUT_50Hz <= clk_out50Hz; --PWM refresh clock for LEDS
CLK_OUT_100KHz <= clk_out100KHz;--SPI bus clock
CLK_OUT_200KHz <= clk_out200KHz;--SPI bus clock
CLK_OUT_AN <= clk_out50Hz;--For seven segment display switching
CLK_OUT_STATE <= CLK_IN; --Counter to change a state machine

end Behavioral;
