----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 08:43:55
-- Design Name: 
-- Module Name: clock_dividerTB - Behavioral
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

entity clock_dividerTB is
--  Port ( );
end clock_dividerTB;

architecture Behavioral of clock_dividerTB is

    constant T_clk    : time    := 10 ns;
    constant n_cycles : integer := 200;

    signal clk_in, clk_sec, clk_7seg, clk_LED : STD_LOGIC;

begin



    DUT: entity work.clk_div
        port map ( clk_in    => clk_in,
                   clk_sec   => clk_sec,
                   clk_7seg  => clk_7seg,
                   clk_LED   => clk_LED
                  );

     clk_gen : process is
     begin
         while now <= (n_cycles*T_clk) loop       
            clk_in <= '1'; wait for T_clk/2;
            clk_in <= '0'; wait for T_clk/2;
        end loop;
       wait;
     end process;

end Behavioral;
