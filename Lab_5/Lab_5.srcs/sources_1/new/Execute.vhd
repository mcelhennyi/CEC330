----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/01/2015 06:52:30 PM
-- Design Name: 
-- Module Name: Execute - Behavioral
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

entity Execute is
    Port ( reg_a : in STD_LOGIC_VECTOR (7 downto 0);
           reg_b : in STD_LOGIC_VECTOR (7 downto 0);
           instr : in STD_LOGIC_VECTOR (3 downto 0);
           ee : in STD_LOGIC;
           out_value : out STD_LOGIC_VECTOR (7 downto 0);
           store_a : out STD_LOGIC
           );
end Execute;

architecture Behavioral of Execute is

begin

logic_switch: process(instr, reg_a, reg_b, ee)
begin
if ee = '1' then
    case instr is
        when "0100"=> 
            out_value <= reg_a and reg_b;
            store_a <= '1';
        when "0101" => 
            out_value <= not(reg_a and reg_b);
            store_a <= '1';
        when "0110" => 
            out_value <= reg_a and reg_b;
            store_a <= '0';
        when "0111"=> 
            out_value <= not(reg_a and reg_b);
            store_a <= '0';
        when "1000" => 
            out_value <= reg_a or reg_b;
            store_a <= '1';
        when "1001" => 
            out_value <= not(reg_a or reg_b);
            store_a <= '1';
        when "1010"=> 
            out_value <= reg_a or reg_b;
            store_a <= '0';
        when "1011" => 
            out_value <= not(reg_a or reg_b);
            store_a <= '0';
        when "1100" => 
            out_value <= reg_a xor reg_b;
            store_a <= '1';
        when "1101"=> 
            out_value <= not(reg_a xor reg_b);
            store_a <= '1';
        when "1110" => 
            out_value <= reg_a xor reg_b;
            store_a <= '0';
        when "1111" => 
            out_value <= not(reg_a xor reg_b);
            store_a <= '0';
        when others => 
            out_value <= "00000000";
            store_a <= '1';
    end case;
end if;
    
end process logic_switch;



end Behavioral;
