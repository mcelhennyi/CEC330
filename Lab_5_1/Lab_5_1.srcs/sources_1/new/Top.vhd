----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10/01/2015 02:53:29 PM
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
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
    Port ( CLK_IN : in STD_LOGIC;
           SW : in STD_LOGIC_VECTOR (7 downto 0);
           BTNL : in STD_LOGIC;
           BTNR : in STD_LOGIC;
           BTNU : in STD_LOGIC;
           BTND : in STD_LOGIC;
           BTNC : in STD_LOGIC;
           AN : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           SEG : out STD_LOGIC_VECTOR (7 DOWNTO 0)
           );
end Top;

architecture Behavioral of Top is

--display signals for the seven segment displays
signal Disp1 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp2 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp3 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp4 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp5 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp6 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp7 : STD_LOGIC_VECTOR (3 downto 0);
signal Disp8 : STD_LOGIC_VECTOR (3 downto 0);
--Clock signals from the divider
signal clk_slow : STD_LOGIC := '0';--The one Hz clock
signal clk_an : STD_LOGIC;-- Clock that is around 70Hz going to the annodes and cathode counter
signal clk_state : STD_LOGIC;
--data to and from Memory
signal mem_addr : STD_LOGIC_VECTOR (3 downto 0);
signal data_to_ram : STD_LOGIC_VECTOR (7 downto 0);
signal mem_wren  : STD_LOGIC;
signal data_from_ram : STD_LOGIC_VECTOR (7 downto 0);
--Signals to control movement through the Memory
signal go_up : STD_LOGIC;
signal go_down : STD_LOGIC;
--States for the FSM
type FSM_state_type is (st1_wait, st2_go_up, st3_go_down, st4_write, st5_read_instr, 
st6_read_op_A_B, st6_5_change_mem, st7_store_reg_A,st7_5_change_mem, st8_store_reg_B, 
st9_execute, st9_5_set_result_address, st10_write_result); 
signal state, next_state : FSM_state_type;
--signals to and from the Execute module
signal EE : STD_LOGIC;--Enable bit for the execute module
signal INSTR : STD_LOGIC_VECTOR (3 downto 0);
signal OP_A : STD_LOGIC_VECTOR (3 downto 0);
signal OP_B : STD_LOGIC_VECTOR (3 downto 0);
signal REG_A : STD_LOGIC_VECTOR (7 downto 0);
signal REG_B : STD_LOGIC_VECTOR (7 downto 0);
signal OUT_VALUE : STD_LOGIC_VECTOR (7 downto 0);
signal store_location : STD_LOGIC_VECTOR (3 downto 0);
signal STORE_A : STD_LOGIC;
--signals for the memory addresses
signal mem_address_mux : STD_LOGIC;
signal mem_address_input : STD_LOGIC_VECTOR (3 downto 0);
signal mem_addr_counter : STD_LOGIC_VECTOR (3 downto 0);

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
--           FLAG_an : in STD_LOGIC;
           Display_out : out STD_LOGIC_VECTOR (7 DOWNTO 0);
           AN_out : out STD_LOGIC_VECTOR (7 DOWNTO 0)
           );
end component Seven_seg_driver;
--Divides the clock into a 1hz slow signal and a ~70hz signal for the display switching
component Divider
    Port ( CLK_IN : in STD_LOGIC;
           CLK_OUT_SLOW : out STD_LOGIC;
           CLK_OUT_AN : out STD_LOGIC;
--           RAND_OUT : out STD_LOGIC_VECTOR (7 downto 0) --not being used
           CLK_OUT_STATE : out STD_LOGIC
           );
end component Divider;
--Acts as memory, take data in and address and stores the value to memory when it is enambled,
--also has an output of the current location in mory
component Memory
    Port ( CLK : in STD_LOGIC;
           address : in STD_LOGIC_VECTOR (3 downto 0);
           data_in : in STD_LOGIC_VECTOR (7 downto 0);
           we : in STD_LOGIC;
           data_out : out STD_LOGIC_VECTOR (7 downto 0)
           );
