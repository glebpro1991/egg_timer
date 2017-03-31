----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 07:24:45
-- Design Name: 
-- Module Name: egg_timer - Behavioral
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

entity egg_timer is
    Port ( start_reset : in STD_LOGIC;
           mode : in STD_LOGIC;
           clk : in STD_LOGIC;
           a_to_g : out STD_LOGIC_VECTOR (6 downto 0);
           seg_sel : out STD_LOGIC_VECTOR (3 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0));
end egg_timer;

architecture Behavioral of egg_timer is

    signal clk_sec       : STD_LOGIC;
    signal clk_7seg      : STD_LOGIC;
    signal clk_LED       : STD_LOGIC;
    signal seconds       : STD_LOGIC_VECTOR (8 downto 0);
    signal ones          : STD_LOGIC_VECTOR (3 downto 0);
    signal tens          : STD_LOGIC_VECTOR (3 downto 0);
    signal hundreds      : STD_LOGIC_VECTOR (3 downto 0);
    signal digit         : STD_LOGIC_VECTOR (3 downto 0);

begin

        clock_divider: entity work.clk_div
            port map( clk_in    => clk,
                      clk_sec   => clk_sec,
                      clk_7seg  => clk_7seg
                      --clk_LED   => clk_LED
                     );
                     
        counter:       entity work.counter
            port map( mode         => mode,
                      start_reset  => start_reset,
                      clk          => clk_sec,
                      clk_7seg     => clk_7seg,
                      seconds      => seconds
                    );
        bin2bcd_conv:  entity work.bin2bcd_9bit
            port map( binIN    => seconds,
                      ones     => ones,
                      tens     => tens,
                      hundreds => hundreds
                     );
                     
        display_ctrl: entity work.display_control
            port map( ones => ones,
                      tens => tens,
                      hundreds => hundreds,
                      enable   => start_reset,
                      clk_7seg => clk_7seg,
                      clk_sec  => clk_sec,
                      digit    => digit,
                      seg_sel  => seg_sel
                     );
                     
        bin_to_7seg: entity work.bin_to_7seg
             port map( bin => digit,
                       a_to_g => a_to_g
                      );                               

        led_control: entity work.led_control
             port map( enable  => start_reset,
                       seconds => seconds,
                       clk     => clk_sec,
                       led    => led
                      ); 
     
end Behavioral;
