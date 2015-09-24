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
           AN : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           SEG : out STD_LOGIC_VECTOR (7 DOWNTO 0)
           );
end Top;

architecture Behavioral of Top is

signal reg : STD_LOGIC_VECTOR (31 DOWNTO 0);--The register that connects the mux output of the register to the decoder
signal clk_slow : STD_LOGIC := '0';--The one Hz clock
signal clk_an : STD_LOGIC;-- Clock that is around 70Hz going to the annodes and cathode counter

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
           Display_out : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           AN : out STD_LOGIC_VECTOR (3 DOWNTO 0)
           );
end component Seven_seg_driver;

--Divides the clock into a 1hz slow signal and a ~70hz signal for the display switching
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_SLOW : out STD_LOGIC;
           CLK_OUT_AN : out STD_LOGIC
           );
end component Divider;

begin
--maps the driver 
disp7seg : Seven_seg_driver
     port map ( CLK_AN => clk_an,
                Disp1 => reg(3 downto 0),
                Disp2 => reg(7 downto 4),
                Disp3 => reg(11 downto 8),
                Disp4 => reg(15 downto 12),
                Disp5 => reg(19 downto 16),
                Disp6 => reg(23 downto 20),
                Disp7 => reg(27 downto 24),
                Disp8 => reg(31 downto 28),
                Display_out => SEG,
                AN => AN(3 downto 0)
                );
                
-- maps the divider to the annode/cathode clock and the slow 1hz clock       
dividermap : Divider
     port map ( CLK_IN  => CLK_IN,
                CLK_OUT_slower => clk_slow,
                CLK_OUT_an => clk_an 
                );


end Behavioral;
