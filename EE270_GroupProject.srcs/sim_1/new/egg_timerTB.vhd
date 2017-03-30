----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 08:22:30
-- Design Name: 
-- Module Name: egg_timerTB - Behavioral
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

entity egg_timerTB is
--  Port ( );
end egg_timerTB;

architecture Behavioral of egg_timerTB is

    signal start_reset, mode, clk : std_logic;
    signal a_to_g                 : std_logic_vector( 6  downto 0);
    signal seg_sel                : std_logic_vector( 2  downto 0);
    signal led                   : std_logic_vector( 15 downto 0);

    constant T_clk : time       := 10 ns;
    constant n_cycles : integer := 5000;

begin

    DUT: entity work.egg_timer
        port map ( start_reset => start_reset,
                   mode        => mode,
                   clk         => clk,
                   a_to_g      => a_to_g,
                   seg_sel     => seg_sel,
                   led        => led
                  );

     clk_gen : process is
     begin
         while now <= (n_cycles*T_clk) loop       
            clk <= '1'; wait for T_clk/2;
            clk <= '0'; wait for T_clk/2;
        end loop;
       wait;
     end process;
     
     stimulus : process is
     begin
        start_reset <= '0'; mode <= '0'; wait for T_clk*5;        -- initial reset
        start_reset <= '1';
        
        wait;
    end process;

end Behavioral;
