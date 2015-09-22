----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/17/2015 02:15:48 PM
-- Design Name: 
-- Module Name: Top_Countdown - Behavioral
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top_Countdown is
    Port ( CLK_IN : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (3 DOWNTO 0);
           BTNL : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           LED3 : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           SEG : out STD_LOGIC_VECTOR (7 DOWNTO 0)
           );
end Top_Countdown;

architecture Behavioral of Top_Countdown is

signal reg_switches : STD_LOGIC_VECTOR (15 DOWNTO 0);--The signal that connects the SW2REG register to the countdown module and the mux for display
signal reg_countdown : STD_LOGIC_VECTOR (15 DOWNTO 0);--Register that has the countdown value and connects to mux to go to display
signal reg_to_decoder : STD_LOGIC_VECTOR (15 DOWNTO 0);--The register that connects the mux output of the register to the decoder
signal clk_slow : STD_LOGIC := '0';--The one Hz clock
signal clk_an : STD_LOGIC;-- Clock that is around 70Hz going to the annodes and cathode counter
signal FLAG: STD_LOGIC := '0';--Enables/disables the switches from changing the register value, chooses to display either the current switch state that has been saved to the register or the countdown value

--Drives the seven segment displays
component Seven_seg_driver
    Port ( CLK_AN : in STD_LOGIC;
           REG : in STD_LOGIC_VECTOR (15 DOWNTO 0);
           Display_out : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           AN : out STD_LOGIC_VECTOR (3 DOWNTO 0)
           );
end component Seven_seg_driver;

--Divides the clock into a 1hz slow signal and a ~70hz signal for the display switching
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_slower : out STD_LOGIC;
           CLK_OUT_an : out STD_LOGIC
           );
end component Divider;

--Takes the value of the switch and saves it to a portion of the register based on a button press
component SW2REG 
    Port ( REG : out STD_LOGIC_VECTOR (15 downto 0);
           BTNR : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTNL : in STD_LOGIC;
           BTND : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (3 downto 0);
           FLAG : in STD_LOGIC
           );
end component SW2REG;

--counts the register value down -1 every second
component countdown
    Port (  CLK_IN : in STD_LOGIC;
            BTNC : in STD_LOGIC; 
            registerIn : in STD_LOGIC_VECTOR (15 downto 0);
            FLAG : out STD_LOGIC;
            registerOut : out STD_LOGIC_VECTOR (15 downto 0);
            clk_slow: in STD_LOGIC;
            LED3: out STD_LOGIC
            );  
end component countdown;    

--A mux that either displays the countdown value or the freshly saved value of the register before countdown
component Output_selector
    Port ( switch_in : in STD_LOGIC_VECTOR (15 downto 0);
           count_in : in STD_LOGIC_VECTOR (15 downto 0);
           FLAG : in STD_LOGIC;
           reg_to_driver : out STD_LOGIC_VECTOR (15 downto 0)
           );
end component Output_selector;  

begin
--maps the driver to the output of the mux
disp7seg : Seven_seg_driver
     port map ( CLK_AN => clk_an,
                REG => reg_to_decoder,
                Display_out => SEG,
                AN => AN(3 downto 0)
                );
                
-- maps the divider to the annode/cathode clock and the slow 1hz clock       
dividermap : Divider
     port map ( CLK_IN  => CLK_IN,
                CLK_OUT_slower => clk_slow,
                CLK_OUT_an => clk_an 
                );

--maps the switches to parts of the register based on buttons being pressed                
switch : SW2REG
     port map ( REG => reg_switches,
                BTNR => BTNR,
                BTNU => BTNU,
                BTNL => BTNL,
                BTND => BTND,
                SW => SW,
                FLAG => FLAG
                ); 
                
--maps the output of the above module to the countdown function         
countedownregister : countdown
     port map ( CLK_IN => CLK_IN,
                BTNC =>  BTNC,
                registerIn => reg_switches,
                FLAG => FLAG,
                registerOut => reg_countdown,
                clk_slow => clk_slow,
                LED3 => LED3
                );

--maps the sw2reg output to the display or connects the count down value to the display               
outputToDriver : Output_selector
     port map ( switch_in => reg_switches,
                count_in => reg_countdown,
                FLAG => FLAG,
                reg_to_driver => reg_to_decoder
                );
 
  
  
--turns off DISP2
AN(7) <= '1';
AN(6) <= '1';
AN(5) <= '1';
AN(4) <= '1';

end Behavioral;