end component Memory;
--Does specific operation on two values from the memory that are selected according to the 
--instruction given, aslo gives the output and the location to store the value.
component Execute
    Port ( reg_a : in STD_LOGIC_VECTOR (7 downto 0);
           reg_b : in STD_LOGIC_VECTOR (7 downto 0);
           op_a : in STD_LOGIC_VECTOR (3 downto 0);
           op_b : in STD_LOGIC_VECTOR (3 downto 0);
           instr : in STD_LOGIC_VECTOR (3 downto 0);
           ee : in STD_LOGIC;
           out_value : out STD_LOGIC_VECTOR (7 downto 0);
           store_location : out STD_LOGIC_VECTOR (3 downto 0)
           );
end component Execute;

begin
--maps the driver 
Seven_seg_map : Seven_seg_driver
     port map ( CLK_AN => clk_an,
                Disp1 => data_from_ram(3 downto 0),
                Disp2 => data_from_ram(7 downto 4),
                Disp3 => mem_address_input,
                Disp4 => INSTR,
                Disp5 => Disp5,
                Disp6 => Disp6,
                Disp7 => Disp7,
                Disp8 => Disp8,
                --FLAG_an => flag_an,
                Display_out => SEG,
                AN_out => AN
                );         
-- maps the divider to the annode/cathode clock and the slow 1hz clock and 8 bit random number      
divider_map : Divider
     port map ( CLK_IN  => CLK_IN,
                CLK_OUT_slow => clk_slow,
                CLK_OUT_an => clk_an,
--                RAND_OUT => rand_num --not being used
                CLK_OUT_STATE => clk_state
                );
--mamps memory to signals to be used in the Top module
memory_map : Memory
    port map ( CLK => CLK_IN,
               address => mem_address_input,
               data_in => data_to_ram,
               we => mem_wren,
               data_out => data_from_ram
               );
--mamps execute to signals to be used in the Top module               
execute_map : Execute
   port map ( reg_a => REG_A,
              reg_b => REG_B,
              op_a => OP_A,
              op_b => OP_B,
              instr => INSTR,
              ee => EE,
              out_value => OUT_VALUE,
              store_location => store_location
              );
------------------------------------------------------------------
--controls the current memory location depending on two variables and moves at a 1Hz clock rate
Address_Coding: process (clk_slow, go_up, go_down)	
    begin
        if rising_edge(clk_slow) then
            if go_up = '1' then
                mem_addr_counter  <= mem_addr_counter  + 1;
            elsif go_down = '1' then 
                mem_addr_counter  <= mem_addr_counter  - 1;
            end if;	
        end if;	
    end process address_coding;
--A Mux to decide on which memory address is being sent to Memory
Mem_mux: process (mem_address_mux)
    begin
        if mem_address_mux = '1' then
            mem_address_input <= mem_addr_counter; 
        elsif mem_address_mux = '0' then
            mem_address_input <= mem_addr;
        end if;
	end process Mem_mux;
