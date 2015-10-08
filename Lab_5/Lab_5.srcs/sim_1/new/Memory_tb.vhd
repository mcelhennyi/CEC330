----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/08/2015 05:42:48 PM
-- Design Name: 
-- Module Name: Memory_tb - Behavioral
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

entity Memory_tb is
end Memory_tb;

architecture Behavioral of Memory_tb is

component Memory
    Port ( CLK : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (3 downto 0);
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           we : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0)
           );
    end component;
    --Inputs
    signal CLK : std_logic := '1';
    signal address :  STD_LOGIC_VECTOR (3 downto 0):= x"0";
    signal data_in :  STD_LOGIC_VECTOR (7 downto 0):= x"00";
    signal we :  STD_LOGIC:= '0';
    --Outputs
    signal data_out : STD_LOGIC_VECTOR (7 downto 0):= x"00";
    --Clock Period
    constant CLK_period : time := 10 ns;

begin

--UUT instantiation
uut: Memory
    Port MAP (
               CLK => CLK,
               address => address,
               data_in => data_in,
               we => we,
               data_out => data_out
               );
               
--clock process clock of 100 MHz
CLK_IN_PROCESS: process
begin
    CLK <= '0';
    wait for CLK_period/2;
    CLK <= '1';
    wait for CLK_period/2;
end process CLK_IN_PROCESS;

--stimulus to write to memory
stim_proc: process
begin
--at address 0 write FF
    address <= x"0";
    data_in <= x"FF";
    wait for 20 ns;
    we <= '1';
    wait for 10 ns;
    we <= '0';
    wait for 20 ns;
--at address 5 right 32
    address <= x"5";
    data_in <= x"32";
    wait for 20 ns;
    we <= '1';
    wait for 10 ns;
    we <= '0';
--end on pause
    wait;
    
end process stim_proc;

end Behavioral;
