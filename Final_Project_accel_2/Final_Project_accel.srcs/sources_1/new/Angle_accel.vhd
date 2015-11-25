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
           LED : in STD_LOGIC_VECTOR (15 downto 0);
           X_IN : in STD_LOGIC_VECTOR (11 downto 0);
           Y_IN : in STD_LOGIC_VECTOR (11 downto 0);
           Z_IN : in STD_LOGIC_VECTOR (11 downto 0);
           TEMP_IN : in STD_LOGIC_VECTOR (11 downto 0);
           --
--           X_ANGLE : out STD_LOGIC_VECTOR (11 downto 0);
--           Y_ANGLE : out STD_LOGIC_VECTOR (11 downto 0);
--           Z_ANGLE : out STD_LOGIC_VECTOR (11 downto 0);
           TEMP_AVG : out STD_LOGIC_VECTOR (11 downto 0)
           );
end Angle_accel;

architecture Behavioral of Angle_accel is

signal counter : STD_LOGIC_VECTOR (6 downto 0) := "0000000";

signal x_average : STD_LOGIC_VECTOR (11 downto 0);
signal y_average : STD_LOGIC_VECTOR (11 downto 0);
signal z_average : STD_LOGIC_VECTOR (11 downto 0);
signal temp_average : STD_LOGIC_VECTOR (11 downto 0);

signal x_negative : STD_LOGIC := '0';
signal y_negative : STD_LOGIC := '0';
signal z_negative : STD_LOGIC := '0';
signal temp_negative : STD_LOGIC := '0';

signal gravity : STD_LOGIC_VECTOR (11 downto 0) := x"00A";

signal x_angle : STD_LOGIC_VECTOR (11 downto 0) := x"000";--------------may need to change these
signal y_angle : STD_LOGIC_VECTOR (11 downto 0) := x"000";
signal z_angle : STD_LOGIC_VECTOR (11 downto 0) := x"000";

begin

counter_process: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            --counter for takings samples
            --will reset itself after it gets to 127
            counter <= counter + '1';
        end if;
    end process counter_process;       

average: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            --calculates the angle after about 125 samples
            if (counter = "1111111") then    
                x_angle <= ASIN(x_average/gravity);----------------may need to do somthing different here
                y_angle <= ASIN(y_average/gravity);
                z_angle <= ASIN(z_average/gravity);
                
            --averages the samples
            elsif (counter > "0000001") then  
                --x  
                if ((X_IN and "100000000000") = x"000") then
                    x_average <= (x_average + X_IN) / 2;
                    x_negative <= '0';
                else
                    x_average <= (x_average + ((not X_IN)+ '1')) / 2;--X_IN <= ((not X_IN)+ '1');--two's complement
                    x_negative <= '1';
                end if;
                --y
                if ((Y_IN and "100000000000") = x"000") then
                    y_average <= (y_average + Y_IN) / 2;
                    y_negative <= '0';
                else
                    y_average <= (t_average + ((not Y_IN)+ '1')) / 2;--X_IN <= ((not X_IN)+ '1');--two's complement
                    y_negative <= '1';
                end if;
                --z
                if ((Z_IN and "100000000000") = x"000") then
                    z_average <= (z_average + Z_IN) / 2;
                    z_negative <= '0';
                else
                    z_average <= (z_average + ((not Z_IN)+ '1')) / 2;--X_IN <= ((not X_IN)+ '1');--two's complement
                    z_negative <= '1';
                end if;
                --temp
                if ((TEMP_IN and "100000000000") = x"000") then
                    temp_average <= (temp_average + TEMP_IN) / 2;
                    temp_negative <= '0';
                else
                    temp_average <= (temp_average + ((not TEMP_IN)+ '1')) / 2;--X_IN <= ((not X_IN)+ '1');--two's complement
                    temp_negative <= '1';
                end if;
                
            --sets the intial value for the average for every angle
            else 
                x_average <= X_IN;
                y_average <= Y_IN;
                z_average <= Z_IN;
                temp_average <= TEMP_IN;
            end if;
        end if;
    end process average;

LEDs: process(CLK_IN)
    begin
        if (rising_edge(CLK_IN)) then
            if (y_negative = '0') then
                --if ((y_angle >= 0) and (y_angle < 11.25)) then 
                
--                -- 0     =< y < 11.25
--                    LED <= "0000000110000000";

--                -- 11.25 =< y < 22.5
--                    LED <= "0000001100000000";

--                -- 22.5  =< y < 33.75
--                    LED <= "0000011000000000";

--                -- 33.75 =< y < 45
--                    LED <= "0000110000000000";

--                -- 45    =< y < 56.25
--                    LED <= "0001100000000000";

--                -- 56.25 =< y < 67.5
--                    LED <= "0011000000000000";

--                -- 67.5  =< y < 78.75
--                    LED <= "0110000000000000";

--                -- 78.75 =< y < 90
--                    LED <= "1100000000000000";
                
                
                --end if;
            
            elsif (y_negative = '1') then
--                -- 0     =< y < 11.25
--                    LED <= "0000000110000000";

--                -- 11.25 =< y < 22.5
--                    LED <= "0000000011000000";

--                -- 22.5  =< y < 33.75
--                    LED <= "0000000001100000";

--                -- 33.75 =< y < 45
--                    LED <= "0000000000110000";

--                -- 45    =< y < 56.25
--                    LED <= "0000000000011000";

--                -- 56.25 =< y < 67.5
--                    LED <= "0000000000001100";

--                -- 67.5  =< y < 78.75
--                    LED <= "0000000000000110";

--                -- 78.75 =< y < 90
--                    LED <= "0000000000000011";
            
            end if;  
        end if;
    end process LEDs;
end Behavioral;
