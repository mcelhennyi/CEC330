-- Copyright 1986-2015 Xilinx, Inc. All Rights Reserved.
-- --------------------------------------------------------------------------------
-- Tool Version: Vivado v.2015.2 (win64) Build 1266856 Fri Jun 26 16:35:25 MDT 2015
-- Date        : Mon Oct 26 23:57:10 2015
-- Host        : IanMcElhenny-PC running 64-bit major release  (build 9200)
-- Command     : write_vhdl -mode funcsim -nolib -force -file
--               F:/CEC330/Lab_6/Lab_6.sim/sim_1/synth/func/pwm_tb_func_synth.vhd
-- Design      : Top_countdown
-- Purpose     : This VHDL netlist is a functional simulation representation of the design and should not be modified or
--               synthesized. This netlist cannot be used for SDF annotated simulation.
-- Device      : xc7a100tcsg324-1
-- --------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Divider is
  port (
    CLK : out STD_LOGIC;
    \pwm_level_reg[0]\ : out STD_LOGIC;
    \register_counter_reg[7]\ : out STD_LOGIC;
    CLK_IN_IBUF_BUFG : in STD_LOGIC
  );
end Divider;

architecture STRUCTURE of Divider is
  signal \^clk\ : STD_LOGIC;
  signal clk_out16Hz_i_1_n_0 : STD_LOGIC;
  signal clk_out16Hz_i_2_n_0 : STD_LOGIC;
  signal clk_out16Hz_i_3_n_0 : STD_LOGIC;
  signal clk_out16Hz_i_4_n_0 : STD_LOGIC;
  signal clk_out1Hz_i_1_n_0 : STD_LOGIC;
  signal clk_out1Hz_i_2_n_0 : STD_LOGIC;
  signal clk_out1Hz_i_3_n_0 : STD_LOGIC;
  signal clk_out1Hz_i_4_n_0 : STD_LOGIC;
  signal clk_out50Hz_i_1_n_0 : STD_LOGIC;
  signal clk_out50Hz_i_2_n_0 : STD_LOGIC;
  signal \counter16Hz[0]_i_10_n_0\ : STD_LOGIC;
  signal \counter16Hz[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter16Hz[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter16Hz[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter16Hz[0]_i_5_n_0\ : STD_LOGIC;
  signal \counter16Hz[0]_i_6_n_0\ : STD_LOGIC;
  signal \counter16Hz[0]_i_7_n_0\ : STD_LOGIC;
  signal \counter16Hz[0]_i_8_n_0\ : STD_LOGIC;
  signal \counter16Hz[0]_i_9_n_0\ : STD_LOGIC;
  signal \counter16Hz[12]_i_2_n_0\ : STD_LOGIC;
  signal \counter16Hz[12]_i_3_n_0\ : STD_LOGIC;
  signal \counter16Hz[12]_i_4_n_0\ : STD_LOGIC;
  signal \counter16Hz[12]_i_5_n_0\ : STD_LOGIC;
  signal \counter16Hz[16]_i_2_n_0\ : STD_LOGIC;
  signal \counter16Hz[16]_i_3_n_0\ : STD_LOGIC;
  signal \counter16Hz[16]_i_4_n_0\ : STD_LOGIC;
  signal \counter16Hz[16]_i_5_n_0\ : STD_LOGIC;
  signal \counter16Hz[20]_i_2_n_0\ : STD_LOGIC;
  signal \counter16Hz[20]_i_3_n_0\ : STD_LOGIC;
  signal \counter16Hz[20]_i_4_n_0\ : STD_LOGIC;
  signal \counter16Hz[20]_i_5_n_0\ : STD_LOGIC;
  signal \counter16Hz[4]_i_2_n_0\ : STD_LOGIC;
  signal \counter16Hz[4]_i_3_n_0\ : STD_LOGIC;
  signal \counter16Hz[4]_i_4_n_0\ : STD_LOGIC;
  signal \counter16Hz[4]_i_5_n_0\ : STD_LOGIC;
  signal \counter16Hz[8]_i_2_n_0\ : STD_LOGIC;
  signal \counter16Hz[8]_i_3_n_0\ : STD_LOGIC;
  signal \counter16Hz[8]_i_4_n_0\ : STD_LOGIC;
  signal \counter16Hz[8]_i_5_n_0\ : STD_LOGIC;
  signal counter16Hz_reg : STD_LOGIC_VECTOR ( 23 downto 0 );
  signal \counter16Hz_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter16Hz_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \counter16Hz_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \counter16Hz_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \counter16Hz_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \counter16Hz_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \counter16Hz_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \counter16Hz_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \counter16Hz_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter16Hz_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter16Hz_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter16Hz_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter16Hz_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter16Hz_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter16Hz_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter16Hz_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter16Hz_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter16Hz_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter16Hz_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter16Hz_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter16Hz_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter16Hz_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter16Hz_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter16Hz_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter16Hz_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter16Hz_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter16Hz_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter16Hz_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter16Hz_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter16Hz_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter16Hz_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter16Hz_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter16Hz_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter16Hz_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter16Hz_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter16Hz_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter16Hz_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter16Hz_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter16Hz_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter16Hz_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter16Hz_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter16Hz_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter16Hz_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter16Hz_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter16Hz_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter16Hz_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter16Hz_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \counter1Hz[0]_i_10_n_0\ : STD_LOGIC;
  signal \counter1Hz[0]_i_11_n_0\ : STD_LOGIC;
  signal \counter1Hz[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter1Hz[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter1Hz[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter1Hz[0]_i_5_n_0\ : STD_LOGIC;
  signal \counter1Hz[0]_i_6_n_0\ : STD_LOGIC;
  signal \counter1Hz[0]_i_7_n_0\ : STD_LOGIC;
  signal \counter1Hz[0]_i_8_n_0\ : STD_LOGIC;
  signal \counter1Hz[0]_i_9_n_0\ : STD_LOGIC;
  signal \counter1Hz[12]_i_2_n_0\ : STD_LOGIC;
  signal \counter1Hz[12]_i_3_n_0\ : STD_LOGIC;
  signal \counter1Hz[12]_i_4_n_0\ : STD_LOGIC;
  signal \counter1Hz[12]_i_5_n_0\ : STD_LOGIC;
  signal \counter1Hz[16]_i_2_n_0\ : STD_LOGIC;
  signal \counter1Hz[16]_i_3_n_0\ : STD_LOGIC;
  signal \counter1Hz[16]_i_4_n_0\ : STD_LOGIC;
  signal \counter1Hz[16]_i_5_n_0\ : STD_LOGIC;
  signal \counter1Hz[20]_i_2_n_0\ : STD_LOGIC;
  signal \counter1Hz[20]_i_3_n_0\ : STD_LOGIC;
  signal \counter1Hz[20]_i_4_n_0\ : STD_LOGIC;
  signal \counter1Hz[20]_i_5_n_0\ : STD_LOGIC;
  signal \counter1Hz[24]_i_2_n_0\ : STD_LOGIC;
  signal \counter1Hz[24]_i_3_n_0\ : STD_LOGIC;
  signal \counter1Hz[24]_i_4_n_0\ : STD_LOGIC;
  signal \counter1Hz[4]_i_2_n_0\ : STD_LOGIC;
  signal \counter1Hz[4]_i_3_n_0\ : STD_LOGIC;
  signal \counter1Hz[4]_i_4_n_0\ : STD_LOGIC;
  signal \counter1Hz[4]_i_5_n_0\ : STD_LOGIC;
  signal \counter1Hz[8]_i_2_n_0\ : STD_LOGIC;
  signal \counter1Hz[8]_i_3_n_0\ : STD_LOGIC;
  signal \counter1Hz[8]_i_4_n_0\ : STD_LOGIC;
  signal \counter1Hz[8]_i_5_n_0\ : STD_LOGIC;
  signal counter1Hz_reg : STD_LOGIC_VECTOR ( 26 downto 0 );
  signal \counter1Hz_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter1Hz_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \counter1Hz_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \counter1Hz_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \counter1Hz_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \counter1Hz_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \counter1Hz_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \counter1Hz_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \counter1Hz_reg[12]_i_1_n_0\ : STD_LOGIC;
  signal \counter1Hz_reg[12]_i_1_n_1\ : STD_LOGIC;
  signal \counter1Hz_reg[12]_i_1_n_2\ : STD_LOGIC;
  signal \counter1Hz_reg[12]_i_1_n_3\ : STD_LOGIC;
  signal \counter1Hz_reg[12]_i_1_n_4\ : STD_LOGIC;
  signal \counter1Hz_reg[12]_i_1_n_5\ : STD_LOGIC;
  signal \counter1Hz_reg[12]_i_1_n_6\ : STD_LOGIC;
  signal \counter1Hz_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter1Hz_reg[16]_i_1_n_0\ : STD_LOGIC;
  signal \counter1Hz_reg[16]_i_1_n_1\ : STD_LOGIC;
  signal \counter1Hz_reg[16]_i_1_n_2\ : STD_LOGIC;
  signal \counter1Hz_reg[16]_i_1_n_3\ : STD_LOGIC;
  signal \counter1Hz_reg[16]_i_1_n_4\ : STD_LOGIC;
  signal \counter1Hz_reg[16]_i_1_n_5\ : STD_LOGIC;
  signal \counter1Hz_reg[16]_i_1_n_6\ : STD_LOGIC;
  signal \counter1Hz_reg[16]_i_1_n_7\ : STD_LOGIC;
  signal \counter1Hz_reg[20]_i_1_n_0\ : STD_LOGIC;
  signal \counter1Hz_reg[20]_i_1_n_1\ : STD_LOGIC;
  signal \counter1Hz_reg[20]_i_1_n_2\ : STD_LOGIC;
  signal \counter1Hz_reg[20]_i_1_n_3\ : STD_LOGIC;
  signal \counter1Hz_reg[20]_i_1_n_4\ : STD_LOGIC;
  signal \counter1Hz_reg[20]_i_1_n_5\ : STD_LOGIC;
  signal \counter1Hz_reg[20]_i_1_n_6\ : STD_LOGIC;
  signal \counter1Hz_reg[20]_i_1_n_7\ : STD_LOGIC;
  signal \counter1Hz_reg[24]_i_1_n_2\ : STD_LOGIC;
  signal \counter1Hz_reg[24]_i_1_n_3\ : STD_LOGIC;
  signal \counter1Hz_reg[24]_i_1_n_5\ : STD_LOGIC;
  signal \counter1Hz_reg[24]_i_1_n_6\ : STD_LOGIC;
  signal \counter1Hz_reg[24]_i_1_n_7\ : STD_LOGIC;
  signal \counter1Hz_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter1Hz_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter1Hz_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter1Hz_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter1Hz_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter1Hz_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter1Hz_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter1Hz_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter1Hz_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter1Hz_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter1Hz_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter1Hz_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter1Hz_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter1Hz_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter1Hz_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter1Hz_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \counter50Hz[0]_i_1_n_0\ : STD_LOGIC;
  signal \counter50Hz[0]_i_3_n_0\ : STD_LOGIC;
  signal \counter50Hz[0]_i_4_n_0\ : STD_LOGIC;
  signal \counter50Hz[0]_i_5_n_0\ : STD_LOGIC;
  signal \counter50Hz[0]_i_6_n_0\ : STD_LOGIC;
  signal \counter50Hz[0]_i_7_n_0\ : STD_LOGIC;
  signal \counter50Hz[0]_i_8_n_0\ : STD_LOGIC;
  signal \counter50Hz[12]_i_2_n_0\ : STD_LOGIC;
  signal \counter50Hz[4]_i_2_n_0\ : STD_LOGIC;
  signal \counter50Hz[4]_i_3_n_0\ : STD_LOGIC;
  signal \counter50Hz[4]_i_4_n_0\ : STD_LOGIC;
  signal \counter50Hz[4]_i_5_n_0\ : STD_LOGIC;
  signal \counter50Hz[8]_i_2_n_0\ : STD_LOGIC;
  signal \counter50Hz[8]_i_3_n_0\ : STD_LOGIC;
  signal \counter50Hz[8]_i_4_n_0\ : STD_LOGIC;
  signal \counter50Hz[8]_i_5_n_0\ : STD_LOGIC;
  signal counter50Hz_reg : STD_LOGIC_VECTOR ( 12 downto 0 );
  signal \counter50Hz_reg[0]_i_2_n_0\ : STD_LOGIC;
  signal \counter50Hz_reg[0]_i_2_n_1\ : STD_LOGIC;
  signal \counter50Hz_reg[0]_i_2_n_2\ : STD_LOGIC;
  signal \counter50Hz_reg[0]_i_2_n_3\ : STD_LOGIC;
  signal \counter50Hz_reg[0]_i_2_n_4\ : STD_LOGIC;
  signal \counter50Hz_reg[0]_i_2_n_5\ : STD_LOGIC;
  signal \counter50Hz_reg[0]_i_2_n_6\ : STD_LOGIC;
  signal \counter50Hz_reg[0]_i_2_n_7\ : STD_LOGIC;
  signal \counter50Hz_reg[12]_i_1_n_7\ : STD_LOGIC;
  signal \counter50Hz_reg[4]_i_1_n_0\ : STD_LOGIC;
  signal \counter50Hz_reg[4]_i_1_n_1\ : STD_LOGIC;
  signal \counter50Hz_reg[4]_i_1_n_2\ : STD_LOGIC;
  signal \counter50Hz_reg[4]_i_1_n_3\ : STD_LOGIC;
  signal \counter50Hz_reg[4]_i_1_n_4\ : STD_LOGIC;
  signal \counter50Hz_reg[4]_i_1_n_5\ : STD_LOGIC;
  signal \counter50Hz_reg[4]_i_1_n_6\ : STD_LOGIC;
  signal \counter50Hz_reg[4]_i_1_n_7\ : STD_LOGIC;
  signal \counter50Hz_reg[8]_i_1_n_0\ : STD_LOGIC;
  signal \counter50Hz_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \counter50Hz_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \counter50Hz_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \counter50Hz_reg[8]_i_1_n_4\ : STD_LOGIC;
  signal \counter50Hz_reg[8]_i_1_n_5\ : STD_LOGIC;
  signal \counter50Hz_reg[8]_i_1_n_6\ : STD_LOGIC;
  signal \counter50Hz_reg[8]_i_1_n_7\ : STD_LOGIC;
  signal \^pwm_level_reg[0]\ : STD_LOGIC;
  signal \^register_counter_reg[7]\ : STD_LOGIC;
  signal \NLW_counter16Hz_reg[20]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_counter1Hz_reg[24]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 2 );
  signal \NLW_counter1Hz_reg[24]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 to 3 );
  signal \NLW_counter50Hz_reg[12]_i_1_CO_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \NLW_counter50Hz_reg[12]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 1 );
begin
  CLK <= \^clk\;
  \pwm_level_reg[0]\ <= \^pwm_level_reg[0]\;
  \register_counter_reg[7]\ <= \^register_counter_reg[7]\;
clk_out16Hz_i_1: unisim.vcomponents.LUT5
    generic map(
      INIT => X"F4444444"
    )
        port map (
      I0 => \counter16Hz[0]_i_1_n_0\,
      I1 => \^pwm_level_reg[0]\,
      I2 => clk_out16Hz_i_2_n_0,
      I3 => clk_out16Hz_i_3_n_0,
      I4 => clk_out16Hz_i_4_n_0,
      O => clk_out16Hz_i_1_n_0
    );
clk_out16Hz_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000800000"
    )
        port map (
      I0 => counter16Hz_reg(3),
      I1 => counter16Hz_reg(8),
      I2 => counter16Hz_reg(21),
      I3 => counter16Hz_reg(12),
      I4 => counter16Hz_reg(15),
      I5 => counter16Hz_reg(14),
      O => clk_out16Hz_i_2_n_0
    );
clk_out16Hz_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => counter16Hz_reg(20),
      I1 => counter16Hz_reg(9),
      I2 => counter16Hz_reg(13),
      I3 => counter16Hz_reg(4),
      I4 => counter16Hz_reg(19),
      I5 => counter16Hz_reg(22),
      O => clk_out16Hz_i_3_n_0
    );
clk_out16Hz_i_4: unisim.vcomponents.LUT3
    generic map(
      INIT => X"02"
    )
        port map (
      I0 => \counter16Hz[0]_i_4_n_0\,
      I1 => counter16Hz_reg(5),
      I2 => \counter16Hz[0]_i_3_n_0\,
      O => clk_out16Hz_i_4_n_0
    );
clk_out16Hz_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => clk_out16Hz_i_1_n_0,
      Q => \^pwm_level_reg[0]\,
      R => '0'
    );
