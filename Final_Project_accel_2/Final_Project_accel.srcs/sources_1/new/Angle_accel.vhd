----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 11/23/2015 12:22:38 PM
-- Design Name: 
-- Module Name: Angle_accel - Behavioral
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
use IEEE.math_real.all;
use IEEE.std_logic_arith.all;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Angle_accel is
    Port ( CLK_IN : in STD_LOGIC;
           X_IN : in STD_LOGIC_VECTOR (11 downto 0);
           Y_IN : in STD_LOGIC_VECTOR (11 downto 0);
           Z_IN : in STD_LOGIC_VECTOR (11 downto 0);
           TEMP_IN : in STD_LOGIC_VECTOR (11 downto 0);
           X_ANGLE : out STD_LOGIC;--idk how big these will be yet
           Y_ANGLE : out STD_LOGIC;
           Z_ANGLE : out STD_LOGIC;
           TEMP_AVG : out STD_LOGIC_VECTOR (11 downto 0)
           );
end Angle_accel;

architecture Behavioral of Angle_accel is

signal counter : STD_LOGIC_VECTOR (6 downto 0);

signal x_average : STD_LOGIC_VECTOR (11 downto 0);
signal y_average : STD_LOGIC_VECTOR (11 downto 0);
signal z_average : STD_LOGIC_VECTOR (11 downto 0);
signal temp_average : STD_LOGIC_VECTOR (11 downto 0);

signal gravity : STD_LOGIC_VECTOR (11 downto 0) := x"00A";

begin

counter_process: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
        --will reset itself after it gets to 127
            counter <= counter + '1';
        end if;
        
end process counter_process;       

average: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
        
            if (counter > "0000001") then    
                x_average <= (x_average + X_IN) / 2;
                
                y_average <= (y_average + Y_IN) / 2;
                
                z_average <= (z_average + Z_IN) / 2;
                
                temp_average <= (temp_average + TEMP_IN) / 2;
                
--            elsif (counter = "000000") then---------------Dont think i need this
--                x_average <= x"000";
                                       
--                y_average <= x"000";
                
--                z_average <= x"000";
                
            else 
                x_average <= X_IN;
                            
                y_average <= Y_IN;
                
                z_average <= Z_IN;
                
                temp_average <= TEMP_IN;
            end if;
            
        end if;

end process average;

get_angle: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            if (counter = "1111111") then    
                X_ANGLE <= ASIN(x_average/gravity);
                Y_ANGLE <= ASIN(y_average/gravity);
                Z_ANGLE <= ASIN(z_average/gravity);
            end if;
        end if;
end process get_angle; 









end Behavioral;
