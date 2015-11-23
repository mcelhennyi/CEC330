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
    Port ( CLK_STATE : in STD_LOGIC;
           SPI_CLK_IN : in STD_LOGIC;
           RX_DATA : out STD_LOGIC_VECTOR (15 downto 0); --Data Coming into master aka rx_data
           MISO : in STD_LOGIC--input pin frome slave
           );
end SPI_RX;

architecture Behavioral of SPI_RX is

signal accel_register : STD_LOGIC_VECTOR(15 downto 0) := x"0000";

begin
--Creates one SPI clock that only has 8 rising edges
SPI_PROCESS: process (CLK_STATE,SPI_CLK_IN)
    begin
        if (rising_edge(SPI_CLK_IN)) then
            accel_register <= accel_register(14 downto 0) & MISO;
        end if;
end process SPI_PROCESS; 

RX_DATA <= accel_register;---------------Data recieved from slave after transmistion is done

end Behavioral;
