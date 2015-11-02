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
           TX_ENABLE : in STD_LOGIC;
           TX_DONE : out STD_LOGIC
           );
end SPI;

architecture Behavioral of SPI is
signal spi_clock : STD_LOGIC := '0';
signal spi_counter : STD_LOGIC_VECTOR(3 downto 0) := "0000";

begin

--counter enabled by the tx_enable to shift the parallel data out on SPI bus
SPI_CLOCK_ENABLE: process(SPI_CLK_IN, TX_ENABLE)
    begin
        if TX_ENABLE = '1' then
            if spi_counter <= "0111" then
                if (rising_edge(SPI_CLK_IN)) then
                     spi_counter => spi_counter + 1;
                end if;
            elsif spi_counter = 8 then
            
            end if;
        end if;
    end process SPI_CLOCK_ENABLE;
    
--shift register triggered by the spi counter register


SPI_CLOCK_OUT => spi_clock
end Behavioral;
