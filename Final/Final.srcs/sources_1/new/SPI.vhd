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

entity SPI is
    Port ( SPI_CLK_IN : in STD_LOGIC;
           SPI_CLK_OUT : out STD_LOGIC;
           TX_DATA : in STD_LOGIC_VECTOR (7 downto 0); --Data leaving master aka tx_data
           RX_DATA : out STD_LOGIC_VECTOR (7 downto 0); --Data Coming into master aka rx_data
           SAVED_DATA : in STD_LOGIC;
           MOSI : out STD_LOGIC;--output pin to slave
           MISO : in STD_LOGIC;--input pin frome slave
           TX_ENABLE : in STD_LOGIC;
           TX_DONE : out STD_LOGIC
           );
end SPI;

architecture Behavioral of SPI is

signal spi_clock : STD_LOGIC := '0';
signal spi_counter : STD_LOGIC_VECTOR(3 downto 0) := "1111";
signal serial_register : STD_LOGIC_VECTOR(7 downto 0) := x"00";
signal serial_buffer : STD_LOGIC_VECTOR(7 downto 0) := x"00"; --used to avoid multi driven net

begin

--serial_buffer <= DATA_OUT;

SAVE_DATA: process(SAVED_DATA)
    begin
        if SAVED_DATA = '1' then
            serial_buffer <= TX_DATA;

            --serial_register <= serial_buffer;

        end if;
end process SAVE_DATA;
    
--Creates one SPI clock that only has 8 rising edges
SPI: process (TX_ENABLE, SPI_CLK_IN,SAVED_DATA)
    begin
        if TX_ENABLE = '1' then
            SPI_CLK_OUT <= SPI_CLK_IN;--Sclk_out is turned on
            
            if spi_counter = "1111" then
                serial_register <= serial_buffer;
                spi_counter <= "0000";
                --serial_register <= DATA_OUT;
            elsif (rising_edge(SPI_CLK_IN)) then
                --spi_counter <= spi_counter + 1;
                serial_register <= serial_register(6 downto 0) & MISO;
                if spi_counter = "1000" then
                    TX_DONE <= '1';
                    spi_counter <= "1111";
                elsif spi_counter < "1000" then
                    TX_DONE <= '0';
                    spi_counter <= spi_counter + 1;
                else
                    spi_counter <= "0000";
                end if;
            end if;
            
        elsif TX_ENABLE = '0' then
            SPI_CLK_OUT <= '0';--Sclk_out is turned off
        end if;
end process SPI; 

--shift register triggered by the spi counter register
MOSI <= serial_register(7);
RX_DATA <= serial_register;


end Behavioral;
