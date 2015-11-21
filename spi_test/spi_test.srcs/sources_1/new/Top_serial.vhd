----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/29/2015 05:07:12 PM
-- Design Name: 
-- Module Name: Top_serial - Behavioral
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

entity Top_serial is
    Port ( CLK_IN : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           LED : out STD_LOGIC_VECTOR (4 downto 0);
           MOSI : out STD_LOGIC;--Serial Pin JA-1
           MISO : in STD_LOGIC;--Serial Pin Ja-2
           SCLK : out STD_LOGIC--Serial Pin JA-3
           );
end Top_serial;

  architecture Behavioral of Top_serial is
-----------------------------------
--Signals--------------------------
-----------------------------------

signal clk_1Hz : STD_LOGIC := '0'; --The one Hz clock
signal clk_16Hz : STD_LOGIC := '0'; --16Hz clock
signal clk_50Hz : STD_LOGIC := '0'; --50Hz clock
signal clk_100KHz : STD_LOGIC := '0'; --100KHz clock
signal clk_200KHz : STD_LOGIC := '0'; --200KHz clock
signal clk_an : STD_LOGIC; --Clock that is around 70Hz going to the annodes and cathode counter
signal clk_state : STD_LOGIC; --Clock to change State Machine
signal pwm_clk : STD_LOGIC; --Clock that goes to PWM module

signal tx_done : STD_LOGIC;
signal tx_enable : STD_LOGIC := '0';
signal load_enable : STD_LOGIC := '0';
signal tx_data : STD_LOGIC_VECTOR(7 downto 0) := x"00"; --data to slave
signal rx_data : STD_LOGIC_VECTOR(7 downto 0);-- := x"00"; --data from slave

--spi
signal spi_clk : STD_LOGIC := '0';
signal spi_counter : STD_LOGIC_VECTOR(3 downto 0) := "0000";
signal mosi_from_SPI : STD_LOGIC := '0';

--States for the FSM
type FSM_state_type is (
st1_wait,  
st2_load_data, 
st3_saved_wait, 
st4_transmit
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
           CLK_OUT_100KHz : out STD_LOGIC;
           CLK_OUT_200KHz : out STD_LOGIC;
           CLK_OUT_AN : out STD_LOGIC;
           CLK_OUT_STATE : out STD_LOGIC
           );
end component Divider;
--exports data on the SPI bus
component SPI_TX
    Port ( CLK_STATE : in STD_LOGIC;
           SPI_CLK_IN : in STD_LOGIC;
           TX_DATA : in STD_LOGIC_VECTOR (7 downto 0); --Data leaving master through MOSI
           MOSI : out STD_LOGIC;--output pin to slave
           LOAD_ENABLE : in STD_LOGIC
           );
end component SPI_TX;
--exports data on the SPI bus
component SPI_RX
    Port ( CLK_STATE : in STD_LOGIC;
           SPI_CLK_IN : in STD_LOGIC;
           RX_DATA : out STD_LOGIC_VECTOR (7 downto 0); --Data Coming into master through MISO
           MISO : in STD_LOGIC;--input pin frome slave
           LOAD_ENABLE : in STD_LOGIC
           );
end component SPI_RX;

component SPI_state_clk
    Port ( CLK_200KHz : in STD_LOGIC;
           CLK_EN : in STD_LOGIC;
           TX_DONE : out STD_LOGIC;
           SPI_CLK : out STD_LOGIC
           );
end component SPI_state_clk;

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
               CLK_OUT_100Khz => clk_100KHz,
               CLK_OUT_200KHz => clk_200KHz,
               CLK_OUT_AN => clk_an,
               CLK_OUT_STATE => clk_state
               );

SPI_TX_map: SPI_TX
    port map ( CLK_STATE => clk_state,
               SPI_CLK_IN => spi_clk,
               TX_DATA => tx_data, --data to slave
               MOSI => mosi_from_SPI,--Serial Pin OUT, JA 1
               LOAD_ENABLE => load_enable
               );
               
SPI_RX_map: SPI_RX
    port map ( CLK_STATE => clk_state,
               SPI_CLK_IN => spi_clk,
               RX_DATA => rx_data, --data from slave
               MISO => MISO,--Serial Pin IN, JA 2
               LOAD_ENABLE => load_enable
               );

SPI_state_clk_map:  SPI_state_clk
    port map ( CLK_200KHz => clk_1Hz,
               CLK_EN => tx_enable,
               TX_DONE => tx_done,
               SPI_CLK => spi_clk
               );
   
SCLK <= spi_clk;--connects the spi to the output pin on the board
LED (3) <= spi_clk;        
LED (4) <= mosi_from_SPI;    
MOSI <= mosi_from_SPI;--Serial Pin OUT, JA 1

     
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
--            tx_data <= SW; 
            tx_data <= rx_data;
            load_enable <= '0';
            tx_enable <= '0';
            LED(0) <= '1';
            LED(1) <= '0';
            LED(2) <= '0';

        when st2_load_data =>
            tx_enable <= '0';
            load_enable <= '1';

        when st3_saved_wait =>       
            tx_enable <= '0';
            load_enable <= '0';
            LED(0) <= '0';
            LED(1) <= '1';
            LED(2) <= '0';

        when st4_transmit =>
            tx_enable <= '1';
            load_enable <= '0';
            LED(0) <= '0';
            LED(1) <= '0';
            LED(2) <= '1';

        when others => null;
    end case;
end process OUTPUT_DECODE;

--Chooses the next state depending on button presses
NEXT_STATE_DECODE: process (state,BTNU)
begin
 next_state <= state;  
 
--state case statement to change a state on rising edge  
case (state) is
    when st1_wait =>
        if BTNU = '1' then
           next_state <= st2_load_data;
--        elsif BTNL = '1' then
--          next_state <= st3_saved_wait;
        end if;
        
    when st2_load_data  =>
        next_state <= st3_saved_wait;
        
    when st3_saved_wait  =>
        if BTNU = '0' then
            if BTNC = '1' then
               next_state <= st4_transmit;
            end if; 
        end if;   
        
    when st4_transmit  =>
        if tx_done = '1' then
            next_state <= st1_wait;
        end if;
    
    when others =>
        next_state <= st1_wait;
    
    end case;      
end process;

end Behavioral;
