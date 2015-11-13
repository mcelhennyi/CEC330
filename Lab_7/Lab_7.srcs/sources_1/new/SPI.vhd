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
           LED : out STD_LOGIC_VECTOR (11 downto 8);
           SPI_CLK_OUT : out STD_LOGIC;
           DATA_OUT : in STD_LOGIC_VECTOR (7 downto 0); --Data leaving master aka tx_data
           DATA_IN : out STD_LOGIC_VECTOR (7 downto 0); --Data Coming into master aka rx_data
           SAVED_DATA : in STD_LOGIC;
           MOSI : out STD_LOGIC;--output pin to slave
           MISO : in STD_LOGIC;--input pin frome slave
           TX_ENABLE : in STD_LOGIC;
           TX_DONE : out STD_LOGIC
           );
end SPI;

architecture Behavioral of SPI is

signal spi_clock : STD_LOGIC := '0';
signal spi_counter : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal serial_register : STD_LOGIC_VECTOR(7 downto 0) := x"00";
--signal serial_buffer : STD_LOGIC_VECTOR(7 downto 0) := x"00"; --used to avoid multi driven net

signal SPI_CLK_OUT_test : STD_LOGIC := '0';

begin

    
--Creates one SPI clock that only has 8 rising edges
SPI_PROCESS: process (TX_ENABLE, SPI_CLK_IN)
    begin
        if TX_ENABLE = '1' then
            --Sclk_out is turned on
            ---------------------------------------
            SPI_CLK_OUT_test <= SPI_CLK_IN;------should be the same as the clk out
            SPI_CLK_OUT <= SPI_CLK_IN;-----if the clock is high when tx_enable goes high then the slave may see this as a rising edge?
                                         --may be able to resolve this problem by taking out tx_enable fromthe porcess
            
            
            --Counter for controlling this module
            ---------------------------------------
            if (rising_edge(SPI_CLK_IN)) then
                spi_counter <= spi_counter + 1;
            end if;
            
            --Checks counter
            ---------------------------------------
            if (rising_edge(SPI_CLK_IN)) then
                if spi_counter >= "1000" then--may need to set this to "0111" but not sure yet
                    TX_DONE <= '1';
                    spi_counter <= "0000";
                    
                    --LED(9) <= '1';
                    --LED(8) <= '0';
                else
                    TX_DONE <= '0';
                    
                    --LED(9) <= '0';
                    --LED(8) <= '1';
                end if;
            end if;
            
            --Shifting the register
            --------------------------------------
            if (rising_edge(SPI_CLK_IN)) then
                serial_register <= serial_register(6 downto 0) & MISO;
            end if;
            
--            LED(11) <= '1';
--            LED(10) <= '0';
            
        elsif TX_ENABLE = '0' then
            SPI_CLK_OUT_test <= '0';------should be the same as the clk out
            SPI_CLK_OUT <= '0';-----------Sclk_out is turned off
            serial_register <= DATA_OUT;--Accepts the data to be transmitted
            
--            LED(11) <= '0';
--            LED(10) <= '1';
        end if;
end process SPI_PROCESS; 

MOSI <= serial_register(7);---------------Output bit to slave
DATA_IN <= serial_register;---------------Data recieved from slave after transmistion is done

LED(8) <= SPI_CLK_OUT_test;


------------------------------------------
--this is one idea but i think it wont work becuase i think we need the checks counter in the rising edge if statement
------------------------------------------

--SPI_PROCESS: process (TX_ENABLE, SPI_CLK_IN)
--    begin
--        if TX_ENABLE = '1' then
--            --Sclk_out is turned on
--            ---------------------------------------
--            SPI_CLK_OUT <= SPI_CLK_IN;-----if the clock is high when tx_enable goes high then the slave may see this as a rising edge?
--                                         --may be able to resolve this problem by taking out tx_enable fromthe porcess
            
--            --Counter for controlling this module
--            ---------------------------------------
--            if (rising_edge(SPI_CLK_IN)) then
--                spi_counter <= spi_counter + 1;
--            end if;
            
--            --Checks counter
--            ---------------------------------------
--            if spi_counter >= "1000" then--may need to set this to "0111" but not sure yet
--                TX_DONE <= '1';
--                spi_counter <= "0000";
--            else
--                TX_DONE <= '0';
--            end if;
            
--            --Shifting the register
--            --------------------------------------
--            if (rising_edge(SPI_CLK_IN)) then
--                serial_register <= serial_register(6 downto 0) & MISO;
--            end if;
            
