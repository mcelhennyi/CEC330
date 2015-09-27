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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

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
           LED7 : out STD_LOGIC;
           LED8 : out STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC;
           RESET : in STD_LOGIC
           );
end Logic;

architecture Behavioral of Logic is

    signal test_count : STD_LOGIC_VECTOR (2 downto 0) := "000";

    type AB_values is array (3 downto 0) of STD_LOGIC_VECTOR (3 downto 0); --creates the width of a single part
--    type AB_array is array (3 downto 0) of AB_values; --puts all the parts in a vector of 4 values
    signal A : AB_values;
    signal B : AB_values;
    
    type SC_values is array (3 downto 0) of STD_LOGIC_VECTOR (7 downto 0); --creates the width of a single part

--    type SC_values is array (7 downto 0) of STD_LOGIC_VECTOR;
--    type SC_array is array(3 downto 0) of SC_values; 
    signal S : SC_values;
    signal C : SC_values;
        
    signal sum : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00"; --temp sum each iteration

begin

logic_sequence: process(FLAG_0, FLAG_15, FLAG_17,RESET)--add btnc
    variable test_count_int : integer := 0; --index of iteration
--    variable A : AB_array;
--    variable B : AB_array;
--    variable S : SC_array;
--    variable C : SC_array;

    begin
    --add if statment to clear test_count if btnc is pressed
        if test_count < "100" then
            LED7 <= '0';
            LED8 <= '0';
            if FLAG_0 = '1' then
                --start process
                --turn off correct answer display
                FLAG_an <= '0';
                --store A1 and B1 to RAM
                --A(test_count) <= RAND_NUM(3 downto 0);
                --B(test_count) <= RAND_NUM(7 downto 4);
                A(test_count_int) <= "1000";
                B(test_count_int) <= "0001";
                --store student answer to RAM
                S(test_count_int) <= SW;
                --display A1
                Disp4 <= A(test_count_int);
                --display B1
                Disp2 <= B(test_count_int);
                --display sw Student's Answer
                Disp7 <= SW(3 downto 0);
                Disp8 <= SW(7 downto 4);           
            elsif FLAG_15 = '1' then
                --display A1
                Disp4 <= A(test_count_int);--keeps these displays on
                --display B1
                Disp2 <= B(test_count_int);
                
                --start 15 sec process
                --turn on answer display
                FLAG_an <= '1';
                --get  actual answer and store actual answer to RAM
                C(test_count_int) <= A(test_count_int) + B(test_count_int);
                sum <= C(test_count_int);
                -- display answer
                Disp6 <= sum(7 downto 4);
                Disp5 <= sum(3 downto 0);
            elsif FLAG_17 = '1' then--it seems not to be running this at all now?
                --start 17 sec process
                test_count_int := test_count_int + 1;
                test_count <= test_count + 1;
                LED7 <= '1';--debug statement delete at implementation
                
            end if;
        elsif test_count = "100" then
            --flash led7 and 8
            LED7 <= '1';
            LED8 <= '1';
--            if RESET = '1' then
--                --set test_count to zero (which should start over the process)
--                test_count_int := 0;
--                test_count <= "000";
--            end if;
        end if;
        
        if RESET = '1' then
            --set test_count to zero (which should start over the process)
            test_count_int := 0;
            test_count <= "000";
        end if;
        
    end process logic_sequence;

end Behavioral;
