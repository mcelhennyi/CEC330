----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/01/2015 02:53:29 PM
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
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           BTNL : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC;
           BTNC : in STD_LOGIC;
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

signal ram_address : STD_LOGIC_VECTOR (3 downto 0);
signal data_to_ram : STD_LOGIC_VECTOR (7 downto 0);
signal write_enabled : STD_LOGIC;
signal read_endabled : STD_LOGIC;
signal data_from_ram : STD_LOGIC_VECTOR (7 downto 0);

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
--Divides the clock into a 1hz slow signal and a ~70hz signal for the display switching
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_SLOW : out STD_LOGIC;
           CLK_OUT_AN : out STD_LOGIC
--           RAND_OUT : out STD_LOGIC_VECTOR (7 downto 0) --not being used
           );
end component Divider;
--
component Memory
    Port ( CLK : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (3 downto 0);
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           wr : in STD_LOGIC;
           read : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0)
           );
end component Memory;

--component Memory_controller
--    Port ( BTNC : in STD_LOGIC;
--           BTNU : in STD_LOGIC;
--           BTND : in STD_LOGIC;
--           SW : in STD_LOGIC_VECTOR (7 downto 0);
--           CLK_SLOW : in STD_LOGIC;
--           address_out : out STD_LOGIC_VECTOR (3 downto 0);
--           data_out : out STD_LOGIC_VECTOR (7 downto 0)
--           );
--end component Memory_controller;

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
                CLK_OUT_an => clk_an
--                RAND_OUT => rand_num --not being used
                );
--
memory_map : Memory
    port map ( CLK => CLK_IN,
               address => ram_address,
               data_in => data_to_ram,
               wr => write_enabled,
               read => read_endabled,
               data_out => data_from_ram
               );
--
--memory_controller_map : Memory_controller
--    port map ( BTNC => BTNC,
--               BTNU => BTNU,
--               BTND => BTND,
--               SW => SW,
--               CLK_SLOW => clk_slow,
--               address_out => ram_address,
--               data_out => data_to_ram
--               );
--


end Behavioral;
