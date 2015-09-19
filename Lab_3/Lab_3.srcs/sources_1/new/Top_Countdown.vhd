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
          -- BTN : in STD_LOGIC_VECTOR (3 downto 0);
           BTNL : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           LED3 : out STD_LOGIC;
           LED0 : out STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           SEG : out STD_LOGIC_VECTOR (7 DOWNTO 0)
           );
end Top_Countdown;

architecture Behavioral of Top_Countdown is

signal reg_to_countdown : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal reg_to_decoder : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal clk_slow : STD_LOGIC := '0';
signal clk_an : STD_LOGIC;
signal FLAG: STD_LOGIC := '0';
--
component Seven_seg_driver
    Port ( CLK_AN : in STD_LOGIC;
           REG : in STD_LOGIC_VECTOR (15 DOWNTO 0);
           Display_out : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           AN : out STD_LOGIC_VECTOR (3 DOWNTO 0)
           );
end component Seven_seg_driver;
--
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_slower : out STD_LOGIC;
           CLK_OUT_an : out STD_LOGIC
           );
end component Divider;

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

component countdown
    Port ( 
            BTNC : in STD_LOGIC; 
            registerIn : in STD_LOGIC_VECTOR (15 downto 0);
            FLAG : out STD_LOGIC;
            registerOut : out STD_LOGIC_VECTOR (15 downto 0);
            clk_slow: in STD_LOGIC;
            LED3: out STD_LOGIC
            );  
end component countdown;      

begin

disp7seg : Seven_seg_driver
     port map ( CLK_AN => clk_an,
                REG => reg_to_decoder,
                Display_out => SEG,
                AN => AN(3 downto 0)
                );
                
dividermap : Divider
     port map ( CLK_IN  => CLK_IN,
                CLK_OUT_slower => clk_slow,
                CLK_OUT_an => clk_an 
                );
                
switch : SW2REG
     port map ( REG => reg_to_countdown,
                BTNR => BTNR,
                BTNU => BTNU,
                BTNL => BTNL,
                BTND => BTND,
                SW => SW,
                FLAG => FLAG
                ); 
                
 countedownregister: countdown
     port map ( BTNC =>  BTNC,
                registerIn => reg_to_countdown,
                FLAG => FLAG,
                registerOut => reg_to_decoder,
                clk_slow => clk_slow,
                LED3 => LED3
               );
  
  
--turns off DISP2
AN(7) <= '1';
AN(6) <= '1';
AN(5) <= '1';
AN(4) <= '1';

end Behavioral;




--edit xdc

