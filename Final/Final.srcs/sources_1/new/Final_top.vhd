----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/12/2015 05:16:08 PM
-- Design Name: 
-- Module Name: Final_top - Behavioral
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

entity Final_top is
    Port ( CLK_IN : in STD_LOGIC;
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           --And Accelerometer ports!
           CPU_RESETN : in STD_LOGIC
           );
end Final_top;

architecture Behavioral of Final_top is

signal clk_1Hz : STD_LOGIC := '0'; --The one Hz clock
signal clk_16Hz : STD_LOGIC := '0'; --16Hz clock
signal clk_50Hz : STD_LOGIC := '0'; --50Hz clock
signal clk_400Hz : STD_LOGIC := '0'; --400Hz clock
signal clk_100KHz : STD_LOGIC := '0'; --100KHz clock
signal clk_200KHz : STD_LOGIC := '0'; --200KHz clock
signal clk_an : STD_LOGIC; --Clock that is around 70Hz going to the annodes and cathode counter
signal clk_state : STD_LOGIC; --Clock to change State Machine

--spi tx and rx signals, can be changed to make more sense later
-------------------------------------------------------------------------
signal tx_done : STD_LOGIC;
signal tx_enable : STD_LOGIC := '0';
signal load_enable : STD_LOGIC := '0';
signal tx_data : STD_LOGIC_VECTOR(7 downto 0) := x"00"; --data to slave
signal rx_data : STD_LOGIC_VECTOR(15 downto 0);-- := x"00"; --data from slave
signal mosi : STD_LOGIC := '0';
signal miso : STD_LOGIC := '0';
signal spi_clk : STD_LOGIC := '0';
----------------------------------------------------------------------------

--Master Top FSM signals
signal configure_accel : STD_LOGIC := '0';
signal read_accel : STD_LOGIC := '0';

--States for the FSM
type FSM_state_type is (
st1_wait, 
st2_configure, 
st2_read
); 
signal state, next_state : FSM_state_type;

-----------------------------------
--COMPONETS------------------------
-----------------------------------
--Divides the clock into a 1hz slow signal and a ~70hz signal for the display switching
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_1Hz : out STD_LOGIC;
           CLK_OUT_16Hz : out STD_LOGIC;
           CLK_OUT_50Hz :  out STD_LOGIC;
           CLK_OUT_400Hz :  out STD_LOGIC;
           CLK_OUT_100KHz : out STD_LOGIC;
           CLK_OUT_200KHz : out STD_LOGIC;
           CLK_OUT_AN : out STD_LOGIC;
           CLK_OUT_STATE : out STD_LOGIC
           );
end component Divider;
------------------------------------------------------------------exports data on the SPI bus
component SPI_TX
    Port ( CLK_STATE : in STD_LOGIC;
           SPI_CLK_IN : in STD_LOGIC;
           TX_DATA : in STD_LOGIC_VECTOR (7 downto 0); --Data leaving master through MOSI
           MOSI : out STD_LOGIC;--output pin to slave
           LOAD_ENABLE : in STD_LOGIC
           );
end component SPI_TX;

component SPI_RX
    Port ( CLK_STATE : in STD_LOGIC;
           SPI_CLK_IN : in STD_LOGIC;
           RX_DATA : out STD_LOGIC_VECTOR (15 downto 0); --Data Coming into master through MISO
           MISO : in STD_LOGIC--input pin frome slave
           );
end component SPI_RX;

component SPI_state_clk
    Port ( CLK_200KHz : in STD_LOGIC;
           CLK_EN : in STD_LOGIC;
           TX_DONE : out STD_LOGIC;
           SPI_CLK : out STD_LOGIC
           );
end component SPI_state_clk;
------------------------------------------------------------------
component config_fsm
    Port ( FSM_CLOCK : in STD_LOGIC;--gives the FSM speed clock to configuration FSM
           CONFIG_EN : in STD_LOGIC;--starts the configuration FSM steps
           ADDR_DONE : in STD_LOGIC;--from ADXL362_com_fsm telling the transmission of data, addr, and cmd are done
           CONFIG_DONE : out STD_LOGIC;--Tells controlling FSM/module that the configuration of the accel is done
           TX_DATA: out STD_LOGIC_VECTOR(7 downto 0);--sends the data to transmit to ADXL_fsm
           TX_ADDR : out STD_LOGIC_VECTOR(7 downto 0);--sends addr data to ADXL_fsm 
           TX_CMD : out STD_LOGIC_VECTOR(7 downto 0);--sends to read or write command to ADXL_fsm
           START : out STD_LOGIC--starts the communication for one register location
           );
end component config_fsm;

component ADXL362_com_fsm
    Port ( CMD : in STD_LOGIC_VECTOR (7 downto 0);--COMMAND TO WRITE OR READ
           ADDR : in STD_LOGIC_VECTOR (7 downto 0);--ADDRESS OF DATA TO SEND
           DATA : in STD_LOGIC_VECTOR (7 downto 0);--DATA TO SEND TO ACCEL
           START : in STD_LOGIC;--FLAG TO START COMMUNICATING WITH ACCELEROMETER
           TX_DONE : in STD_LOGIC; --FROM THE COUNTER OF THE SPI CLOCK
           DONE : out STD_LOGIC;--Tells the controlling module that it has finsihed
           TX_ENABLE : out STD_LOGIC;--TELLS THE COUNTER, SPI module AND CLOCK TO START TO ALLOW 8 BITS TO TRANSFER
           LOAD_ENABLE : OUT STD_LOGIC;--TELLS THE SPI BUS TO LOAD THE VALUE TO ITS SHIFT REGISTER BEFORE SHIFTING
           TX_DATA : out STD_LOGIC;--BYTE OF DATA TO SPI MODULE
           CS : out STD_LOGIC);--CHIP SELECT FOR THE ACCELEROMETER
