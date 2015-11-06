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
           SEG : out STD_LOGIC_VECTOR (7 downto 0);
           AN : out STD_LOGIC_VECTOR (7 downto 0);
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           LED : out STD_LOGIC_VECTOR (15 downto 0);
           MOSI : out STD_LOGIC;--Serial Pin JA-1
           MISO : in STD_LOGIC;--Serial Pin Ja-2
           SCLK : out STD_LOGIC--Serial Pin JA-3
           );
end Top_serial;

  architecture Behavioral of Top_serial is
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

signal clk_1Hz : STD_LOGIC := '0'; --The one Hz clock
signal clk_16Hz : STD_LOGIC := '0'; --16Hz clock
signal clk_50Hz : STD_LOGIC := '0'; --50Hz clock
signal clk_100KHz : STD_LOGIC := '0'; --100KHz clock
signal clk_an : STD_LOGIC; --Clock that is around 70Hz going to the annodes and cathode counter
signal clk_state : STD_LOGIC; --Clock to change State Machine
signal pwm_clk : STD_LOGIC; --Clock that goes to PWM module

signal tx_done : STD_LOGIC;
signal tx_enable : STD_LOGIC := '0';
signal tx_data : STD_LOGIC_VECTOR(7 downto 0);
signal received_data_for_displays : STD_LOGIC_VECTOR(7 downto 0) := x"00";
signal disconect : STD_LOGIC_VECTOR(7 downto 0);
signal rx_data : STD_LOGIC_VECTOR(7 downto 0) := x"00";
signal data_to_leds : STD_LOGIC_VECTOR(7 downto 0) := x"00";
signal led_mux : STD_LOGIC;
signal saved_data : STD_LOGIC := '0';
signal data_accepted : STD_LOGIC := '0';


--States for the FSM
type FSM_state_type is (st1_wait, st2_save_data, st3_saved_wait, st4_transmit); 
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
--           FLAG_an : in STD_LOGIC;
           Display_out : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           AN_out : out STD_LOGIC_VECTOR (7 DOWNTO 0)
           );
end component Seven_seg_driver;
--exports data on the SPI bus
component SPI
    Port ( SPI_CLK_IN : in STD_LOGIC;
           SPI_CLK_OUT : out STD_LOGIC;
           DATA_OUT : out STD_LOGIC_VECTOR (7 downto 0);
           DATA_IN : in STD_LOGIC_VECTOR (7 downto 0);
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
--               FLAG_an => flag_an,
               Display_out => SEG,
               AN_out => AN
               ); 
--maps the spi bus
SPI_map: SPI 
    port map ( SPI_CLK_IN => clk_100KHz,
               SPI_CLK_OUT => SCLK,--Serial Pin OUT
               DATA_OUT => tx_data,
               --DATA_OUT => disconect,
               DATA_IN => rx_data,
               SAVED_DATA => saved_data,
               MOSI => MOSI,--Serial Pin OUT
               MISO => MISO,--Serial Pin IN
               TX_ENABLE => tx_enable,
               TX_DONE => tx_done
               );
               
------------------------------------
--Turning off unused LEDs-----------
------------------------------------          
LED (13 downto 8) <= "000000";    

tx_data <= x"00";
     
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
            tx_enable <= '0';

        when st2_save_data =>
            saved_data <= '1';
            data_accepted <= '1';

        when st3_saved_wait =>
            saved_data <= '0';

        when st4_transmit =>
            tx_enable <= '1';
            data_accepted <= '0';

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
        if BTNU = '1' then
           next_state <= st2_save_data;
        end if; 
        
    when st2_save_data  =>
        next_state <= st3_saved_wait;
        
    when st3_saved_wait  =>
        if BTNU = '1' then
           next_state <= st2_save_data;
        elsif BTNC = '1' then
           next_state <= st4_transmit;
        end if; 
            
    when st4_transmit  =>
        if tx_done = '1' then
            next_state <= st1_wait;
        end if;
    
    when others =>
        next_state <= st1_wait;
    
    end case;      
end process;

------------------------------------
--state functions-------------------
------------------------------------
state_functions: process(saved_data,tx_enable,tx_done,data_accepted)
    begin
        
        if saved_data = '1' then--data saved from switches
            rx_data <= SW; 
            led_mux <= '0';
        end if;
        
        if data_accepted = '1' then--data sent to spi
            LED(15) <= '1';
            LED(14) <= '0';
        elsif data_accepted = '0' then--transmistion started
            LED(15) <= '0';
        end if;
        
        --only updates the data from spi when transmission is done for displays 7 and 8
        if tx_done = '1' then
            received_data_for_displays <= tx_data;
            led_mux <= '1';
            LED(14) <= '1'; 
        end if;
        --chooses what value will be on the LEDs
        if led_mux = '0' then
            data_to_leds <= rx_data;--saved data from swithces
        elsif led_mux = '1' then
            data_to_leds <= tx_data;--data from slave
        end if;
        
end process state_functions;

--display 1 and 2 will always show the value of rx_data(the value taken from the swithes when BTNU is pressed)
Disp1 <= rx_data(3 downto 0);
Disp2 <= rx_data(7 downto 4);
--These LEDs will show the same data as displays 1 and 2
LED(7 downto 0) <= data_to_leds;
--display 7 and 8 show the value from the slave
Disp7 <= received_data_for_displays(3 downto 0);
Disp8 <= received_data_for_displays(7 downto 4);


end Behavioral;
