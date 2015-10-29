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
           SEG : out STD_LOGIC;
           AN : out STD_LOGIC;
           SW : in STD_LOGIC;
           LED : in STD_LOGIC);
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
signal clk_50Hz : STD_LOGIC := '0'; --16Hz clock
signal clk_an : STD_LOGIC; --Clock that is around 70Hz going to the annodes and cathode counter
signal clk_state : STD_LOGIC; --Clock to change State Machine
signal pwm_clk : STD_LOGIC; --Clock that goes to PWM module

signal button_center : STD_LOGIC;

-----------------------------------
--COMPONETS------------------------
-----------------------------------
--Divides the clock into a 1hz slow signal and a ~70hz signal for the display switching
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_1Hz : out STD_LOGIC;
           CLK_OUT_16Hz : out STD_LOGIC;
           CLK_OUT_50Hz :  out STD_LOGIC;
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

begin
------------------------------------
--PORT MAPS-------------------------
------------------------------------
-- maps the divider to the annode/cathode clock and the slow 1hz clock and 8 bit random number      
divider_map: Divider
    port map ( CLK_IN  => CLK_IN,
               CLK_OUT_1Hz => clk_slow,
               CLK_OUT_16Hz => clk_16Hz,
               CLK_OUT_50Hz => clk_50Hz,
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



end Behavioral;