clk_out1Hz_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"4444F44444444444"
    )
        port map (
      I0 => \counter1Hz[0]_i_1_n_0\,
      I1 => \^clk\,
      I2 => clk_out1Hz_i_2_n_0,
      I3 => clk_out1Hz_i_3_n_0,
      I4 => \counter1Hz[0]_i_5_n_0\,
      I5 => clk_out1Hz_i_4_n_0,
      O => clk_out1Hz_i_1_n_0
    );
clk_out1Hz_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0004000000000000"
    )
        port map (
      I0 => counter1Hz_reg(8),
      I1 => counter1Hz_reg(25),
      I2 => counter1Hz_reg(24),
      I3 => counter1Hz_reg(18),
      I4 => counter1Hz_reg(7),
      I5 => counter1Hz_reg(19),
      O => clk_out1Hz_i_2_n_0
    );
clk_out1Hz_i_3: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000100000"
    )
        port map (
      I0 => counter1Hz_reg(16),
      I1 => counter1Hz_reg(9),
      I2 => counter1Hz_reg(17),
      I3 => counter1Hz_reg(26),
      I4 => counter1Hz_reg(12),
      I5 => counter1Hz_reg(6),
      O => clk_out1Hz_i_3_n_0
    );
clk_out1Hz_i_4: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0100000000000000"
    )
        port map (
      I0 => counter1Hz_reg(3),
      I1 => counter1Hz_reg(1),
      I2 => counter1Hz_reg(4),
      I3 => counter1Hz_reg(21),
      I4 => counter1Hz_reg(13),
      I5 => \counter1Hz[0]_i_3_n_0\,
      O => clk_out1Hz_i_4_n_0
    );
clk_out1Hz_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => clk_out1Hz_i_1_n_0,
      Q => \^clk\,
      R => '0'
    );
clk_out50Hz_i_1: unisim.vcomponents.LUT6
    generic map(
      INIT => X"10FF101000FF0000"
    )
        port map (
      I0 => counter50Hz_reg(5),
      I1 => counter50Hz_reg(3),
      I2 => \counter50Hz[0]_i_3_n_0\,
      I3 => \counter50Hz[0]_i_1_n_0\,
      I4 => \^register_counter_reg[7]\,
      I5 => clk_out50Hz_i_2_n_0,
      O => clk_out50Hz_i_1_n_0
    );
clk_out50Hz_i_2: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => counter50Hz_reg(7),
      I1 => counter50Hz_reg(8),
      I2 => counter50Hz_reg(6),
      I3 => counter50Hz_reg(12),
      I4 => counter50Hz_reg(1),
      I5 => counter50Hz_reg(2),
      O => clk_out50Hz_i_2_n_0
    );
clk_out50Hz_reg: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => clk_out50Hz_i_1_n_0,
      Q => \^register_counter_reg[7]\,
      R => '0'
    );
\counter16Hz[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"10000000"
    )
        port map (
      I0 => \counter16Hz[0]_i_3_n_0\,
      I1 => counter16Hz_reg(5),
      I2 => \counter16Hz[0]_i_4_n_0\,
      I3 => \counter16Hz[0]_i_5_n_0\,
      I4 => \counter16Hz[0]_i_6_n_0\,
      O => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz[0]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter16Hz_reg(0),
      O => \counter16Hz[0]_i_10_n_0\
    );
\counter16Hz[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFFFFFF7FFF"
    )
        port map (
      I0 => counter16Hz_reg(17),
      I1 => counter16Hz_reg(16),
      I2 => counter16Hz_reg(11),
      I3 => counter16Hz_reg(10),
      I4 => counter16Hz_reg(6),
      I5 => counter16Hz_reg(23),
      O => \counter16Hz[0]_i_3_n_0\
    );
\counter16Hz[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000100"
    )
        port map (
      I0 => counter16Hz_reg(2),
      I1 => counter16Hz_reg(0),
      I2 => counter16Hz_reg(1),
      I3 => counter16Hz_reg(18),
      I4 => counter16Hz_reg(7),
      O => \counter16Hz[0]_i_4_n_0\
    );
\counter16Hz[0]_i_5\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0080000000000000"
    )
        port map (
      I0 => counter16Hz_reg(20),
      I1 => counter16Hz_reg(9),
      I2 => counter16Hz_reg(4),
      I3 => counter16Hz_reg(13),
      I4 => counter16Hz_reg(19),
      I5 => counter16Hz_reg(22),
      O => \counter16Hz[0]_i_5_n_0\
    );
\counter16Hz[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000100000"
    )
        port map (
      I0 => counter16Hz_reg(3),
      I1 => counter16Hz_reg(8),
      I2 => counter16Hz_reg(12),
      I3 => counter16Hz_reg(21),
      I4 => counter16Hz_reg(14),
      I5 => counter16Hz_reg(15),
      O => \counter16Hz[0]_i_6_n_0\
    );
\counter16Hz[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(3),
      O => \counter16Hz[0]_i_7_n_0\
    );
\counter16Hz[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(2),
      O => \counter16Hz[0]_i_8_n_0\
    );
\counter16Hz[0]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(1),
      O => \counter16Hz[0]_i_9_n_0\
    );
\counter16Hz[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(15),
      O => \counter16Hz[12]_i_2_n_0\
    );
\counter16Hz[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(14),
      O => \counter16Hz[12]_i_3_n_0\
    );
\counter16Hz[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(13),
      O => \counter16Hz[12]_i_4_n_0\
    );
\counter16Hz[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(12),
      O => \counter16Hz[12]_i_5_n_0\
    );