end component ADXL362_com_fsm;
-----------------------------------------------------------------
component Read_accel_fsm
    Port ( FSM_CLOCK : in STD_LOGIC;--gives the FSM speed clock to configuration FSM
           READ_EN : in STD_LOGIC;--starts the read FSM steps
           RX_DATA : out STD_LOGIC_VECTOR(15 downto 0);--data from accel
           READ_DONE : in STD_LOGIC;--When the 8 clock cycles are done
           START : out STD_LOGIC--starts the reading for 8 bits of data
           );
end component Read_accel_fsm;

begin
------------------------------------
--PORT MAPS-------------------------
------------------------------------
-- maps the divider to the annode/cathode clock and the slow 1hz clock and 8 bit random number      
divider_map: Divider
    port map ( CLK_IN  => CLK_IN,
               CLK_OUT_1Hz => clk_1Hz,
               CLK_OUT_16Hz => clk_16Hz,
               CLK_OUT_50Hz => clk_50Hz,
               CLK_OUT_400Hz => clk_400Hz,
               CLK_OUT_100Khz => clk_100KHz,
               CLK_OUT_200KHz => clk_200KHz,
               CLK_OUT_AN => clk_an,
               CLK_OUT_STATE => clk_state
               );
----------------------------------------------------------------------------maps the spi
SPI_TX_map: SPI_TX
    port map ( CLK_STATE => clk_state,
               SPI_CLK_IN => spi_clk,
               TX_DATA => tx_data, --data to slave
               MOSI => mosi,--Serial Pin OUT, JA 1
               LOAD_ENABLE => load_enable
               );
               
SPI_RX_map: SPI_RX
    port map ( CLK_STATE => clk_state,
               SPI_CLK_IN => spi_clk,
               RX_DATA => rx_data, --data from slave
               MISO => miso--Serial Pin IN, JA 2
               );

SPI_state_clk_map:  SPI_state_clk
    port map ( CLK_200KHz => clk_400Hz,
               CLK_EN => tx_enable,
               TX_DONE => tx_done,
               SPI_CLK => spi_clk
               );
---------------------------------------------------------------------------              
--Config_map: config_fsm
--    port map ( FSM_CLOCK => clk_state,--gives the FSM speed clock to configuration FSM
--               CONFIG_EN--starts the configuration FSM steps
--               ADDR_DONE--from ADXL362_com_fsm telling the transmission of data, addr, and cmd are done
--               CONFIG_DONE--Tells controlling FSM/module that the configuration of the accel is done
--               TX_DATA--sends the data to transmit to ADXL_fsm
--               TX_ADDR--sends addr data to ADXL_fsm 
--               TX_CMD--sends to read or write command to ADXL_fsm
--               START--starts the communication for one register location
--               ); 

--ADXL_com_map: ADXL362_com_fsm
--    port map ( CMD--COMMAND TO WRITE OR READ
--               ADDR--ADDRESS OF DATA TO SEND
--               DATA--DATA TO SEND TO ACCEL
--               START--FLAG TO START COMMUNICATING WITH ACCELEROMETER
--               TX_DONE--FROM THE COUNTER OF THE SPI CLOCK
--               DONE--Tells the controlling module that it has finsihed
--               TX_ENABLE--TELLS THE COUNTER, SPI module AND CLOCK TO START TO ALLOW 8 BITS TO TRANSFER
--               LOAD_ENABLE--TELLS THE SPI BUS TO LOAD THE VALUE TO ITS SHIFT REGISTER BEFORE SHIFTING
--               TX_DATA--BYTE OF DATA TO SPI MODULE
--               CS--CHIP SELECT FOR THE ACCELEROMETER
--               );
----------------------------------------------------------------------------
Read_fsm_map: Read_accel_fsm
    port map ( FSM_CLOCK => clk_state,
               READ_EN => read_accel,
               RX_DATA => rx_data,
               READ_DONE => tx_done,
               START => tx_enable
               );           

------------------------------------
--State Machine---------------------
------------------------------------
--Switches the state to the next state every clock cycle of CLK_IN
SYNC_PROC: process (clk_state)
begin
    if (clk_state'event and clk_state = '1') then
        state <= next_state;
    end if;
end process;
--The operations of eache state
OUTPUT_DECODE: process (state)
begin
    case state is
        when st1_wait =>
            configure_accel <= '0';
            read_accel <= '0';

        when st2_configure =>
            configure_accel <= '1';
            read_accel <= '0';

        when st3_read  =>
            configure_accel <= '0';
            read_accel <= '1';

        when others => null;
    end case;
end process OUTPUT_DECODE;

--Chooses the next state depending on button presses
NEXT_STATE_DECODE: process (state, BTNC, BTNU)
begin
    next_state <= state;  
 
--state case statement to change a state on rising edge  
    case (state) is
        when st1_wait =>
            if CPU_RESET = '0' then
                next_state <= st2_configure;
            end if;
            
        when st2_configure =>
            next_state <= st3_read;
            
        when st3_read => 
            if CPU_RESET = '1' then
                next_state <= st1_wait;
            end if;
        
        when others =>
            next_state <= st1_wait;
    
    end case;      
end process;

------------------------------------
--Other??---------------------------
------------------------------------

end Behavioral;
