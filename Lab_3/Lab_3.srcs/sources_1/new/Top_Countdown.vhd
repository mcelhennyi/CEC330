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

signal REG_conection : STD_LOGIC_VECTOR (15 DOWNTO 0);
signal clk_slow : STD_LOGIC;
signal clk_an : STD_LOGIC;
signal countdown : STD_LOGIC := '0';
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

begin

disp7seg : Seven_seg_driver
     port map ( CLK_AN => clk_an,
                REG => REG,
                Display_out => SEG,
                AN => AN(3 downto 0)
                );
dividermap : Divider
     port map ( CLK_IN  => CLK_IN,
                CLK_OUT_slower => clk_slow,
                CLK_OUT_an => clk_an 
                );
switch : SW2REG
     port map ( REG => REG_conection,
                BTNR => 
                BTNU 
                BTNL 
                BTND 
                SW 
                FLAG 
                ); 
  
--turns off DISP2
AN(7) <= '1';
AN(6) <= '1';
AN(5) <= '1';
AN(4) <= '1';

--if 
--sw2reg: process(BTNL,BTNU,BTND,BTNR,countdown,SW)
--    begin
--        if ((BTNL and not(countdown)) = '1') then
--            REG(15 downto 12) <= SW;
--        ELSIF ((BTNU and not(countdown)) = '1') then
--            REG(11 downto 8) <= SW;
--        ELSIF ((BTND and not(countdown)) = '1') then
--            REG(7 downto 4) <= SW;
--        ELSIF ((BTNR and not(countdown)) = '1') then
--            REG(3 downto 0) <= SW;
--        end if;
--    end process sw2reg;  
--sw2regcase: process(countdown, SW, BTN)  
--begin  
--    if (countdown = '0') then 
--        case BTN is 
--            when "1000" => REG(15 downto 12) <= SW;
--            when "0100" => REG(11 downto 8) <= SW;
--            when "0010" => REG(7 downto 4) <= SW;
--            when "0001" => REG(3 downto 0) <= SW;
--            when others => report "unreachable" severity failure;
--         end case;
--    end if;
--end process sw2regcase;
----if BTNC is pressed the countdown is set to 1 allowing the reg to countdown
--counting: process(CLK_IN,BTNC)
--    begin
--        if (BTNC = '1') then
--            countdown <= '1';
--        end if;
--    end process counting;    
    
--subracts 1 from reg every slow clock cycle to count down after BTNC has been pressed    
subtracter: process(clk_slow,BTNC,BTN,SW,CLK_IN)
    begin
        if (BTNC = '1') then
                countdown <= '1';
        end if;
        
        if (countdown = '0') then 
                case BTN is 
                    when "1000" => REG(15 downto 12) <= SW;
                    when "0100" => REG(11 downto 8) <= SW;
                    when "0010" => REG(7 downto 4) <= SW;
                    when "0001" => REG(3 downto 0) <= SW;
                    when "0000" => REG(3 downto 0) <= x"0";
                    when others => report "unreachable" severity failure;
                 end case;
            end if;
        
        if (REG = x"0000") then
            countdown <= '0';
            LED3 <= '1';
        elsif (rising_edge(clk_slow) AND (countdown = '1')) then
            REG <= REG -1;
            LED3 <= '0';
        --AND (countdown = '1')
        end if;
    end process subtracter;
-- subtracter: process(clk_slow,BTNC)
--    begin
--        if (rising_edge(clk_slow) and (BTNC = '1')) then
--            REG <= REG -1;
--            LED3 <= '0';
--        --AND (countdown = '1')
--        end if;
--    end process subtracter;       
LED0 <= countdown;
        
end Behavioral;




--edit xdc
--port map SW2REG
--countdown module creation