\counter16Hz[16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(19),
      O => \counter16Hz[16]_i_2_n_0\
    );
\counter16Hz[16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(18),
      O => \counter16Hz[16]_i_3_n_0\
    );
\counter16Hz[16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(17),
      O => \counter16Hz[16]_i_4_n_0\
    );
\counter16Hz[16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(16),
      O => \counter16Hz[16]_i_5_n_0\
    );
\counter16Hz[20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(23),
      O => \counter16Hz[20]_i_2_n_0\
    );
\counter16Hz[20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(22),
      O => \counter16Hz[20]_i_3_n_0\
    );
\counter16Hz[20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(21),
      O => \counter16Hz[20]_i_4_n_0\
    );
\counter16Hz[20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(20),
      O => \counter16Hz[20]_i_5_n_0\
    );
\counter16Hz[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(7),
      O => \counter16Hz[4]_i_2_n_0\
    );
\counter16Hz[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(6),
      O => \counter16Hz[4]_i_3_n_0\
    );
\counter16Hz[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(5),
      O => \counter16Hz[4]_i_4_n_0\
    );
\counter16Hz[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(4),
      O => \counter16Hz[4]_i_5_n_0\
    );
\counter16Hz[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(11),
      O => \counter16Hz[8]_i_2_n_0\
    );
\counter16Hz[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(10),
      O => \counter16Hz[8]_i_3_n_0\
    );
\counter16Hz[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(9),
      O => \counter16Hz[8]_i_4_n_0\
    );
\counter16Hz[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter16Hz_reg(8),
      O => \counter16Hz[8]_i_5_n_0\
    );
\counter16Hz_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[0]_i_2_n_7\,
      Q => counter16Hz_reg(0),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter16Hz_reg[0]_i_2_n_0\,
      CO(2) => \counter16Hz_reg[0]_i_2_n_1\,
      CO(1) => \counter16Hz_reg[0]_i_2_n_2\,
      CO(0) => \counter16Hz_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \counter16Hz_reg[0]_i_2_n_4\,
      O(2) => \counter16Hz_reg[0]_i_2_n_5\,
      O(1) => \counter16Hz_reg[0]_i_2_n_6\,
      O(0) => \counter16Hz_reg[0]_i_2_n_7\,
      S(3) => \counter16Hz[0]_i_7_n_0\,
      S(2) => \counter16Hz[0]_i_8_n_0\,
      S(1) => \counter16Hz[0]_i_9_n_0\,
      S(0) => \counter16Hz[0]_i_10_n_0\
    );
\counter16Hz_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[8]_i_1_n_5\,
      Q => counter16Hz_reg(10),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[8]_i_1_n_4\,
      Q => counter16Hz_reg(11),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[12]_i_1_n_7\,
      Q => counter16Hz_reg(12),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter16Hz_reg[8]_i_1_n_0\,
      CO(3) => \counter16Hz_reg[12]_i_1_n_0\,
      CO(2) => \counter16Hz_reg[12]_i_1_n_1\,
      CO(1) => \counter16Hz_reg[12]_i_1_n_2\,
      CO(0) => \counter16Hz_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter16Hz_reg[12]_i_1_n_4\,
      O(2) => \counter16Hz_reg[12]_i_1_n_5\,
      O(1) => \counter16Hz_reg[12]_i_1_n_6\,
      O(0) => \counter16Hz_reg[12]_i_1_n_7\,
      S(3) => \counter16Hz[12]_i_2_n_0\,
      S(2) => \counter16Hz[12]_i_3_n_0\,
      S(1) => \counter16Hz[12]_i_4_n_0\,
      S(0) => \counter16Hz[12]_i_5_n_0\
    );
\counter16Hz_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[12]_i_1_n_6\,
      Q => counter16Hz_reg(13),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[12]_i_1_n_5\,
      Q => counter16Hz_reg(14),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[12]_i_1_n_4\,
      Q => counter16Hz_reg(15),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[16]_i_1_n_7\,
      Q => counter16Hz_reg(16),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter16Hz_reg[12]_i_1_n_0\,
      CO(3) => \counter16Hz_reg[16]_i_1_n_0\,
      CO(2) => \counter16Hz_reg[16]_i_1_n_1\,
      CO(1) => \counter16Hz_reg[16]_i_1_n_2\,
      CO(0) => \counter16Hz_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter16Hz_reg[16]_i_1_n_4\,
      O(2) => \counter16Hz_reg[16]_i_1_n_5\,
      O(1) => \counter16Hz_reg[16]_i_1_n_6\,
      O(0) => \counter16Hz_reg[16]_i_1_n_7\,
      S(3) => \counter16Hz[16]_i_2_n_0\,
      S(2) => \counter16Hz[16]_i_3_n_0\,
      S(1) => \counter16Hz[16]_i_4_n_0\,
      S(0) => \counter16Hz[16]_i_5_n_0\
    );
\counter16Hz_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[16]_i_1_n_6\,
      Q => counter16Hz_reg(17),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[16]_i_1_n_5\,
      Q => counter16Hz_reg(18),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[16]_i_1_n_4\,
      Q => counter16Hz_reg(19),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[0]_i_2_n_6\,
      Q => counter16Hz_reg(1),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[20]_i_1_n_7\,
      Q => counter16Hz_reg(20),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter16Hz_reg[16]_i_1_n_0\,
      CO(3) => \NLW_counter16Hz_reg[20]_i_1_CO_UNCONNECTED\(3),
      CO(2) => \counter16Hz_reg[20]_i_1_n_1\,
      CO(1) => \counter16Hz_reg[20]_i_1_n_2\,
      CO(0) => \counter16Hz_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter16Hz_reg[20]_i_1_n_4\,
      O(2) => \counter16Hz_reg[20]_i_1_n_5\,
      O(1) => \counter16Hz_reg[20]_i_1_n_6\,
      O(0) => \counter16Hz_reg[20]_i_1_n_7\,
      S(3) => \counter16Hz[20]_i_2_n_0\,
      S(2) => \counter16Hz[20]_i_3_n_0\,
      S(1) => \counter16Hz[20]_i_4_n_0\,
      S(0) => \counter16Hz[20]_i_5_n_0\
    );
\counter16Hz_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[20]_i_1_n_6\,
      Q => counter16Hz_reg(21),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[20]_i_1_n_5\,
      Q => counter16Hz_reg(22),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[20]_i_1_n_4\,
      Q => counter16Hz_reg(23),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[0]_i_2_n_5\,
      Q => counter16Hz_reg(2),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[0]_i_2_n_4\,
      Q => counter16Hz_reg(3),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[4]_i_1_n_7\,
      Q => counter16Hz_reg(4),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter16Hz_reg[0]_i_2_n_0\,
      CO(3) => \counter16Hz_reg[4]_i_1_n_0\,
      CO(2) => \counter16Hz_reg[4]_i_1_n_1\,
      CO(1) => \counter16Hz_reg[4]_i_1_n_2\,
      CO(0) => \counter16Hz_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter16Hz_reg[4]_i_1_n_4\,
      O(2) => \counter16Hz_reg[4]_i_1_n_5\,
      O(1) => \counter16Hz_reg[4]_i_1_n_6\,
      O(0) => \counter16Hz_reg[4]_i_1_n_7\,
      S(3) => \counter16Hz[4]_i_2_n_0\,
      S(2) => \counter16Hz[4]_i_3_n_0\,
      S(1) => \counter16Hz[4]_i_4_n_0\,
      S(0) => \counter16Hz[4]_i_5_n_0\
    );
\counter16Hz_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[4]_i_1_n_6\,
      Q => counter16Hz_reg(5),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[4]_i_1_n_5\,
      Q => counter16Hz_reg(6),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[4]_i_1_n_4\,
      Q => counter16Hz_reg(7),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[8]_i_1_n_7\,
      Q => counter16Hz_reg(8),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter16Hz_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter16Hz_reg[4]_i_1_n_0\,
      CO(3) => \counter16Hz_reg[8]_i_1_n_0\,
      CO(2) => \counter16Hz_reg[8]_i_1_n_1\,
      CO(1) => \counter16Hz_reg[8]_i_1_n_2\,
      CO(0) => \counter16Hz_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter16Hz_reg[8]_i_1_n_4\,
      O(2) => \counter16Hz_reg[8]_i_1_n_5\,
      O(1) => \counter16Hz_reg[8]_i_1_n_6\,
      O(0) => \counter16Hz_reg[8]_i_1_n_7\,
      S(3) => \counter16Hz[8]_i_2_n_0\,
      S(2) => \counter16Hz[8]_i_3_n_0\,
      S(1) => \counter16Hz[8]_i_4_n_0\,
      S(0) => \counter16Hz[8]_i_5_n_0\
    );
\counter16Hz_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter16Hz_reg[8]_i_1_n_6\,
      Q => counter16Hz_reg(9),
      R => \counter16Hz[0]_i_1_n_0\
    );
\counter1Hz[0]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"08000000"
    )
        port map (
      I0 => \counter1Hz[0]_i_3_n_0\,
      I1 => \counter1Hz[0]_i_4_n_0\,
      I2 => \counter1Hz[0]_i_5_n_0\,
      I3 => \counter1Hz[0]_i_6_n_0\,
      I4 => \counter1Hz[0]_i_7_n_0\,
      O => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz[0]_i_10\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(1),
      O => \counter1Hz[0]_i_10_n_0\
    );
\counter1Hz[0]_i_11\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter1Hz_reg(0),
      O => \counter1Hz[0]_i_11_n_0\
    );
\counter1Hz[0]_i_3\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => counter1Hz_reg(0),
      I1 => counter1Hz_reg(22),
      I2 => counter1Hz_reg(23),
      I3 => counter1Hz_reg(5),
      I4 => counter1Hz_reg(14),
      I5 => counter1Hz_reg(2),
      O => \counter1Hz[0]_i_3_n_0\
    );
\counter1Hz[0]_i_4\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000008"
    )
        port map (
      I0 => counter1Hz_reg(13),
      I1 => counter1Hz_reg(21),
      I2 => counter1Hz_reg(4),
      I3 => counter1Hz_reg(1),
      I4 => counter1Hz_reg(3),
      O => \counter1Hz[0]_i_4_n_0\
    );
\counter1Hz[0]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"EFFF"
    )
        port map (
      I0 => counter1Hz_reg(10),
      I1 => counter1Hz_reg(11),
      I2 => counter1Hz_reg(15),
      I3 => counter1Hz_reg(20),
      O => \counter1Hz[0]_i_5_n_0\
    );
\counter1Hz[0]_i_6\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000000040"
    )
        port map (
      I0 => counter1Hz_reg(9),
      I1 => counter1Hz_reg(16),
      I2 => counter1Hz_reg(26),
      I3 => counter1Hz_reg(17),
      I4 => counter1Hz_reg(6),
      I5 => counter1Hz_reg(12),
      O => \counter1Hz[0]_i_6_n_0\
    );
\counter1Hz[0]_i_7\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000004000"
    )
        port map (
      I0 => counter1Hz_reg(25),
      I1 => counter1Hz_reg(8),
      I2 => counter1Hz_reg(24),
      I3 => counter1Hz_reg(18),
      I4 => counter1Hz_reg(7),
      I5 => counter1Hz_reg(19),
      O => \counter1Hz[0]_i_7_n_0\
    );
