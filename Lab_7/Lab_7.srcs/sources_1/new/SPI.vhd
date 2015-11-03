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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity SPI is
    Port ( SPI_CLK_IN : in STD_LOGIC;
           SPI_CLK_OUT : out STD_LOGIC;
           DATA_OUT : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : out STD_LOGIC_VECTOR (7 downto 0);
           MOSI : out STD_LOGIC;--output pin to slave
           MISO : in STD_LOGIC;--input pin frome slave
           TX_ENABLE : in STD_LOGIC;
           TX_DONE : out STD_LOGIC
           );
end SPI;

architecture Behavioral of SPI is

signal spi_clock : STD_LOGIC := '0';
signal spi_counter : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal serial_register : STD_LOGIC_VECTOR(7 downto 0) := DATA_IN;

begin
--Creates one SPI clock that only has 8 rising edges
SPI_CLOCK_OUT: process (TX_ENABLE)
    begin
        if TX_ENABLE = '1' then 
            SPI_CLK_OUT <= spi_clock;
        end if;
end process SPI_CLOCK_OUT; 

--counter enabled by the tx_enable to shift the parallel data out on SPI bus
SPI_CLOCK_ENABLE: process(SPI_CLK_IN, TX_ENABLE)
    begin
        if TX_ENABLE = '1' then
                if (rising_edge(SPI_CLK_IN)) then
                     spi_counter <= spi_counter + 1;
                end if;
        end if;
end process SPI_CLOCK_ENABLE;

--Module to stop the transmission of the SPI data after 8 rising edges
STOP_TX: process(spi_counter)
    begin
        if spi_counter = "1000" then
            TX_DONE <= '1';
            spi_counter <= "0000";
        else
            TX_DONE <= '0';
        end if;
end process STOP_TX;

--shifts data out every spi clock rising edge
SHIFT_DATA: process(SPI_CLOCK_OUT)
    begin
        if (rising_edge(SPI_CLOCK_OUT)) then 
            serial_register <= serial_register(6 downto 0) & MISO;
        end if;
end process SHIFT_DATA;

--shift register triggered by the spi counter register
MOSI <= serial_register(7);
DATA_OUT <= serial_register;

end Behavioral;
