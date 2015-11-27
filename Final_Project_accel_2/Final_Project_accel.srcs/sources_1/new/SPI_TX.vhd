----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/01/2015 12:51:47 AM
-- Design Name: 
-- Module Name: SPI - Behavioral
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

entity SPI_TX is
    Port ( CLK_STATE : in STD_LOGIC;
           Disp5 : out STD_LOGIC_VECTOR(3 downto 0);
           Disp6 : out STD_LOGIC_VECTOR(3 downto 0);
           LED : out STD_LOGIC_VECTOR(7 downto 0);
           SPI_CLK_IN : in STD_LOGIC;
           TX_DATA : in STD_LOGIC_VECTOR (7 downto 0); --Data leaving master aka tx_data
           MOSI : out STD_LOGIC;--output pin to slave
           LOAD_ENABLE : in STD_LOGIC
           );
end SPI_TX;

architecture Behavioral of SPI_TX is

signal serial_register : STD_LOGIC_VECTOR(7 downto 0) := x"00";

begin
--Creates one SPI clock that only has 8 rising edges
SPI_PROCESS: process (CLK_STATE, SPI_CLK_IN, LOAD_ENABLE)
    begin
        if LOAD_ENABLE = '0' then
            if (rising_edge(SPI_CLK_IN)) then
                --serial_register <= serial_register(6 downto 0) & MISO;
                serial_register <= serial_register(6 downto 0) & '1';
            end if;
        elsif LOAD_ENABLE = '1' then
            serial_register <= TX_DATA;--Accepts the data to be transmitted
        end if;
end process SPI_PROCESS; 

MOSI <= serial_register(7);---------------Output bit to slave

Disp5 <= serial_register(3 downto 0);
Disp6 <= serial_register(7 downto 4);

LED <= serial_register;

end Behavioral;