--        elsif TX_ENABLE = '0' then
--            SPI_CLK_OUT <= '0';-----------Sclk_out is turned off
--            serial_register <= DATA_OUT;--Accepts the data to be transmitted
            
--        end if;
--end process SPI_PROCESS; 




end Behavioral;








-----------------------------------------
--old ideas
-----------------------------------------


--SAVE_DATA: process(SAVED_DATA)
--    begin
--        if SAVED_DATA = '1' then
--            serial_buffer <= DATA_OUT;

--            --serial_register <= serial_buffer;

--        end if;
--end process SAVE_DATA;
    
----Creates one SPI clock that only has 8 rising edges
--SPI: process (TX_ENABLE, SPI_CLK_IN,SAVED_DATA)
--    begin
--        if TX_ENABLE = '1' then
--           -- if spi_counter >= "0000" and spi_counter < "1000" then 
--                SPI_CLK_OUT <= SPI_CLK_IN;--Sclk_out is turned on
--            --end if;
            
----            if spi_counter = "1111" then
----                serial_register <= serial_buffer;
----                spi_counter <= "0000";
----                --serial_register <= DATA_OUT;
----            end if;
            
--            if (rising_edge(SPI_CLK_IN)) then
--                --spi_counter <= spi_counter + 1;
--                if spi_counter >= "0000" and spi_counter < "1000" then
--                    serial_register <= serial_register(6 downto 0) & MISO;
--                end if;
                
----                if spi_counter = "1000" then
----                    TX_DONE <= '1';
----                    spi_counter <= "1111";
----                elsif spi_counter < "1000" then
----                    TX_DONE <= '0';
----                    spi_counter <= spi_counter + 1;
------                else
------                    spi_counter <= "0000";
----                end if;
--            end if;
            
--        elsif TX_ENABLE = '0' then
--            SPI_CLK_OUT <= '0';--Sclk_out is turned off
--        end if;
--end process SPI; 

----Module to stop the transmission of the SPI data after 8 rising edges
--STOP_TX: process(SPI_CLK_IN,TX_ENABLE)
--    begin
----        if spi_counter = "1000" then
----            TX_DONE <= '1';
----            spi_counter <= "0000";
----        else
----            TX_DONE <= '0';
----        end if;
--        if TX_ENABLE = '1' then
--            if (rising_edge(SPI_CLK_IN)) then
--                spi_counter <= spi_counter + 1;
--            end if;
            
--            if spi_counter = "1000" then
--                   TX_DONE <= '1';
--                   spi_counter <= "0000";
--               elsif spi_counter < "1000" then
--                   TX_DONE <= '0';
                   
--                   LED8 <= '1';
--                else
--                    --spi_counter <= "0000";
--                    LED8 <= '0';
--               end if;
--          end if;
--end process STOP_TX;


------------------------------------------------------not sure about having somthing rely on an output
------------------------------------------------------dont like how all this is split up so much 
----Creates one SPI clock that only has 8 rising edges
--SPI_CLOCK_OUT: process (TX_ENABLE)
--    begin
----        if TX_ENABLE = '1' then 
----            SPI_CLK_OUT <= spi_clock; ------------------------------------------------needs work?
----        end if;
--        if TX_ENABLE = '1' then
--            SPI_CLK_OUT <= SPI_CLK_IN;
--        elsif TX_ENABLE = '0' then
--            SPI_CLK_OUT <= '0';
--        end if;
--end process SPI_CLOCK_OUT; 

----counter enabled by the tx_enable to shift the parallel data out on SPI bus
--SPI_CLOCK_ENABLE: process(SPI_CLK_OUT, TX_ENABLE)
--    begin
--        if TX_ENABLE = '1' then
--                if (rising_edge(SPI_CLK_OUT)) then
--                     spi_counter <= spi_counter + 1;
--                end if;
--        end if;
--end process SPI_CLOCK_ENABLE;

----Module to stop the transmission of the SPI data after 8 rising edges
--STOP_TX: process(spi_counter)
--    begin
--        if spi_counter = "1000" then
--            TX_DONE <= '1';
--            spi_counter <= "0000";
--        else
--            TX_DONE <= '0';
--        end if;
--end process STOP_TX;

----shifts data out every spi clock rising edge
--SHIFT_DATA: process(SPI_CLK_OUT)
--    begin
--        if (rising_edge(SPI_CLK_OUT)) then 
--            serial_register <= serial_register(6 downto 0) & MISO;
--        end if;
--end process SHIFT_DATA;

