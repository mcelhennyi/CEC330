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
use ieee.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Logic is
    Port ( RAND_NUM : in STD_LOGIC_VECTOR (7 downto 0);
           test_count : in STD_LOGIC_VECTOR (2 downto 0);
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
           RESET : in STD_LOGIC;
           clk_slow : in STD_LOGIC
           );
end Logic;

architecture Behavioral of Logic is

    type AB_values is array (3 downto 0) of STD_LOGIC_VECTOR (4 downto 0); --
    signal A : AB_values := ("01100", "00001", "01110", "01111");
    signal B : AB_values := ("01100", "00101", "01110", "01111");
    
    type SC_values is array (3 downto 0) of STD_LOGIC_VECTOR (7 downto 0); --
    signal S : SC_values;
    signal C : SC_values;
        
    signal sum : STD_LOGIC_VECTOR (7 DOWNTO 0) := x"00"; --temp sum each iteration

begin

logic_sequence: process(FLAG_0, FLAG_15, RESET, clk_slow, test_count)--add btnc

variable review : integer := 0; --index of the review mode
variable index : integer := to_integer(signed(test_count)); --makes integer value of test count from sequencer
    
    begin
        if test_count < "100" then 
        ----------------
        --Testing mode--
        ----------------
            if FLAG_0 = '1' then
                --turn off correct answer display
                FLAG_an <= '0';
                --store A1 and B1 to RAM
    --                A(test_count_int) <= RAND_NUM(3 downto 0);
    --                B(test_count_int) <= RAND_NUM(7 downto 4);
    --                A(test_count_int) <= "1" + test_count;
    --                B(test_count_int) <= "0" + test_count;
                --store student answer to RAM
                S(index) <= SW;
                --display A
                Disp4 <= A(index)(3 downto 0);
                --display B
                Disp2 <= B(index)(3 downto 0);
                --display sw Student's Answer
                Disp7 <= SW(3 downto 0);
                Disp8 <= SW(7 downto 4);   
                --get  actual answer and store actual answer to RAM
                C(index) <= A(index) + B(index);        
            elsif FLAG_15 = '1' then
                --display A1
                Disp4 <= A(index)(3 downto 0);--keeps these displays on
                --display B1
                Disp2 <= B(index)(3 downto 0);
                --turn on answer display
                FLAG_an <= '1';
                --get  actual answer and store actual answer to RAM
--                C(index) <= A(index) + B(index);
--                sum <= C(index);
--                -- display answer
--                Disp6 <= sum(7 downto 4);
--                Disp5 <= sum(3 downto 0);
                Disp6 <= C(index)(7 downto 4);
                --Disp6 <= "0001";
                Disp5 <= C(index)(3 downto 0);
            end if;
        else 
        ----------------
        --listing mode--
        ----------------
            if (rising_edge(clk_slow)) then
                if BTNU = '1' then
                    if review < 3 then
                        review := review + 1;
                    end if;
                elsif BTND = '1' then
                    if review > 0 then
                        review := review - 1;
                    end if;
                end if;
            end if;
            --display A
            Disp4 <= A(review)(3 downto 0);
            --display B
            Disp2 <= B(review)(3 downto 0);
            --display correct and student answer
            FLAG_an <= '1';
            Disp5 <= C(review)(3 downto 0);
            Disp6 <= C(review)(7 downto 4);
            Disp7 <= S(review)(3 downto 0);
            Disp8 <= S(review)(7 downto 4); 
--            Disp7 <= "1111";
--            Disp8 <= "1111";
        end if;
end process logic_sequence;

end Behavioral;