------------------------------------------------------------
--Switches the state to the next state every clock cycle of CLK_IN
SYNC_PROC: process (CLK_IN)
   begin
      if (clk_state'event and clk_state = '1') then
--         if (RESET = '0') then
--            state <= st1_wait;
--         else
            state <= next_state;
--         end if;        
      end if;
   end process;
--The operations of eache state
   OUTPUT_DECODE: process (state)
   begin
      case state is
			when st1_wait =>
			    mem_address_mux <= '1';
				mem_wren <= '0';
				go_up <= '0';
				go_down	<= '0';
				EE <= '0';
				data_to_ram <= SW;
				--INSTR <= keep_instr;
			when st2_go_up =>
			    mem_address_mux <= '1';
				mem_wren <= '0';
				go_up <= '1';
				go_down	<= '0';
				EE <= '0';
			when st3_go_down =>
			    mem_address_mux <= '1';
				mem_wren <= '0';
				go_up <= '0';
				go_down	<= '1';
				EE <= '0';
			when st4_write =>
			    mem_address_mux <= '1';
                mem_wren <= '1';
                go_up <= '0';
                go_down <= '0';
                EE <= '0';
			when st5_read_instr =>
			    mem_address_mux <= '1';
			    mem_wren <= '0';
                go_up <= '0';
                go_down <= '0';
			    EE <= '0';
			    INSTR <= SW(7 downto 4);--
			    --keep_instr <= SW(7 downto 4);--
			when st6_read_op_A_B =>
			    mem_address_mux <= '1';
			    mem_wren <= '0';
                go_up <= '0';
                go_down    <= '0';
			    EE <= '0';
			    OP_A <=  SW(7 downto 4);--
			    OP_B <=  SW(3 downto 0);--
			when st6_5_change_mem =>
			    mem_address_mux <= '0';
			    mem_wren <= '0';
                go_up <= '0';
                go_down    <= '0';
                EE <= '0';
			    mem_addr <= OP_A;
			when st7_store_reg_A =>
			    mem_address_mux <= '0';
			    mem_wren <= '0';
                go_up <= '0';
                go_down    <= '0';
			    EE <= '0';
			    REG_A <= data_from_ram;
			when st7_5_change_mem =>
			    mem_address_mux <= '0';
			    mem_wren <= '0';
                go_up <= '0';
                go_down    <= '0';
                EE <= '0';
                mem_addr <= OP_B;    
			when st8_store_reg_B =>
			    mem_address_mux <= '0';
			    mem_wren <= '0';
                go_up <= '0';
                go_down <= '0';
			    EE <= '0';
			    REG_B <= data_from_ram;
			when st9_execute =>
			    mem_address_mux <= '0';
			    mem_wren <= '0';
                go_up <= '0';
                go_down <= '0';
			    EE <= '1';
            when st9_5_set_result_address =>
                mem_address_mux <= '0';
                mem_wren <= '0';
                go_up <= '0';
                go_down <= '0';
                EE <= '0';
                mem_addr <= store_location;
--                    if (STORE_A = '1') then
--                        mem_addr <= OP_A;
--                    end if;
--                    if (STORE_A = '0') then
--                        mem_addr <= OP_B;
--                    end if;   
                data_to_ram <= OUT_VALUE;
			when st10_write_result =>
			    mem_address_mux <= '0';
			    mem_wren <= '1';
                go_up <= '0';
                go_down <= '0';
			    EE <= '0';
			when others => null;
      end case;
   end process OUTPUT_DECODE;

--Chooses the next state depending on button presses
   NEXT_STATE_DECODE: process (state, BTNC, BTNU, BTND, BTNL, BTNR)
   begin
      next_state <= state;  
      
    case (state) is
        when st1_wait =>
            if BTNU = '1' then
                next_state <= st2_go_up;
			elsif BTND = '1' then
                next_state <= st3_go_down;
            elsif BTNC = '1' then
                next_state <= st4_write;
            elsif BTNL = '1' then
                next_state <= st5_read_instr;
            elsif BTNR = '1' then
                next_state <= st6_read_op_A_B;
            end if; 
        when st2_go_up =>
			if BTNU = '0' then
			   next_state <= st1_wait;
			end if;
		when st3_go_down =>
            if BTND = '0' then
				next_state <= st1_wait;
			end if;
	    when st4_write =>
	        if BTNC = '0' then
                next_state <= st1_wait;     
            end if;     
        when st5_read_instr =>
            if BTNL = '0' then
                next_state <= st1_wait;  
            end if;               
        when st6_read_op_A_B =>
            if BTNR = '0' then
                next_state <= st6_5_change_mem;  
            end if;
        when st6_5_change_mem =>
            next_state <= st7_store_reg_A; 
        when st7_store_reg_A =>
            next_state <= st7_5_change_mem; 
        when st7_5_change_mem =>
            next_state <= st8_store_reg_B;         
        when st8_store_reg_B =>
            next_state <= st9_execute;          
        when st9_execute =>
            next_state <= st9_5_set_result_address;  
        when st9_5_set_result_address =>
            next_state <= st10_write_result;     
        when st10_write_result =>
            next_state <= st1_wait;
        when others =>
            next_state <= st1_wait;
            
      end case;      
   end process;

end Behavioral;
