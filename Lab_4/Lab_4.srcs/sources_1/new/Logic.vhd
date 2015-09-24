----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/24/2015 06:36:40 PM
-- Design Name: 
-- Module Name: Logic - Behavioral
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

entity Logic is
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
           BTND : in STD_LOGIC
           );
end Logic;

architecture Behavioral of Logic is

   -- signal test_count : STD_LOGIC_VECTOR (2 downto 0) := "000";

    type AB_array is array(3 downto 0, 3 downto 0) of STD_LOGIC; 
    signal A : AB_array;
    signal B : AB_array;
    
    type SC_array is array(3 downto 0, 7 downto 0) of STD_LOGIC; 
    signal S : SC_array;
    signal C : SC_array;
    
begin

logic_sequence: process(FLAG_0, FLAG_15, FLAG_17 )--add btnc
    begin
    --add if statment to clear test_count if btnc is pressed
        if test_count /= "100" then
            if FLAG_0 = '1' then
                --start process
                --store A1 and B1 to RAM
                A(test_count) <= RAND_NUM(3 downto 0);--test count will need to be an integer
                B(test_count) <= RAND_NUM(7 downto 4);
                --
                --display A1
                --display B1
                --display sw
                --send flag_an = 0
                --
            elsif FLAG_15 = '1' then
                --start 15 sec process
                -- flag_an = 1, 
                --get answer
                -- display answer
            elsif FLAG_17 = '1' then
                --start 17 sec process
                test_count <= test_count + 1;
            
            end if;
        elsif test_count = "100" then
            --flash led7 and 8
        end if;
    end process logic_sequence;

end Behavioral;
