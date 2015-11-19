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
           LED : out STD_LOGIC_VECTOR (15 downto 0)
           );
end Final_top;

architecture Behavioral of Final_top is

signal clk_1Hz : STD_LOGIC := '0'; --The one Hz clock
signal clk_16Hz : STD_LOGIC := '0'; --16Hz clock
signal clk_50Hz : STD_LOGIC := '0'; --50Hz clock
signal clk_100KHz : STD_LOGIC := '0'; --100KHz clock
signal clk_an : STD_LOGIC; --Clock that is around 70Hz going to the annodes and cathode counter
signal clk_state : STD_LOGIC; --Clock to change State Machine
signal pwm_clk : STD_LOGIC; --Clock that goes to PWM module

--States for the FSM
type FSM_state_type is (st1_wait, st2_prep_data, st2_5_save_data, st3_saved_wait, st4_transmit); 
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
           CLK_OUT_AN : out STD_LOGIC;
           CLK_OUT_STATE : out STD_LOGIC
           );
end component Divider;
--exports data on the SPI bus
component SPI
    Port ( SPI_CLK_IN : in STD_LOGIC;
           SPI_CLK_OUT : out STD_LOGIC;
           TX_DATA : in STD_LOGIC_VECTOR (7 downto 0); --Data leaving master through MOSI
           RX_DATA : out STD_LOGIC_VECTOR (7 downto 0); --Data Coming into master through MISO
           SAVED_DATA : in STD_LOGIC;
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
               CLK_OUT_1Hz => clk_1Hz,
               CLK_OUT_16Hz => clk_16Hz,
               CLK_OUT_50Hz => clk_50Hz,
               CLK_OUT_100Khz => clk_100KHz,
               CLK_OUT_AN => clk_an,
               CLK_OUT_STATE => clk_state
               );
--maps the spi bus
SPI_map: SPI 
    port map ( SPI_CLK_IN => clk_100KHz,
              SPI_CLK_OUT => SCLK,--Serial Pin OUT
              TX_DATA => tx_data, --data to slave
              RX_DATA => rx_data, --data from slave
              SAVED_DATA => saved_data,
              MOSI => MOSI,--Serial Pin OUT
              MISO => MISO,--Serial Pin IN
              TX_ENABLE => tx_enable,
              TX_DONE => tx_done
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
--            tx_enable <= '0';
--            saved_data <= '0';
--            data_accepted <= '0';

        when st2_prep_data =>
--            tx_data <= SW; 
--            tx_data_copy <= SW;--testing to see if this helps
--            saved_data <= '0';
--            data_accepted <= '0';
--            tx_enable <= '0';

        when st2_5_save_data =>
--            saved_data <= '1';
--            data_accepted <= '1';
--            tx_enable <= '0';

        when st3_saved_wait =>
--            saved_data <= '0';
--            data_accepted <= '1';         
--            tx_enable <= '0';

        when st4_transmit =>
--            tx_enable <= '1';
--            data_accepted <= '0';
--            saved_data <= '0';

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
--        if BTNU = '1' then
--           next_state <= st2_prep_data;
--        end if; 
        
    when st2_5_save_data  =>
--        next_state <= st3_saved_wait;
        
    when st2_prep_data => 
--        if BTNU = '0' then
--            next_state <= st2_5_save_data;
--        end if;
        
    when st3_saved_wait  =>
--        if BTNU = '1' then
--           next_state <= st2_prep_data;
--        elsif BTNC = '1' then
--           next_state <= st4_transmit;
--        end if; 
            
    when st4_transmit  =>
--        if tx_done = '1' then
--            next_state <= st1_wait;
--        end if;
    
    when others =>
--        next_state <= st1_wait;
    
    end case;      
end process;

------------------------------------
--Other??---------------------------
------------------------------------

end Behavioral;