\counter1Hz[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(3),
      O => \counter1Hz[0]_i_8_n_0\
    );
\counter1Hz[0]_i_9\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(2),
      O => \counter1Hz[0]_i_9_n_0\
    );
\counter1Hz[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(15),
      O => \counter1Hz[12]_i_2_n_0\
    );
\counter1Hz[12]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(14),
      O => \counter1Hz[12]_i_3_n_0\
    );
\counter1Hz[12]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(13),
      O => \counter1Hz[12]_i_4_n_0\
    );
\counter1Hz[12]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(12),
      O => \counter1Hz[12]_i_5_n_0\
    );
\counter1Hz[16]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(19),
      O => \counter1Hz[16]_i_2_n_0\
    );
\counter1Hz[16]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(18),
      O => \counter1Hz[16]_i_3_n_0\
    );
\counter1Hz[16]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(17),
      O => \counter1Hz[16]_i_4_n_0\
    );
\counter1Hz[16]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(16),
      O => \counter1Hz[16]_i_5_n_0\
    );
\counter1Hz[20]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(23),
      O => \counter1Hz[20]_i_2_n_0\
    );
\counter1Hz[20]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(22),
      O => \counter1Hz[20]_i_3_n_0\
    );
\counter1Hz[20]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(21),
      O => \counter1Hz[20]_i_4_n_0\
    );
\counter1Hz[20]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(20),
      O => \counter1Hz[20]_i_5_n_0\
    );
\counter1Hz[24]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(26),
      O => \counter1Hz[24]_i_2_n_0\
    );
\counter1Hz[24]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(25),
      O => \counter1Hz[24]_i_3_n_0\
    );
\counter1Hz[24]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(24),
      O => \counter1Hz[24]_i_4_n_0\
    );
\counter1Hz[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(7),
      O => \counter1Hz[4]_i_2_n_0\
    );
\counter1Hz[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(6),
      O => \counter1Hz[4]_i_3_n_0\
    );
\counter1Hz[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(5),
      O => \counter1Hz[4]_i_4_n_0\
    );
\counter1Hz[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(4),
      O => \counter1Hz[4]_i_5_n_0\
    );
\counter1Hz[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(11),
      O => \counter1Hz[8]_i_2_n_0\
    );
\counter1Hz[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(10),
      O => \counter1Hz[8]_i_3_n_0\
    );
\counter1Hz[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(9),
      O => \counter1Hz[8]_i_4_n_0\
    );
\counter1Hz[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter1Hz_reg(8),
      O => \counter1Hz[8]_i_5_n_0\
    );
\counter1Hz_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[0]_i_2_n_7\,
      Q => counter1Hz_reg(0),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter1Hz_reg[0]_i_2_n_0\,
      CO(2) => \counter1Hz_reg[0]_i_2_n_1\,
      CO(1) => \counter1Hz_reg[0]_i_2_n_2\,
      CO(0) => \counter1Hz_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \counter1Hz_reg[0]_i_2_n_4\,
      O(2) => \counter1Hz_reg[0]_i_2_n_5\,
      O(1) => \counter1Hz_reg[0]_i_2_n_6\,
      O(0) => \counter1Hz_reg[0]_i_2_n_7\,
      S(3) => \counter1Hz[0]_i_8_n_0\,
      S(2) => \counter1Hz[0]_i_9_n_0\,
      S(1) => \counter1Hz[0]_i_10_n_0\,
      S(0) => \counter1Hz[0]_i_11_n_0\
    );
\counter1Hz_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[8]_i_1_n_5\,
      Q => counter1Hz_reg(10),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[8]_i_1_n_4\,
      Q => counter1Hz_reg(11),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[12]_i_1_n_7\,
      Q => counter1Hz_reg(12),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter1Hz_reg[8]_i_1_n_0\,
      CO(3) => \counter1Hz_reg[12]_i_1_n_0\,
      CO(2) => \counter1Hz_reg[12]_i_1_n_1\,
      CO(1) => \counter1Hz_reg[12]_i_1_n_2\,
      CO(0) => \counter1Hz_reg[12]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter1Hz_reg[12]_i_1_n_4\,
      O(2) => \counter1Hz_reg[12]_i_1_n_5\,
      O(1) => \counter1Hz_reg[12]_i_1_n_6\,
      O(0) => \counter1Hz_reg[12]_i_1_n_7\,
      S(3) => \counter1Hz[12]_i_2_n_0\,
      S(2) => \counter1Hz[12]_i_3_n_0\,
      S(1) => \counter1Hz[12]_i_4_n_0\,
      S(0) => \counter1Hz[12]_i_5_n_0\
    );
\counter1Hz_reg[13]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[12]_i_1_n_6\,
      Q => counter1Hz_reg(13),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[14]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[12]_i_1_n_5\,
      Q => counter1Hz_reg(14),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[15]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[12]_i_1_n_4\,
      Q => counter1Hz_reg(15),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[16]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[16]_i_1_n_7\,
      Q => counter1Hz_reg(16),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[16]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter1Hz_reg[12]_i_1_n_0\,
      CO(3) => \counter1Hz_reg[16]_i_1_n_0\,
      CO(2) => \counter1Hz_reg[16]_i_1_n_1\,
      CO(1) => \counter1Hz_reg[16]_i_1_n_2\,
      CO(0) => \counter1Hz_reg[16]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter1Hz_reg[16]_i_1_n_4\,
      O(2) => \counter1Hz_reg[16]_i_1_n_5\,
      O(1) => \counter1Hz_reg[16]_i_1_n_6\,
      O(0) => \counter1Hz_reg[16]_i_1_n_7\,
      S(3) => \counter1Hz[16]_i_2_n_0\,
      S(2) => \counter1Hz[16]_i_3_n_0\,
      S(1) => \counter1Hz[16]_i_4_n_0\,
      S(0) => \counter1Hz[16]_i_5_n_0\
    );
\counter1Hz_reg[17]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[16]_i_1_n_6\,
      Q => counter1Hz_reg(17),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[18]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[16]_i_1_n_5\,
      Q => counter1Hz_reg(18),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[19]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[16]_i_1_n_4\,
      Q => counter1Hz_reg(19),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[0]_i_2_n_6\,
      Q => counter1Hz_reg(1),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[20]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[20]_i_1_n_7\,
      Q => counter1Hz_reg(20),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[20]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter1Hz_reg[16]_i_1_n_0\,
      CO(3) => \counter1Hz_reg[20]_i_1_n_0\,
      CO(2) => \counter1Hz_reg[20]_i_1_n_1\,
      CO(1) => \counter1Hz_reg[20]_i_1_n_2\,
      CO(0) => \counter1Hz_reg[20]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter1Hz_reg[20]_i_1_n_4\,
      O(2) => \counter1Hz_reg[20]_i_1_n_5\,
      O(1) => \counter1Hz_reg[20]_i_1_n_6\,
      O(0) => \counter1Hz_reg[20]_i_1_n_7\,
      S(3) => \counter1Hz[20]_i_2_n_0\,
      S(2) => \counter1Hz[20]_i_3_n_0\,
      S(1) => \counter1Hz[20]_i_4_n_0\,
      S(0) => \counter1Hz[20]_i_5_n_0\
    );
\counter1Hz_reg[21]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[20]_i_1_n_6\,
      Q => counter1Hz_reg(21),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[22]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[20]_i_1_n_5\,
      Q => counter1Hz_reg(22),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[23]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[20]_i_1_n_4\,
      Q => counter1Hz_reg(23),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[24]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[24]_i_1_n_7\,
      Q => counter1Hz_reg(24),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[24]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter1Hz_reg[20]_i_1_n_0\,
      CO(3 downto 2) => \NLW_counter1Hz_reg[24]_i_1_CO_UNCONNECTED\(3 downto 2),
      CO(1) => \counter1Hz_reg[24]_i_1_n_2\,
      CO(0) => \counter1Hz_reg[24]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \NLW_counter1Hz_reg[24]_i_1_O_UNCONNECTED\(3),
      O(2) => \counter1Hz_reg[24]_i_1_n_5\,
      O(1) => \counter1Hz_reg[24]_i_1_n_6\,
      O(0) => \counter1Hz_reg[24]_i_1_n_7\,
      S(3) => '0',
      S(2) => \counter1Hz[24]_i_2_n_0\,
      S(1) => \counter1Hz[24]_i_3_n_0\,
      S(0) => \counter1Hz[24]_i_4_n_0\
    );
\counter1Hz_reg[25]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[24]_i_1_n_6\,
      Q => counter1Hz_reg(25),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[26]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[24]_i_1_n_5\,
      Q => counter1Hz_reg(26),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[0]_i_2_n_5\,
      Q => counter1Hz_reg(2),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[0]_i_2_n_4\,
      Q => counter1Hz_reg(3),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[4]_i_1_n_7\,
      Q => counter1Hz_reg(4),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter1Hz_reg[0]_i_2_n_0\,
      CO(3) => \counter1Hz_reg[4]_i_1_n_0\,
      CO(2) => \counter1Hz_reg[4]_i_1_n_1\,
      CO(1) => \counter1Hz_reg[4]_i_1_n_2\,
      CO(0) => \counter1Hz_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter1Hz_reg[4]_i_1_n_4\,
      O(2) => \counter1Hz_reg[4]_i_1_n_5\,
      O(1) => \counter1Hz_reg[4]_i_1_n_6\,
      O(0) => \counter1Hz_reg[4]_i_1_n_7\,
      S(3) => \counter1Hz[4]_i_2_n_0\,
      S(2) => \counter1Hz[4]_i_3_n_0\,
      S(1) => \counter1Hz[4]_i_4_n_0\,
      S(0) => \counter1Hz[4]_i_5_n_0\
    );
\counter1Hz_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[4]_i_1_n_6\,
      Q => counter1Hz_reg(5),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[4]_i_1_n_5\,
      Q => counter1Hz_reg(6),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[4]_i_1_n_4\,
      Q => counter1Hz_reg(7),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[8]_i_1_n_7\,
      Q => counter1Hz_reg(8),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter1Hz_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter1Hz_reg[4]_i_1_n_0\,
      CO(3) => \counter1Hz_reg[8]_i_1_n_0\,
      CO(2) => \counter1Hz_reg[8]_i_1_n_1\,
      CO(1) => \counter1Hz_reg[8]_i_1_n_2\,
      CO(0) => \counter1Hz_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter1Hz_reg[8]_i_1_n_4\,
      O(2) => \counter1Hz_reg[8]_i_1_n_5\,
      O(1) => \counter1Hz_reg[8]_i_1_n_6\,
      O(0) => \counter1Hz_reg[8]_i_1_n_7\,
      S(3) => \counter1Hz[8]_i_2_n_0\,
      S(2) => \counter1Hz[8]_i_3_n_0\,
      S(1) => \counter1Hz[8]_i_4_n_0\,
      S(0) => \counter1Hz[8]_i_5_n_0\
    );
\counter1Hz_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter1Hz_reg[8]_i_1_n_6\,
      Q => counter1Hz_reg(9),
      R => \counter1Hz[0]_i_1_n_0\
    );
