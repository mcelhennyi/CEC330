----------------------------------------------------------------------------------
----------------------------------------------------------------------------
-- Author:  Albert Fazakas adapted from Sam Bobrowicz and Mihaita Nagy
--          Copyright 2014 Digilent, Inc.
----------------------------------------------------------------------------

-- Design Name:    Nexys4 DDR User Demo
-- Module Name:    Nexys4DdrUserDemo - Behavioral 
-- Project Name: 
-- Target Devices: Nexys4 DDR Development Board, containing a XC7a100t-1 csg324 device
-- Tool versions: 
-- Description: 
-- This module represents the top - level design of the Nexys4 DDR User Demo.
-- The project connects to the VGA display in a 1280*1024 resolution and displays various
-- items on the screen:
--    - a Digilent / Analog Devices logo
--
--    - a mouse cursor, if an Usb mouse is connected to the board when the project is started
--
--    - the audio signal from the onboard ADMP421 Omnidirectional Microphone

--    - a small square representing the X and Y acceleration data from the ADXL362 onboard Accelerometer.
--      The square moves according the Nexys4 board position. Note that the X and Y axes 
--      on the board are exchanged due to the accelerometer layout on the Nexys4 board.
--      The accelerometer display also displays the acceleration magnitude, calculated as
--      SQRT( X^2 + Y^2 +Z^2), where X, Y and Z represent the acceleration value on the respective axes
--
--    - The FPGA temperature, the onboard ADT7420 temperature sensor temperature value and the accelerometer
--      temperature value
--
--    - The value of the R, G and B components sent to the RGB Leds LD16 and LD17
--
-- Other features:
--    - The 16 Switches (SW0..SW15) are connected to LD0..LD15 except when audio recording is done
--
--    - Pressing BTNL, BTNC and BTNR will toggle between Red, Green and Blue colors on LD16 and LD17
--      Color sweeping returns when BTND is pressed. BTND also togles between LD16, LD17, none or both
--
--    - Pressing BTNU will start audio recording for about 5S, then the audio data will be played back
--      on the Audio output. While recording, LD15..LD0 will show a progressbar moving to left, while
--      playing back, LD15..LD0 will show a progressbar moving to right
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Top is
    port(
            CLK_IN         : in  std_logic;
            RESETN         : in  std_logic;
            --
            LED            : out  STD_LOGIC_VECTOR (15 downto 0);
            -- SPI Interface signals for the ADXL362 accelerometer
            sclk           : out STD_LOGIC;
            mosi           : out STD_LOGIC;
            miso           : in STD_LOGIC;
            ss             : out STD_LOGIC
            );
end Top;

architecture Behavioral of Top is
----------------------------------------------------------------------------------
-- Signal Declarations
----------------------------------------------------------------------------------  
signal reset      : std_logic;

-- ADXL362 Accelerometer data signals
signal ACCEL_X    : STD_LOGIC_VECTOR (8 downto 0);
signal ACCEL_Y    : STD_LOGIC_VECTOR (8 downto 0);
signal ACCEL_MAG  : STD_LOGIC_VECTOR (11 downto 0);
signal ACCEL_TMP  : STD_LOGIC_VECTOR (11 downto 0);


----------------------------------------------------------------------------------
-- Component Declarations
----------------------------------------------------------------------------------

component AccelerometerCtl is
    generic (
                SYSCLK_FREQUENCY_HZ : integer := 100000000;
                SCLK_FREQUENCY_HZ   : integer := 1000000;
                NUM_READS_AVG       : integer := 16;
                UPDATE_FREQUENCY_HZ : integer := 1000
                );
    port (
                SYSCLK     : in STD_LOGIC; -- System Clock
                RESET      : in STD_LOGIC; -- Reset button on the Nexys4 board is active low
                
                -- SPI interface Signals
                SCLK       : out STD_LOGIC;
                MOSI       : out STD_LOGIC;
                MISO       : in STD_LOGIC;
                SS         : out STD_LOGIC;
                
                -- Accelerometer data signals
                ACCEL_X_OUT    : out STD_LOGIC_VECTOR (8 downto 0);
                ACCEL_Y_OUT    : out STD_LOGIC_VECTOR (8 downto 0);
                ACCEL_MAG_OUT  : out STD_LOGIC_VECTOR (11 downto 0);
                ACCEL_TMP_OUT  : out STD_LOGIC_VECTOR (11 downto 0)
                );
