----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/24/2015 02:54:26 PM
-- Design Name: 
-- Module Name: Top - Behavioral
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

entity Top is
    Port ( CLK_IN : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (7 DOWNTO 0);
           SW15 : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           LED7 : out STD_LOGIC;
           LED8 : out STD_LOGIC;
           LED15 : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           SEG : out STD_LOGIC_VECTOR (7 DOWNTO 0)
           );
end Top;

architecture Behavioral of Top is

signal Disp1 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp2 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp3 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp4 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp5 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp6 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp7 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp8 : STD_LOGIC_VECTOR (3 downto 0);

signal clk_slow : STD_LOGIC := '0';--The one Hz clock
signal clk_an : STD_LOGIC;-- Clock that is around 70Hz going to the annodes and cathode counter
signal rand_num : STD_LOGIC_VECTOR (7 downto 0);

signal flag_0 : STD_LOGIC;
signal flag_15 : STD_LOGIC;
signal flag_17 : STD_LOGIC;
signal flag_an : STD_LOGIC;

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
           FLAG_an : in STD_LOGIC;
           Display_out : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           AN_out : out STD_LOGIC_VECTOR (7 DOWNTO 0)
           );
end component Seven_seg_driver;
--Divides the clock into a 1hz slow signal and a ~70hz signal for the display switching
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_SLOW : out STD_LOGIC;
           CLK_OUT_AN : out STD_LOGIC;
           RAND_OUT : out STD_LOGIC_VECTOR (7 downto 0)
           );
end component Divider;
--
component Logic
    Port ( RAND_NUM : in STD_LOGIC_VECTOR (7 downto 0);
           FLAG_0 : in STD_LOGIC;
           FLAG_15 : in STD_LOGIC;
           FLAG_17 : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           FLAG_an : out STD_LOGIC;
           Disp1 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp2 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp3 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp4 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp5 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp6 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp7 : out STD_LOGIC_VECTOR (3 downto 0);
           Disp8 : out STD_LOGIC_VECTOR (3 downto 0);
           BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC;
           RESET : in STD_LOGIC
           );
end component Logic;
--
component sequencer
    Port ( reset : in STD_LOGIC;
           clk_slow : in STD_LOGIC;
           sw_15 : in STD_LOGIC;
           flag_0 : out STD_LOGIC;
           flag_15 : out STD_LOGIC;
           flag_17 : out STD_LOGIC;
           led15 : out STD_LOGIC
           );
end component sequencer;

begin
--maps the driver 
Seven_seg_map : Seven_seg_driver
     port map ( CLK_AN => clk_an,
                Disp1 => Disp1,
                Disp2 => Disp2,
                Disp3 => Disp3,
                Disp4 => Disp4,
                Disp5 => Disp5,
                Disp6 => Disp6,
                Disp7 => Disp7,
                Disp8 => Disp8,
                FLAG_an => flag_an,
                Display_out => SEG,
                AN_out => AN
                );
                
-- maps the divider to the annode/cathode clock and the slow 1hz clock and 8 bit random number      
divider_map : Divider
     port map ( CLK_IN  => CLK_IN,
                CLK_OUT_slow => clk_slow,
                CLK_OUT_an => clk_an,
                RAND_OUT => rand_num
                );
                
logic_map : Logic 
    port map ( RAND_NUM => rand_num,
               FLAG_0 => flag_0,
               FLAG_15 => flag_15,
               FLAG_17 => flag_17,
               SW => SW,
               FLAG_an => flag_an,
               Disp1 => Disp1,
               Disp2 => Disp2,
               Disp3 => Disp3,
               Disp4 => Disp4,
               Disp5 => Disp5,
               Disp6 => Disp6,
               Disp7 => Disp7,
               Disp8 => Disp8,
               BTNU => BTNU,
               BTND => BTND,
               RESET => BTNC
               );
               
sequencer_map : sequencer           
    port map ( reset => BTNU,
               clk_slow => CLK_SLOW,
               sw_15 => SW15,
               flag_0 => flag_0,
               flag_15 => flag_15,
               flag_17 => flag_17,
               led15 => LED15
               );


end Behavioral;