\counter50Hz[0]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0200"
    )
        port map (
      I0 => \counter50Hz[0]_i_3_n_0\,
      I1 => counter50Hz_reg(3),
      I2 => counter50Hz_reg(5),
      I3 => \counter50Hz[0]_i_4_n_0\,
      O => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz[0]_i_3\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00000800"
    )
        port map (
      I0 => counter50Hz_reg(10),
      I1 => counter50Hz_reg(9),
      I2 => counter50Hz_reg(0),
      I3 => counter50Hz_reg(11),
      I4 => counter50Hz_reg(4),
      O => \counter50Hz[0]_i_3_n_0\
    );
\counter50Hz[0]_i_4\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000000400000"
    )
        port map (
      I0 => counter50Hz_reg(8),
      I1 => counter50Hz_reg(7),
      I2 => counter50Hz_reg(12),
      I3 => counter50Hz_reg(6),
      I4 => counter50Hz_reg(2),
      I5 => counter50Hz_reg(1),
      O => \counter50Hz[0]_i_4_n_0\
    );
\counter50Hz[0]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(3),
      O => \counter50Hz[0]_i_5_n_0\
    );
\counter50Hz[0]_i_6\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(2),
      O => \counter50Hz[0]_i_6_n_0\
    );
\counter50Hz[0]_i_7\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(1),
      O => \counter50Hz[0]_i_7_n_0\
    );
\counter50Hz[0]_i_8\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => counter50Hz_reg(0),
      O => \counter50Hz[0]_i_8_n_0\
    );
\counter50Hz[12]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(12),
      O => \counter50Hz[12]_i_2_n_0\
    );
\counter50Hz[4]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(7),
      O => \counter50Hz[4]_i_2_n_0\
    );
\counter50Hz[4]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(6),
      O => \counter50Hz[4]_i_3_n_0\
    );
\counter50Hz[4]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(5),
      O => \counter50Hz[4]_i_4_n_0\
    );
\counter50Hz[4]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(4),
      O => \counter50Hz[4]_i_5_n_0\
    );
\counter50Hz[8]_i_2\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(11),
      O => \counter50Hz[8]_i_2_n_0\
    );
\counter50Hz[8]_i_3\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(10),
      O => \counter50Hz[8]_i_3_n_0\
    );
\counter50Hz[8]_i_4\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(9),
      O => \counter50Hz[8]_i_4_n_0\
    );
\counter50Hz[8]_i_5\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => counter50Hz_reg(8),
      O => \counter50Hz[8]_i_5_n_0\
    );
\counter50Hz_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[0]_i_2_n_7\,
      Q => counter50Hz_reg(0),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[0]_i_2\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \counter50Hz_reg[0]_i_2_n_0\,
      CO(2) => \counter50Hz_reg[0]_i_2_n_1\,
      CO(1) => \counter50Hz_reg[0]_i_2_n_2\,
      CO(0) => \counter50Hz_reg[0]_i_2_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '1',
      O(3) => \counter50Hz_reg[0]_i_2_n_4\,
      O(2) => \counter50Hz_reg[0]_i_2_n_5\,
      O(1) => \counter50Hz_reg[0]_i_2_n_6\,
      O(0) => \counter50Hz_reg[0]_i_2_n_7\,
      S(3) => \counter50Hz[0]_i_5_n_0\,
      S(2) => \counter50Hz[0]_i_6_n_0\,
      S(1) => \counter50Hz[0]_i_7_n_0\,
      S(0) => \counter50Hz[0]_i_8_n_0\
    );
\counter50Hz_reg[10]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[8]_i_1_n_5\,
      Q => counter50Hz_reg(10),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[11]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[8]_i_1_n_4\,
      Q => counter50Hz_reg(11),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[12]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[12]_i_1_n_7\,
      Q => counter50Hz_reg(12),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[12]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter50Hz_reg[8]_i_1_n_0\,
      CO(3 downto 0) => \NLW_counter50Hz_reg[12]_i_1_CO_UNCONNECTED\(3 downto 0),
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3 downto 1) => \NLW_counter50Hz_reg[12]_i_1_O_UNCONNECTED\(3 downto 1),
      O(0) => \counter50Hz_reg[12]_i_1_n_7\,
      S(3) => '0',
      S(2) => '0',
      S(1) => '0',
      S(0) => \counter50Hz[12]_i_2_n_0\
    );
\counter50Hz_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[0]_i_2_n_6\,
      Q => counter50Hz_reg(1),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[0]_i_2_n_5\,
      Q => counter50Hz_reg(2),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[0]_i_2_n_4\,
      Q => counter50Hz_reg(3),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[4]_i_1_n_7\,
      Q => counter50Hz_reg(4),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[4]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter50Hz_reg[0]_i_2_n_0\,
      CO(3) => \counter50Hz_reg[4]_i_1_n_0\,
      CO(2) => \counter50Hz_reg[4]_i_1_n_1\,
      CO(1) => \counter50Hz_reg[4]_i_1_n_2\,
      CO(0) => \counter50Hz_reg[4]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter50Hz_reg[4]_i_1_n_4\,
      O(2) => \counter50Hz_reg[4]_i_1_n_5\,
      O(1) => \counter50Hz_reg[4]_i_1_n_6\,
      O(0) => \counter50Hz_reg[4]_i_1_n_7\,
      S(3) => \counter50Hz[4]_i_2_n_0\,
      S(2) => \counter50Hz[4]_i_3_n_0\,
      S(1) => \counter50Hz[4]_i_4_n_0\,
      S(0) => \counter50Hz[4]_i_5_n_0\
    );
\counter50Hz_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[4]_i_1_n_6\,
      Q => counter50Hz_reg(5),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[4]_i_1_n_5\,
      Q => counter50Hz_reg(6),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[4]_i_1_n_4\,
      Q => counter50Hz_reg(7),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[8]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[8]_i_1_n_7\,
      Q => counter50Hz_reg(8),
      R => \counter50Hz[0]_i_1_n_0\
    );
\counter50Hz_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => \counter50Hz_reg[4]_i_1_n_0\,
      CO(3) => \counter50Hz_reg[8]_i_1_n_0\,
      CO(2) => \counter50Hz_reg[8]_i_1_n_1\,
      CO(1) => \counter50Hz_reg[8]_i_1_n_2\,
      CO(0) => \counter50Hz_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => '0',
      DI(2) => '0',
      DI(1) => '0',
      DI(0) => '0',
      O(3) => \counter50Hz_reg[8]_i_1_n_4\,
      O(2) => \counter50Hz_reg[8]_i_1_n_5\,
      O(1) => \counter50Hz_reg[8]_i_1_n_6\,
      O(0) => \counter50Hz_reg[8]_i_1_n_7\,
      S(3) => \counter50Hz[8]_i_2_n_0\,
      S(2) => \counter50Hz[8]_i_3_n_0\,
      S(1) => \counter50Hz[8]_i_4_n_0\,
      S(0) => \counter50Hz[8]_i_5_n_0\
    );
\counter50Hz_reg[9]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK_IN_IBUF_BUFG,
      CE => '1',
      D => \counter50Hz_reg[8]_i_1_n_6\,
      Q => counter50Hz_reg(9),
      R => \counter50Hz[0]_i_1_n_0\
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity PWM is
  port (
    D : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 7 downto 0 );
    \timer_reg[4]\ : in STD_LOGIC_VECTOR ( 0 to 0 );
    clk_out50Hz_reg : in STD_LOGIC
  );
end PWM;

architecture STRUCTURE of PWM is
  signal \^d\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal \LED_reg[8]_i_1_n_1\ : STD_LOGIC;
  signal \LED_reg[8]_i_1_n_2\ : STD_LOGIC;
  signal \LED_reg[8]_i_1_n_3\ : STD_LOGIC;
  signal \LED_reg[8]_i_2_n_0\ : STD_LOGIC;
  signal \LED_reg[8]_i_3_n_0\ : STD_LOGIC;
  signal \LED_reg[8]_i_4_n_0\ : STD_LOGIC;
  signal \LED_reg[8]_i_5_n_0\ : STD_LOGIC;
  signal \LED_reg[8]_i_6_n_0\ : STD_LOGIC;
  signal \LED_reg[8]_i_7_n_0\ : STD_LOGIC;
  signal \LED_reg[8]_i_8_n_0\ : STD_LOGIC;
  signal \LED_reg[8]_i_9_n_0\ : STD_LOGIC;
  signal \plusOp__1\ : STD_LOGIC_VECTOR ( 7 downto 1 );
  signal \register_counter[0]_i_1_n_0\ : STD_LOGIC;
  signal \register_counter[7]_i_2_n_0\ : STD_LOGIC;
  signal \register_counter_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal \NLW_LED_reg[8]_i_1_O_UNCONNECTED\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \register_counter[0]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \register_counter[1]_i_1\ : label is "soft_lutpair6";
  attribute SOFT_HLUTNM of \register_counter[2]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \register_counter[3]_i_1\ : label is "soft_lutpair5";
  attribute SOFT_HLUTNM of \register_counter[4]_i_1\ : label is "soft_lutpair3";
  attribute SOFT_HLUTNM of \register_counter[6]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \register_counter[7]_i_1\ : label is "soft_lutpair4";
  attribute SOFT_HLUTNM of \register_counter[7]_i_2\ : label is "soft_lutpair3";
begin
  D(1 downto 0) <= \^d\(1 downto 0);
\LED_reg[15]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"2"
    )
        port map (
      I0 => \^d\(0),
      I1 => \timer_reg[4]\(0),
      O => \^d\(1)
    );
\LED_reg[8]_i_1\: unisim.vcomponents.CARRY4
     port map (
      CI => '0',
      CO(3) => \^d\(0),
      CO(2) => \LED_reg[8]_i_1_n_1\,
      CO(1) => \LED_reg[8]_i_1_n_2\,
      CO(0) => \LED_reg[8]_i_1_n_3\,
      CYINIT => '0',
      DI(3) => \LED_reg[8]_i_2_n_0\,
      DI(2) => \LED_reg[8]_i_3_n_0\,
      DI(1) => \LED_reg[8]_i_4_n_0\,
      DI(0) => \LED_reg[8]_i_5_n_0\,
      O(3 downto 0) => \NLW_LED_reg[8]_i_1_O_UNCONNECTED\(3 downto 0),
      S(3) => \LED_reg[8]_i_6_n_0\,
      S(2) => \LED_reg[8]_i_7_n_0\,
      S(1) => \LED_reg[8]_i_8_n_0\,
      S(0) => \LED_reg[8]_i_9_n_0\
    );
\LED_reg[8]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"22B2"
    )
        port map (
      I0 => Q(7),
      I1 => \register_counter_reg__0\(7),
      I2 => Q(6),
      I3 => \register_counter_reg__0\(6),
      O => \LED_reg[8]_i_2_n_0\
    );
\LED_reg[8]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7150"
    )
        port map (
      I0 => \register_counter_reg__0\(5),
      I1 => \register_counter_reg__0\(4),
      I2 => Q(5),
      I3 => Q(4),
      O => \LED_reg[8]_i_3_n_0\
    );
