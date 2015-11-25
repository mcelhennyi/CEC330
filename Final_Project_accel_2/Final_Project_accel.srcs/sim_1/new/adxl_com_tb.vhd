----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/23/2015 12:24:36 PM
-- Design Name: 
-- Module Name: adxl_com_tb - Behavioral
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

entity adxl_com_tb is
end adxl_com_tb;

architecture Behavioral of adxl_com_tb is
Component ADXL362_com_fsm
    Port ( FSM_CLOCK : in STD_LOGIC; --State machine clock
           CMD : in STD_LOGIC_VECTOR (7 downto 0);--COMMAND TO WRITE OR READ
           ADDR : in STD_LOGIC_VECTOR (7 downto 0);--ADDRESS OF DATA TO SEND
           DATA : in STD_LOGIC_VECTOR (7 downto 0);--DATA TO SEND TO ACCEL
           START : in STD_LOGIC;--FLAG TO START COMMUNICATING WITH ACCELEROMETER
           TX_DONE : in STD_LOGIC; --FROM THE COUNTER OF THE SPI CLOCK
           DONE : out STD_LOGIC;--Tells the controlling module that it has finsihed
           TX_ENABLE : out STD_LOGIC;--TELLS THE COUNTER, SPI module AND CLOCK TO START TO ALLOW 8 BITS TO TRANSFER
           LOAD_ENABLE : OUT STD_LOGIC;--TELLS THE SPI BUS TO LOAD THE VALUE TO ITS SHIFT REGISTER BEFORE SHIFTING
           TX_DATA : out STD_LOGIC_VECTOR (7 downto 0);--BYTE OF DATA TO SPI MODULE
           CS : out STD_LOGIC);--CHIP SELECT FOR THE ACCELEROMETER
end component ADXL362_com_fsm;

component SPI_TX
    Port ( CLK_STATE : in STD_LOGIC;
           SPI_CLK_IN : in STD_LOGIC;
           TX_DATA : in STD_LOGIC_VECTOR (7 downto 0); --Data leaving master aka tx_data
           MOSI : out STD_LOGIC;--output pin to slave
           LOAD_ENABLE : in STD_LOGIC
           );
end component SPI_TX;

signal FSM_CLOCK : std_logic := '0';   --State machine clock
signal CMD : STD_LOGIC_VECTOR (7 downto 0):= x"00";--COMMAND TO WRITE OR READ
signal ADDR : STD_LOGIC_VECTOR (7 downto 0):= x"00";--ADDRESS OF DATA TO SEND
signal DATA : STD_LOGIC_VECTOR (7 downto 0):= x"00";--DATA TO SEND TO ACCEL
signal START : std_logic := '0';--FLAG TO START COMMUNICATING WITH ACCELEROMETER
signal TX_DONE  : std_logic := '0';--FROM THE COUNTER OF THE SPI CLOCK
signal DONE : std_logic := '0';--Tells the controlling module that it has finsihed
signal TX_ENABLE : std_logic := '0';--TELLS THE COUNTER, SPI module AND CLOCK TO START TO ALLOW 8 BITS TO TRANSFER
signal CS : std_logic := '0';

signal CLK_STATE : std_logic := '0';
signal SPI_CLK : std_logic := '0';
signal TX_DATA  : STD_LOGIC_VECTOR (7 downto 0):= x"00";--Data leaving master aka tx_data
signal MOSI : std_logic := '0';--output pin to slave
signal LOAD_ENABLE : std_logic := '0';

 --Clock Period
constant CLK_state_period : time := 10 ns; --100MHz clock
constant CLK_spi_period : time := 10000 ns; --100kHz clock


begin
--uut
uut: ADXL362_com_fsm
        Port ( FSM_CLOCK  --State machine clock
               CMD --COMMAND TO WRITE OR READ
               ADDR --ADDRESS OF DATA TO SEND
               DATA --DATA TO SEND TO ACCEL
               START --FLAG TO START COMMUNICATING WITH ACCELEROMETER
               TX_DONE  --FROM THE COUNTER OF THE SPI CLOCK
               DONE --Tells the controlling module that it has finsihed
               TX_ENABLE --TELLS THE COUNTER, SPI module AND CLOCK TO START TO ALLOW 8 BITS TO TRANSFER
               LOAD_ENABLE => LOAD_ENABLE, --TELLS THE SPI BUS TO LOAD THE VALUE TO ITS SHIFT REGISTER BEFORE SHIFTING
               TX_DATA => TX_DATA,--BYTE OF DATA TO SPI MODULE
               CS =>  CS--CHIP SELECT FOR THE ACCELEROMETER
                );
spi_tx: SPI_TX
    Port ( CLK_STATE => CLK_STATE,
           SPI_CLK_IN => SPI_CLK,
           TX_DATA => TX_DATA,--Data leaving master aka tx_data
           MOSI => MOSI,--output pin to slave
           LOAD_ENABLE => LOAD_ENABLE
           );


--clock process clock of 100 MHz
CLK_STATE_PROCESS: process
begin
   CLK_STATE <= '0';
   wait for CLK_state_period/2;
   CLK_STATE <= '1';
   wait for CLK_state_period/2;
end process CLK_STATE_PROCESS;



end Behavioral;