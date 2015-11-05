----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/05/2015 11:18:45 AM
-- Design Name: 
-- Module Name: top - Behavioral
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

entity top is
    Port ( 
           MOSI : in STD_LOGIC;
           MISO : out STD_LOGIC;
           SCLK : in STD_LOGIC;
           DISP : out STD_LOGIC_VECTOR (7 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           LED : out STD_LOGIC_VECTOR (7 downto 0)
           );
end top;

architecture Behavioral of top is
-----------------------------------
--Signals--------------------------
-----------------------------------
--display signals for the seven segment displays
signal Disp1 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp2 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp3 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp4 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp5 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp6 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp7 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp8 : STD_LOGIC_VECTOR (3 downto 0);

signal clk_an : STD_LOGIC; --Clock that is around 70Hz going to the annodes and cathode counter

signal rx_data : STD_LOGIC_VECTOR(7 downto 0);
signal mosi : STD_LOGIC :=0;--output pin to slave
signal miso : STD_LOGIC :=0;--input pin frome slave
signal spi_clk : STD_LOGIC :=0;

-----------------------------------
--COMPONETS------------------------
-----------------------------------
--Divides the clock into a 1hz slow signal and a ~70hz signal for the display switching
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_AN : out STD_LOGIC
           );
end component Divider;
--Drives the seven segment displays
component Seven_seg_driver
    Port ( CLK_AN : in STD_LOGIC;
           Disp1 : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           Disp2 : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           Disp3 : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           Disp4 : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           Disp5 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp6 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp7 : in STD_LOGIC_VECTOR (3 downto 0);
           Disp8 : in STD_LOGIC_VECTOR (3 downto 0);
           Display_out : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           AN_out : out STD_LOGIC_VECTOR (7 DOWNTO 0)
           );
end component Seven_seg_driver;
--exports data on the SPI bus
component SPI
    Port ( SPI_CLK_IN : in STD_LOGIC;
           SPI_CLK_OUT : out STD_LOGIC;
           DATA_OUT : in STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : out STD_LOGIC_VECTOR (7 downto 0);
           MOSI : out STD_LOGIC;--output pin to slave
           MISO : in STD_LOGIC;--input pin frome slave
           TX_ENABLE : in STD_LOGIC;
           TX_DONE : out STD_LOGIC
           );
end component SPI;
begin
------------------------------------
--PORT MAPS-------------------------
------------------------------------
-- maps the divider to the annode/cathode clock and the slow 1hz clock and 8 bit random number      
divider_map: Divider
    port map ( CLK_IN  => CLK_IN,
               CLK_OUT_AN => clk_an
               );
--maps the driver 
Seven_seg_map: Seven_seg_driver
    port map ( CLK_AN => clk_an,
               Disp1 => Disp1,
               Disp2 => Disp2,
               Disp3 => Disp3,
               Disp4 => Disp4,
               Disp5 => Disp5,
               Disp6 => Disp6,
               Disp7 => Disp7,
               Disp8 => Disp8,
               Display_out => SEG,
               AN_out => AN
               ); 
--maps the spi bus
SPI_map: SPI_RX
       port map ( SCLK => SCLK,
                  DATA_OUT => rx_data,
                  MOSI => MOSI,
                  MISO => MISO
                 );
------------------------------------
--Logic-----------------------------
------------------------------------
disp2 <= rx_data(7 downto 4);
disp1 <= rx_data(3 downto 0);
LED(7 downto 0) <= rx_data;

end Behavioral;