\LED_reg[8]_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7150"
    )
        port map (
      I0 => \register_counter_reg__0\(3),
      I1 => \register_counter_reg__0\(2),
      I2 => Q(3),
      I3 => Q(2),
      O => \LED_reg[8]_i_4_n_0\
    );
\LED_reg[8]_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7510"
    )
        port map (
      I0 => \register_counter_reg__0\(1),
      I1 => \register_counter_reg__0\(0),
      I2 => Q(0),
      I3 => Q(1),
      O => \LED_reg[8]_i_5_n_0\
    );
\LED_reg[8]_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \register_counter_reg__0\(6),
      I1 => Q(6),
      I2 => \register_counter_reg__0\(7),
      I3 => Q(7),
      O => \LED_reg[8]_i_6_n_0\
    );
\LED_reg[8]_i_7\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \register_counter_reg__0\(4),
      I1 => Q(4),
      I2 => \register_counter_reg__0\(5),
      I3 => Q(5),
      O => \LED_reg[8]_i_7_n_0\
    );
\LED_reg[8]_i_8\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"9009"
    )
        port map (
      I0 => \register_counter_reg__0\(2),
      I1 => Q(2),
      I2 => \register_counter_reg__0\(3),
      I3 => Q(3),
      O => \LED_reg[8]_i_8_n_0\
    );
\LED_reg[8]_i_9\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8241"
    )
        port map (
      I0 => Q(0),
      I1 => Q(1),
      I2 => \register_counter_reg__0\(1),
      I3 => \register_counter_reg__0\(0),
      O => \LED_reg[8]_i_9_n_0\
    );
\register_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \register_counter_reg__0\(0),
      O => \register_counter[0]_i_1_n_0\
    );
\register_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \register_counter_reg__0\(0),
      I1 => \register_counter_reg__0\(1),
      O => \plusOp__1\(1)
    );
\register_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \register_counter_reg__0\(0),
      I1 => \register_counter_reg__0\(1),
      I2 => \register_counter_reg__0\(2),
      O => \plusOp__1\(2)
    );
\register_counter[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \register_counter_reg__0\(2),
      I1 => \register_counter_reg__0\(1),
      I2 => \register_counter_reg__0\(0),
      I3 => \register_counter_reg__0\(3),
      O => \plusOp__1\(3)
    );
\register_counter[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \register_counter_reg__0\(3),
      I1 => \register_counter_reg__0\(0),
      I2 => \register_counter_reg__0\(1),
      I3 => \register_counter_reg__0\(2),
      I4 => \register_counter_reg__0\(4),
      O => \plusOp__1\(4)
    );
\register_counter[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \register_counter_reg__0\(4),
      I1 => \register_counter_reg__0\(2),
      I2 => \register_counter_reg__0\(1),
      I3 => \register_counter_reg__0\(0),
      I4 => \register_counter_reg__0\(3),
      I5 => \register_counter_reg__0\(5),
      O => \plusOp__1\(5)
    );
\register_counter[6]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \register_counter[7]_i_2_n_0\,
      I1 => \register_counter_reg__0\(4),
      I2 => \register_counter_reg__0\(5),
      I3 => \register_counter_reg__0\(6),
      O => \plusOp__1\(6)
    );
\register_counter[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \register_counter[7]_i_2_n_0\,
      I1 => \register_counter_reg__0\(6),
      I2 => \register_counter_reg__0\(5),
      I3 => \register_counter_reg__0\(4),
      I4 => \register_counter_reg__0\(7),
      O => \plusOp__1\(7)
    );
\register_counter[7]_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"8000"
    )
        port map (
      I0 => \register_counter_reg__0\(2),
      I1 => \register_counter_reg__0\(1),
      I2 => \register_counter_reg__0\(0),
      I3 => \register_counter_reg__0\(3),
      O => \register_counter[7]_i_2_n_0\
    );
\register_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out50Hz_reg,
      CE => '1',
      D => \register_counter[0]_i_1_n_0\,
      Q => \register_counter_reg__0\(0),
      R => '0'
    );
\register_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out50Hz_reg,
      CE => '1',
      D => \plusOp__1\(1),
      Q => \register_counter_reg__0\(1),
      R => '0'
    );
\register_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out50Hz_reg,
      CE => '1',
      D => \plusOp__1\(2),
      Q => \register_counter_reg__0\(2),
      R => '0'
    );
\register_counter_reg[3]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out50Hz_reg,
      CE => '1',
      D => \plusOp__1\(3),
      Q => \register_counter_reg__0\(3),
      R => '0'
    );
\register_counter_reg[4]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out50Hz_reg,
      CE => '1',
      D => \plusOp__1\(4),
      Q => \register_counter_reg__0\(4),
      R => '0'
    );
\register_counter_reg[5]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out50Hz_reg,
      CE => '1',
      D => \plusOp__1\(5),
      Q => \register_counter_reg__0\(5),
      R => '0'
    );
\register_counter_reg[6]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out50Hz_reg,
      CE => '1',
      D => \plusOp__1\(6),
      Q => \register_counter_reg__0\(6),
      R => '0'
    );
\register_counter_reg[7]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk_out50Hz_reg,
      CE => '1',
      D => \plusOp__1\(7),
      Q => \register_counter_reg__0\(7),
      R => '0'
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Seven_seg_driver is
  port (
    SEG_OBUF : out STD_LOGIC_VECTOR ( 6 downto 0 );
    AN_OBUF : out STD_LOGIC_VECTOR ( 1 downto 0 );
    Q : in STD_LOGIC_VECTOR ( 4 downto 0 );
    DEC_OUT_1 : in STD_LOGIC_VECTOR ( 2 downto 0 );
    DEC_OUT_2 : in STD_LOGIC_VECTOR ( 0 to 0 );
    CLK : in STD_LOGIC
  );
end Seven_seg_driver;

architecture STRUCTURE of Seven_seg_driver is
  signal \^an_obuf\ : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal Disp_counter : STD_LOGIC_VECTOR ( 2 downto 0 );
  signal \SEG_OBUF[5]_inst_i_5_n_0\ : STD_LOGIC;
  signal plusOp : STD_LOGIC_VECTOR ( 2 downto 0 );
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \AN_OBUF[0]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \AN_OBUF[1]_inst_i_1\ : label is "soft_lutpair1";
  attribute SOFT_HLUTNM of \Disp_counter[0]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Disp_counter[1]_i_1\ : label is "soft_lutpair2";
  attribute SOFT_HLUTNM of \Disp_counter[2]_i_1\ : label is "soft_lutpair0";
  attribute SOFT_HLUTNM of \SEG_OBUF[5]_inst_i_5\ : label is "soft_lutpair0";
begin
  AN_OBUF(1 downto 0) <= \^an_obuf\(1 downto 0);
\AN_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"FE"
    )
        port map (
      I0 => Disp_counter(1),
      I1 => Disp_counter(2),
      I2 => Disp_counter(0),
      O => \^an_obuf\(0)
    );
\AN_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"EF"
    )
        port map (
      I0 => Disp_counter(1),
      I1 => Disp_counter(2),
      I2 => Disp_counter(0),
      O => \^an_obuf\(1)
    );
\Disp_counter[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => Disp_counter(0),
      O => plusOp(0)
    );
\Disp_counter[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => Disp_counter(0),
      I1 => Disp_counter(1),
      O => plusOp(1)
    );
\Disp_counter[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => Disp_counter(0),
      I1 => Disp_counter(1),
      I2 => Disp_counter(2),
      O => plusOp(2)
    );
\Disp_counter_reg[0]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(0),
      Q => Disp_counter(0),
      R => '0'
    );
\Disp_counter_reg[1]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(1),
      Q => Disp_counter(1),
      R => '0'
    );
\Disp_counter_reg[2]\: unisim.vcomponents.FDRE
    generic map(
      INIT => '0'
    )
        port map (
      C => CLK,
      CE => '1',
      D => plusOp(2),
      Q => Disp_counter(2),
      R => '0'
    );
\SEG_OBUF[0]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AAAEAAFAAABAAABE"
    )
        port map (
      I0 => \SEG_OBUF[5]_inst_i_5_n_0\,
      I1 => Q(0),
      I2 => DEC_OUT_1(1),
      I3 => \^an_obuf\(0),
      I4 => DEC_OUT_1(0),
      I5 => DEC_OUT_1(2),
      O => SEG_OBUF(0)
    );
\SEG_OBUF[1]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000000094902520"
    )
        port map (
      I0 => Q(1),
      I1 => Q(3),
      I2 => Q(2),
      I3 => Q(4),
      I4 => Q(0),
      I5 => \^an_obuf\(0),
      O => SEG_OBUF(1)
    );
\SEG_OBUF[2]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"0000020000004A18"
    )
        port map (
      I0 => Q(3),
      I1 => Q(2),
      I2 => Q(1),
      I3 => Q(4),
      I4 => \^an_obuf\(0),
      I5 => Q(0),
      O => SEG_OBUF(2)
    );
\SEG_OBUF[3]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEABABAAAEAAABAE"
    )
        port map (
      I0 => \SEG_OBUF[5]_inst_i_5_n_0\,
      I1 => DEC_OUT_1(1),
      I2 => \^an_obuf\(0),
      I3 => Q(0),
      I4 => DEC_OUT_1(0),
      I5 => DEC_OUT_1(2),
      O => SEG_OBUF(3)
    );
\SEG_OBUF[4]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F0F1F0F0F0FFF0F2"
    )
        port map (
      I0 => DEC_OUT_1(1),
      I1 => DEC_OUT_1(0),
      I2 => \SEG_OBUF[5]_inst_i_5_n_0\,
      I3 => \^an_obuf\(0),
      I4 => Q(0),
      I5 => DEC_OUT_1(2),
      O => SEG_OBUF(4)
    );
\SEG_OBUF[5]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"FFFFFFFF00004B42"
    )
        port map (
      I0 => DEC_OUT_1(0),
      I1 => DEC_OUT_1(1),
      I2 => DEC_OUT_1(2),
      I3 => Q(0),
      I4 => \^an_obuf\(0),
      I5 => \SEG_OBUF[5]_inst_i_5_n_0\,
      O => SEG_OBUF(5)
    );
\SEG_OBUF[5]_inst_i_5\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"0008"
    )
        port map (
      I0 => DEC_OUT_2(0),
      I1 => Disp_counter(0),
      I2 => Disp_counter(2),
      I3 => Disp_counter(1),
      O => \SEG_OBUF[5]_inst_i_5_n_0\
    );
\SEG_OBUF[6]_inst_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"AEABBEABAEAAAEAB"
    )
        port map (
      I0 => \^an_obuf\(0),
      I1 => Q(3),
      I2 => Q(2),
      I3 => Q(1),
      I4 => Q(4),
      I5 => Q(0),
      O => SEG_OBUF(6)
    );
end STRUCTURE;
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
entity Top_countdown is
  port (
    CLK_IN : in STD_LOGIC;
    BTNC : in STD_LOGIC;
    LED : out STD_LOGIC_VECTOR ( 15 downto 0 );
    AN : out STD_LOGIC_VECTOR ( 7 downto 0 );
    SEG : out STD_LOGIC_VECTOR ( 7 downto 0 )
  );
  attribute NotValidForBitStream : boolean;
  attribute NotValidForBitStream of Top_countdown : entity is true;
