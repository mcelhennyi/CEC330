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

entity SPI_RX is
    Port ( SCLK : in STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           MOSI : in STD_LOGIC;--output pin to slave
           MISO : out STD_LOGIC--input pin frome slave
           );
end SPI_RX;

architecture Behavioral of SPI_RX is

signal serial_register : STD_LOGIC_VECTOR(7 downto 0) := x"00";

begin
--shifts data out every spi clock rising edge
SHIFT_DATA: process(SCLK)
    begin
        if (rising_edge(SCLK)) then 
            serial_register <= serial_register(6 downto 0) & MOSI;--MSB shifts out and LSB shifts in
        end if;
end process SHIFT_DATA;

--shift register triggered by the spi counter register
MISO <= serial_register(7);
DATA_OUT <= serial_register;

end Behavioral;