end component AccelerometerCtl;

begin

reset <= not RESETN;
--LED (15 downto 8) <= ACCEL_X;
--LED (8 downto 0) <= ACCEL_Y;

LEDs: process(CLK_IN, ACCEL_Y)
    begin
        if (rising_edge(CLK_IN)) then
            if (ACCEL_Y >= x"000") and (ACCEL_Y < x"020") then
                LED <= "1100000000000000";
            elsif (ACCEL_Y >= x"020") and (ACCEL_Y < x"040") then
                LED <= "0110000000000000";
            elsif (ACCEL_Y >= x"040") and (ACCEL_Y < x"060") then
                LED <= "0011000000000000";
            elsif (ACCEL_Y >= x"060") and (ACCEL_Y < x"080") then
                LED <= "0001100000000000";
            elsif (ACCEL_Y >= x"080") and (ACCEL_Y < x"0A0") then
                LED <= "0000110000000000";
            elsif (ACCEL_Y >= x"0A0") and (ACCEL_Y < x"0C0") then
                LED <= "0000011000000000";
            elsif (ACCEL_Y >= x"0C0") and (ACCEL_Y < x"0E0") then
                LED <= "0000001100000000";
            elsif (ACCEL_Y >= x"0E0") and (ACCEL_Y < x"100") then
                LED <= "0000000110000000";
            --
            elsif (ACCEL_Y >= x"100") and (ACCEL_Y < x"120") then
                LED <= "0000000110000000";
            elsif (ACCEL_Y >= x"120") and (ACCEL_Y < x"140") then
                LED <= "0000000011000000";
            elsif (ACCEL_Y >= x"140") and (ACCEL_Y < x"160") then
                LED <= "0000000001100000";
            elsif (ACCEL_Y >= x"160") and (ACCEL_Y < x"180") then
                LED <= "0000000000110000";
            elsif (ACCEL_Y >= x"180") and (ACCEL_Y < x"1A0") then
                LED <= "0000000000011000";
            elsif (ACCEL_Y >= x"1A0") and (ACCEL_Y < x"1C0") then
                LED <= "0000000000001100";
            elsif (ACCEL_Y >= x"1C0") and (ACCEL_Y < x"1E0") then
                LED <= "0000000000000110";
            elsif (ACCEL_Y >= x"1E0") and (ACCEL_Y < x"200") then
                LED <= "0000000000000011";
                
            end if;
        end if;
    end process;
          

----------------------------------------------------------------------------------
-- Port Maps
----------------------------------------------------------------------------------

Inst_AccelerometerCtl: AccelerometerCtl
    generic map (
                    SYSCLK_FREQUENCY_HZ   => 100000000,
                    SCLK_FREQUENCY_HZ     => 100000,
                    NUM_READS_AVG         => 16,
                    UPDATE_FREQUENCY_HZ   => 1000
                    )
    port map (
--                    SYSCLK     => clk_100MHz_buf,    --neet to map this? not sure what this is
                    SYSCLK     => CLK_IN,
                    RESET      => reset,
                    -- Spi interface Signals
                    SCLK       => sclk,
                    MOSI       => mosi,
                    MISO       => miso,
                    SS         => ss,
                    
                    -- Accelerometer data signals
                    ACCEL_X_OUT   => ACCEL_X,
                    ACCEL_Y_OUT   => ACCEL_Y,
                    ACCEL_MAG_OUT => ACCEL_MAG,
                    ACCEL_TMP_OUT => ACCEL_TMP
                    );

end Behavioral;