end Top_countdown;

architecture STRUCTURE of Top_countdown is
  signal AN_OBUF : STD_LOGIC_VECTOR ( 1 downto 0 );
  signal BTNC_IBUF : STD_LOGIC;
  signal CLK_IN_IBUF : STD_LOGIC;
  signal CLK_IN_IBUF_BUFG : STD_LOGIC;
  signal DEC_OUT_1 : STD_LOGIC_VECTOR ( 3 downto 1 );
  signal DEC_OUT_2 : STD_LOGIC_VECTOR ( 0 to 0 );
  signal LED_OBUF : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal SEG_OBUF : STD_LOGIC_VECTOR ( 6 downto 0 );
  signal clk : STD_LOGIC;
  signal divider_map_n_1 : STD_LOGIC;
  signal divider_map_n_2 : STD_LOGIC;
  signal g0_b10_n_0 : STD_LOGIC;
  signal g0_b11_n_0 : STD_LOGIC;
  signal g0_b12_n_0 : STD_LOGIC;
  signal g0_b13_n_0 : STD_LOGIC;
  signal g0_b14_n_0 : STD_LOGIC;
  signal g0_b15_n_0 : STD_LOGIC;
  signal g0_b8_n_0 : STD_LOGIC;
  signal g0_b9_n_0 : STD_LOGIC;
  signal output : STD_LOGIC;
  signal \plusOp__0\ : STD_LOGIC_VECTOR ( 5 downto 0 );
  signal \pwm_level[2]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_level[4]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_level[6]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_level[6]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_level[7]_i_1_n_0\ : STD_LOGIC;
  signal \pwm_level[7]_i_2_n_0\ : STD_LOGIC;
  signal \pwm_level[7]_i_3_n_0\ : STD_LOGIC;
  signal \pwm_level_reg__0\ : STD_LOGIC_VECTOR ( 7 downto 0 );
  signal pwm_map_n_0 : STD_LOGIC;
  signal sel : STD_LOGIC;
  signal \timer[0]_i_1_n_0\ : STD_LOGIC;
  signal \timer[1]_i_1_n_0\ : STD_LOGIC;
  signal \timer[2]_i_1_n_0\ : STD_LOGIC;
  signal \timer[3]_i_1_n_0\ : STD_LOGIC;
  signal \timer[4]_i_2_n_0\ : STD_LOGIC;
  signal \timer_reg__0\ : STD_LOGIC_VECTOR ( 3 downto 0 );
  signal \timer_reg__1\ : STD_LOGIC_VECTOR ( 4 to 4 );
  attribute XILINX_LEGACY_PRIM : string;
  attribute XILINX_LEGACY_PRIM of \LED_reg[10]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \LED_reg[11]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \LED_reg[12]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \LED_reg[13]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \LED_reg[14]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \LED_reg[15]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \LED_reg[8]\ : label is "LD";
  attribute XILINX_LEGACY_PRIM of \LED_reg[9]\ : label is "LD";
  attribute SOFT_HLUTNM : string;
  attribute SOFT_HLUTNM of \SEG_OBUF[5]_inst_i_2\ : label is "soft_lutpair12";
  attribute SOFT_HLUTNM of \SEG_OBUF[5]_inst_i_3\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of \SEG_OBUF[5]_inst_i_4\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \SEG_OBUF[5]_inst_i_6\ : label is "soft_lutpair13";
  attribute SOFT_HLUTNM of g0_b10 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of g0_b11 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of g0_b12 : label is "soft_lutpair9";
  attribute SOFT_HLUTNM of g0_b13 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of g0_b14 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of g0_b15 : label is "soft_lutpair10";
  attribute SOFT_HLUTNM of g0_b8 : label is "soft_lutpair7";
  attribute SOFT_HLUTNM of g0_b9 : label is "soft_lutpair8";
  attribute SOFT_HLUTNM of \pwm_level[1]_i_1\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \pwm_level[2]_i_1\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \pwm_level[3]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \pwm_level[4]_i_1\ : label is "soft_lutpair11";
  attribute SOFT_HLUTNM of \pwm_level[6]_i_2\ : label is "soft_lutpair17";
  attribute SOFT_HLUTNM of \pwm_level[7]_i_3\ : label is "soft_lutpair14";
  attribute SOFT_HLUTNM of \timer[1]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \timer[2]_i_1\ : label is "soft_lutpair16";
  attribute SOFT_HLUTNM of \timer[3]_i_1\ : label is "soft_lutpair15";
  attribute SOFT_HLUTNM of \timer[4]_i_2\ : label is "soft_lutpair12";
begin
\AN_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => AN_OBUF(0),
      O => AN(0)
    );
\AN_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => AN_OBUF(1),
      O => AN(1)
    );
\AN_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => AN(2)
    );
\AN_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => AN(3)
    );
\AN_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => AN(4)
    );
\AN_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => AN(5)
    );
\AN_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => AN(6)
    );
\AN_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => AN(7)
    );
BTNC_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => BTNC,
      O => BTNC_IBUF
    );
CLK_IN_IBUF_BUFG_inst: unisim.vcomponents.BUFG
     port map (
      I => CLK_IN_IBUF,
      O => CLK_IN_IBUF_BUFG
    );
CLK_IN_IBUF_inst: unisim.vcomponents.IBUF
     port map (
      I => CLK_IN,
      O => CLK_IN_IBUF
    );
\LED_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(0),
      O => LED(0)
    );
\LED_OBUF[10]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(5),
      O => LED(10)
    );
\LED_OBUF[11]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(4),
      O => LED(11)
    );
\LED_OBUF[12]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(3),
      O => LED(12)
    );
\LED_OBUF[13]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(2),
      O => LED(13)
    );
\LED_OBUF[14]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(1),
      O => LED(14)
    );
\LED_OBUF[15]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(0),
      O => LED(15)
    );
\LED_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(1),
      O => LED(1)
    );
\LED_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(2),
      O => LED(2)
    );
\LED_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(3),
      O => LED(3)
    );
\LED_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(4),
      O => LED(4)
    );
\LED_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(5),
      O => LED(5)
    );
\LED_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(6),
      O => LED(6)
    );
\LED_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(7),
      O => LED(7)
    );
\LED_OBUF[8]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(7),
      O => LED(8)
    );
\LED_OBUF[9]_inst\: unisim.vcomponents.OBUF
     port map (
      I => LED_OBUF(6),
      O => LED(9)
    );
\LED_reg[10]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => pwm_map_n_0,
      G => g0_b10_n_0,
      GE => '1',
      Q => LED_OBUF(5)
    );
\LED_reg[11]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => pwm_map_n_0,
      G => g0_b11_n_0,
      GE => '1',
      Q => LED_OBUF(4)
    );
\LED_reg[12]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => pwm_map_n_0,
      G => g0_b12_n_0,
      GE => '1',
      Q => LED_OBUF(3)
    );
\LED_reg[13]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => pwm_map_n_0,
      G => g0_b13_n_0,
      GE => '1',
      Q => LED_OBUF(2)
    );
\LED_reg[14]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => pwm_map_n_0,
      G => g0_b14_n_0,
      GE => '1',
      Q => LED_OBUF(1)
    );
\LED_reg[15]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => pwm_map_n_0,
      G => g0_b15_n_0,
      GE => '1',
      Q => LED_OBUF(0)
    );
\LED_reg[8]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => output,
      G => g0_b8_n_0,
      GE => '1',
      Q => LED_OBUF(7)
    );
\LED_reg[9]\: unisim.vcomponents.LDCE
    generic map(
      INIT => '0'
    )
        port map (
      CLR => '0',
      D => pwm_map_n_0,
      G => g0_b9_n_0,
      GE => '1',
      Q => LED_OBUF(6)
    );
\SEG_OBUF[0]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEG_OBUF(0),
      O => SEG(0)
    );
\SEG_OBUF[1]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEG_OBUF(1),
      O => SEG(1)
    );
\SEG_OBUF[2]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEG_OBUF(2),
      O => SEG(2)
    );
\SEG_OBUF[3]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEG_OBUF(3),
      O => SEG(3)
    );
\SEG_OBUF[4]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEG_OBUF(4),
      O => SEG(4)
    );
\SEG_OBUF[5]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEG_OBUF(5),
      O => SEG(5)
    );
\SEG_OBUF[5]_inst_i_2\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"05EA"
    )
        port map (
      I0 => \timer_reg__1\(4),
      I1 => \timer_reg__0\(2),
      I2 => \timer_reg__0\(3),
      I3 => \timer_reg__0\(1),
      O => DEC_OUT_1(1)
    );
\SEG_OBUF[5]_inst_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"C3C4"
    )
        port map (
      I0 => \timer_reg__0\(3),
      I1 => \timer_reg__0\(2),
      I2 => \timer_reg__0\(1),
      I3 => \timer_reg__1\(4),
      O => DEC_OUT_1(2)
    );
\SEG_OBUF[5]_inst_i_4\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"5602"
    )
        port map (
      I0 => \timer_reg__0\(3),
      I1 => \timer_reg__0\(2),
      I2 => \timer_reg__0\(1),
      I3 => \timer_reg__1\(4),
      O => DEC_OUT_1(3)
    );
\SEG_OBUF[5]_inst_i_6\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FFA8"
    )
        port map (
      I0 => \timer_reg__0\(3),
      I1 => \timer_reg__0\(2),
      I2 => \timer_reg__0\(1),
      I3 => \timer_reg__1\(4),
      O => DEC_OUT_2(0)
    );
\SEG_OBUF[6]_inst\: unisim.vcomponents.OBUF
     port map (
      I => SEG_OBUF(6),
      O => SEG(6)
    );
\SEG_OBUF[7]_inst\: unisim.vcomponents.OBUF
     port map (
      I => '1',
      O => SEG(7)
    );
Seven_seg_map: entity work.Seven_seg_driver
     port map (
      AN_OBUF(1 downto 0) => AN_OBUF(1 downto 0),
      CLK => divider_map_n_2,
      DEC_OUT_1(2 downto 0) => DEC_OUT_1(3 downto 1),
      DEC_OUT_2(0) => DEC_OUT_2(0),
      Q(4) => \timer_reg__1\(4),
      Q(3 downto 0) => \timer_reg__0\(3 downto 0),
      SEG_OBUF(6 downto 0) => SEG_OBUF(6 downto 0)
    );
divider_map: entity work.Divider
     port map (
      CLK => clk,
      CLK_IN_IBUF_BUFG => CLK_IN_IBUF_BUFG,
      \pwm_level_reg[0]\ => divider_map_n_1,
      \register_counter_reg[7]\ => divider_map_n_2
    );
g0_b10: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00011FFF"
    )
        port map (
      I0 => \timer_reg__0\(0),
      I1 => \timer_reg__0\(1),
      I2 => \timer_reg__0\(2),
      I3 => \timer_reg__0\(3),
      I4 => \timer_reg__1\(4),
      O => g0_b10_n_0
    );
