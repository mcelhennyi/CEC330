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



signal FSM_CLOCK : std_logic := '0';   --State machine clock
signal CMD : STD_LOGIC_VECTOR (7 downto 0):= x"00";--COMMAND TO WRITE OR READ
signal ADDR : STD_LOGIC_VECTOR (7 downto 0):= x"00";--ADDRESS OF DATA TO SEND
signal DATA : STD_LOGIC_VECTOR (7 downto 0):= x"00";--DATA TO SEND TO ACCEL
signal START : std_logic := '1';--FLAG TO START COMMUNICATING WITH ACCELEROMETER
signal TX_DONE  : std_logic := '1';--FROM THE COUNTER OF THE SPI CLOCK
signal DONE : std_logic := '0';--Tells the controlling module that it has finsihed
signal TX_ENABLE : std_logic := '0';--TELLS THE COUNTER, SPI module AND CLOCK TO START TO ALLOW 8 BITS TO TRANSFER
signal LOAD_ENABLE : std_logic := '0';
signal CS : std_logic := '0';

signal CLK_STATE : std_logic := '0';
signal TX_DATA  : STD_LOGIC_VECTOR (7 downto 0):= x"00";--Data leaving master aka tx_data

--signal CLK_SPI_IN : std_logic := '0';

 --Clock Period
constant CLK_state_period : time := 10 ns; --100MHz clock
--constant CLK_spi_in_period : time := 5000 ns; --200kHz clock


begin
--uut
uut: ADXL362_com_fsm
        Port map ( --in
                   FSM_CLOCK => CLK_STATE,  --State machine clock
                   CMD =>  CMD,--COMMAND TO WRITE OR READ
                   ADDR =>  ADDR, --ADDRESS OF DATA TO SEND
                   DATA =>  DATA, --DATA TO SEND TO ACCEL
                   START =>  START, --FLAG TO START COMMUNICATING WITH ACCELEROMETER
                   TX_DONE =>  TX_DONE,  --FROM THE COUNTER OF THE SPI CLOCK
                   --out
                   DONE =>  DONE, --Tells the controlling module that it has finsihed
                   TX_ENABLE => TX_ENABLE, --TELLS THE COUNTER, SPI module AND CLOCK TO START TO ALLOW 8 BITS TO TRANSFER
                   LOAD_ENABLE => LOAD_ENABLE, --TELLS THE SPI BUS TO LOAD THE VALUE TO ITS SHIFT REGISTER BEFORE SHIFTING
                   TX_DATA => TX_DATA,--BYTE OF DATA TO SPI MODULE
                   CS =>  CS--CHIP SELECT FOR THE ACCELEROMETER
                    );

--clock process clock of 100 MHz
CLK_STATE_PROCESS: process
    begin
       CLK_STATE <= '0';
       wait for CLK_state_period/2;
       CLK_STATE <= '1';
       wait for CLK_state_period/2;
end process CLK_STATE_PROCESS;

----clock process clock of 200 KHz
--CLK_SPI_IN_PROCESS: process
--    begin
--       CLK_SPI_IN <= '0';
--       wait for CLK_spi_in_period/2;
--       CLK_SPI_IN <= '1';
--       wait for CLK_spi_in_period/2;
--end process CLK_SPI_IN_PROCESS;

--stimulus to write to memory
stim_proc: process
    begin
        --load the data
        CMD <= x"0A";
        ADDR <= x"28";
        DATA <= "00001110";
        wait for 40 ns;
        --Notify UUT to start FSM
        START <= '1';
        wait for 10 ns;
        START <= '0';
        wait for 90 ns;
        --message from SPI_TX that it has tx-ed the data
        TX_DONE <= '1';
        wait for 7 ns;
--        TX_DONE <= '0';--reset the tx_done
        --message from SPI_TX that it has tx-ed the data
        wait for 100 ns;
        TX_DONE <= '1';
        wait for 15 ns;
--        TX_DONE <= '0';--reset the tx_done
        --message from SPI_TX that it has tx-ed the data
        wait for 100 ns;
        TX_DONE <= '1';
        wait for 7 ns;
--        TX_DONE <= '0';
        CMD <= x"00";
        ADDR <= x"00";
        DATA <= "00000000";       
        wait;
        
end process stim_proc;

end Behavioral;