g0_b11: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000107FF"
    )
        port map (
      I0 => \timer_reg__0\(0),
      I1 => \timer_reg__0\(1),
      I2 => \timer_reg__0\(2),
      I3 => \timer_reg__0\(3),
      I4 => \timer_reg__1\(4),
      O => g0_b11_n_0
    );
g0_b12: unisim.vcomponents.LUT5
    generic map(
      INIT => X"000101FF"
    )
        port map (
      I0 => \timer_reg__0\(0),
      I1 => \timer_reg__0\(1),
      I2 => \timer_reg__0\(2),
      I3 => \timer_reg__0\(3),
      I4 => \timer_reg__1\(4),
      O => g0_b12_n_0
    );
g0_b13: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001007F"
    )
        port map (
      I0 => \timer_reg__0\(0),
      I1 => \timer_reg__0\(1),
      I2 => \timer_reg__0\(2),
      I3 => \timer_reg__0\(3),
      I4 => \timer_reg__1\(4),
      O => g0_b13_n_0
    );
g0_b14: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001001F"
    )
        port map (
      I0 => \timer_reg__0\(0),
      I1 => \timer_reg__0\(1),
      I2 => \timer_reg__0\(2),
      I3 => \timer_reg__0\(3),
      I4 => \timer_reg__1\(4),
      O => g0_b14_n_0
    );
g0_b15: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00010007"
    )
        port map (
      I0 => \timer_reg__0\(0),
      I1 => \timer_reg__0\(1),
      I2 => \timer_reg__0\(2),
      I3 => \timer_reg__0\(3),
      I4 => \timer_reg__1\(4),
      O => g0_b15_n_0
    );
g0_b8: unisim.vcomponents.LUT5
    generic map(
      INIT => X"0001FFFF"
    )
        port map (
      I0 => \timer_reg__0\(0),
      I1 => \timer_reg__0\(1),
      I2 => \timer_reg__0\(2),
      I3 => \timer_reg__0\(3),
      I4 => \timer_reg__1\(4),
      O => g0_b8_n_0
    );
g0_b9: unisim.vcomponents.LUT5
    generic map(
      INIT => X"00017FFF"
    )
        port map (
      I0 => \timer_reg__0\(0),
      I1 => \timer_reg__0\(1),
      I2 => \timer_reg__0\(2),
      I3 => \timer_reg__0\(3),
      I4 => \timer_reg__1\(4),
      O => g0_b9_n_0
    );
\pwm_level[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \pwm_level_reg__0\(0),
      O => \plusOp__0\(0)
    );
\pwm_level[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"6"
    )
        port map (
      I0 => \pwm_level_reg__0\(0),
      I1 => \pwm_level_reg__0\(1),
      O => \plusOp__0\(1)
    );
\pwm_level[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"78"
    )
        port map (
      I0 => \pwm_level_reg__0\(1),
      I1 => \pwm_level_reg__0\(0),
      I2 => \pwm_level_reg__0\(2),
      O => \pwm_level[2]_i_1_n_0\
    );
\pwm_level[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7F80"
    )
        port map (
      I0 => \pwm_level_reg__0\(0),
      I1 => \pwm_level_reg__0\(1),
      I2 => \pwm_level_reg__0\(2),
      I3 => \pwm_level_reg__0\(3),
      O => \plusOp__0\(3)
    );
\pwm_level[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"7FFF8000"
    )
        port map (
      I0 => \pwm_level_reg__0\(0),
      I1 => \pwm_level_reg__0\(1),
      I2 => \pwm_level_reg__0\(3),
      I3 => \pwm_level_reg__0\(2),
      I4 => \pwm_level_reg__0\(4),
      O => \pwm_level[4]_i_1_n_0\
    );
\pwm_level[5]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"7FFFFFFF80000000"
    )
        port map (
      I0 => \pwm_level_reg__0\(2),
      I1 => \pwm_level_reg__0\(3),
      I2 => \pwm_level_reg__0\(1),
      I3 => \pwm_level_reg__0\(0),
      I4 => \pwm_level_reg__0\(4),
      I5 => \pwm_level_reg__0\(5),
      O => \plusOp__0\(5)
    );
\pwm_level[6]_i_1\: unisim.vcomponents.LUT6
    generic map(
      INIT => X"F7FFFFFF08000000"
    )
        port map (
      I0 => \pwm_level_reg__0\(2),
      I1 => \pwm_level_reg__0\(3),
      I2 => \pwm_level[6]_i_2_n_0\,
      I3 => \pwm_level_reg__0\(5),
      I4 => \pwm_level_reg__0\(4),
      I5 => \pwm_level_reg__0\(6),
      O => \pwm_level[6]_i_1_n_0\
    );
\pwm_level[6]_i_2\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"7"
    )
        port map (
      I0 => \pwm_level_reg__0\(0),
      I1 => \pwm_level_reg__0\(1),
      O => \pwm_level[6]_i_2_n_0\
    );
\pwm_level[7]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7FFFFF"
    )
        port map (
      I0 => \pwm_level_reg__0\(6),
      I1 => \pwm_level_reg__0\(4),
      I2 => \pwm_level_reg__0\(5),
      I3 => \pwm_level[7]_i_3_n_0\,
      I4 => \pwm_level_reg__0\(7),
      O => \pwm_level[7]_i_1_n_0\
    );
\pwm_level[7]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FF7F0080"
    )
        port map (
      I0 => \pwm_level_reg__0\(6),
      I1 => \pwm_level_reg__0\(4),
      I2 => \pwm_level_reg__0\(5),
      I3 => \pwm_level[7]_i_3_n_0\,
      I4 => \pwm_level_reg__0\(7),
      O => \pwm_level[7]_i_2_n_0\
    );
\pwm_level[7]_i_3\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"7FFF"
    )
        port map (
      I0 => \pwm_level_reg__0\(2),
      I1 => \pwm_level_reg__0\(3),
      I2 => \pwm_level_reg__0\(1),
      I3 => \pwm_level_reg__0\(0),
      O => \pwm_level[7]_i_3_n_0\
    );
\pwm_level_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => divider_map_n_1,
      CE => \pwm_level[7]_i_1_n_0\,
      CLR => BTNC_IBUF,
      D => \plusOp__0\(0),
      Q => \pwm_level_reg__0\(0)
    );
\pwm_level_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => divider_map_n_1,
      CE => \pwm_level[7]_i_1_n_0\,
      CLR => BTNC_IBUF,
      D => \plusOp__0\(1),
      Q => \pwm_level_reg__0\(1)
    );
\pwm_level_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => divider_map_n_1,
      CE => \pwm_level[7]_i_1_n_0\,
      CLR => BTNC_IBUF,
      D => \pwm_level[2]_i_1_n_0\,
      Q => \pwm_level_reg__0\(2)
    );
\pwm_level_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => divider_map_n_1,
      CE => \pwm_level[7]_i_1_n_0\,
      CLR => BTNC_IBUF,
      D => \plusOp__0\(3),
      Q => \pwm_level_reg__0\(3)
    );
\pwm_level_reg[4]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => divider_map_n_1,
      CE => \pwm_level[7]_i_1_n_0\,
      CLR => BTNC_IBUF,
      D => \pwm_level[4]_i_1_n_0\,
      Q => \pwm_level_reg__0\(4)
    );
\pwm_level_reg[5]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => divider_map_n_1,
      CE => \pwm_level[7]_i_1_n_0\,
      CLR => BTNC_IBUF,
      D => \plusOp__0\(5),
      Q => \pwm_level_reg__0\(5)
    );
\pwm_level_reg[6]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => divider_map_n_1,
      CE => \pwm_level[7]_i_1_n_0\,
      CLR => BTNC_IBUF,
      D => \pwm_level[6]_i_1_n_0\,
      Q => \pwm_level_reg__0\(6)
    );
\pwm_level_reg[7]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => divider_map_n_1,
      CE => \pwm_level[7]_i_1_n_0\,
      CLR => BTNC_IBUF,
      D => \pwm_level[7]_i_2_n_0\,
      Q => \pwm_level_reg__0\(7)
    );
pwm_map: entity work.PWM
     port map (
      D(1) => pwm_map_n_0,
      D(0) => output,
      Q(7 downto 0) => \pwm_level_reg__0\(7 downto 0),
      clk_out50Hz_reg => divider_map_n_2,
      \timer_reg[4]\(0) => \timer_reg__1\(4)
    );
\timer[0]_i_1\: unisim.vcomponents.LUT1
    generic map(
      INIT => X"1"
    )
        port map (
      I0 => \timer_reg__0\(0),
      O => \timer[0]_i_1_n_0\
    );
\timer[1]_i_1\: unisim.vcomponents.LUT2
    generic map(
      INIT => X"9"
    )
        port map (
      I0 => \timer_reg__0\(0),
      I1 => \timer_reg__0\(1),
      O => \timer[1]_i_1_n_0\
    );
\timer[2]_i_1\: unisim.vcomponents.LUT3
    generic map(
      INIT => X"E1"
    )
        port map (
      I0 => \timer_reg__0\(1),
      I1 => \timer_reg__0\(0),
      I2 => \timer_reg__0\(2),
      O => \timer[2]_i_1_n_0\
    );
\timer[3]_i_1\: unisim.vcomponents.LUT4
    generic map(
      INIT => X"FE01"
    )
        port map (
      I0 => \timer_reg__0\(0),
      I1 => \timer_reg__0\(2),
      I2 => \timer_reg__0\(1),
      I3 => \timer_reg__0\(3),
      O => \timer[3]_i_1_n_0\
    );
\timer[4]_i_1\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFFFFFE"
    )
        port map (
      I0 => \timer_reg__0\(3),
      I1 => \timer_reg__1\(4),
      I2 => \timer_reg__0\(0),
      I3 => \timer_reg__0\(2),
      I4 => \timer_reg__0\(1),
      O => sel
    );
\timer[4]_i_2\: unisim.vcomponents.LUT5
    generic map(
      INIT => X"FFFE0001"
    )
        port map (
      I0 => \timer_reg__0\(3),
      I1 => \timer_reg__0\(1),
      I2 => \timer_reg__0\(2),
      I3 => \timer_reg__0\(0),
      I4 => \timer_reg__1\(4),
      O => \timer[4]_i_2_n_0\
    );
\timer_reg[0]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      CLR => BTNC_IBUF,
      D => \timer[0]_i_1_n_0\,
      Q => \timer_reg__0\(0)
    );
\timer_reg[1]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      CLR => BTNC_IBUF,
      D => \timer[1]_i_1_n_0\,
      Q => \timer_reg__0\(1)
    );
\timer_reg[2]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      CLR => BTNC_IBUF,
      D => \timer[2]_i_1_n_0\,
      Q => \timer_reg__0\(2)
    );
\timer_reg[3]\: unisim.vcomponents.FDCE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      CLR => BTNC_IBUF,
      D => \timer[3]_i_1_n_0\,
      Q => \timer_reg__0\(3)
    );
\timer_reg[4]\: unisim.vcomponents.FDPE
    generic map(
      INIT => '0'
    )
        port map (
      C => clk,
      CE => sel,
      D => \timer[4]_i_2_n_0\,
      PRE => BTNC_IBUF,
      Q => \timer_reg__1\(4)
    );
end STRUCTURE;
