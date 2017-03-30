----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 09:48:26
-- Design Name: 
-- Module Name: display_controlTB - Behavioral
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

entity display_controlTB is
--  Port ( );
end display_controlTB;

architecture Behavioral of display_controlTB is

    signal enable, clk_7seg, clk_LED, clk_in    : STD_LOGIC;
    signal ones, tens, hundreds, digit           : STD_LOGIC_VECTOR (3 downto 0);
    signal seg_sel                              : STD_LOGIC_VECTOR (2 downto 0);

    constant T_clk : time       := 10 ns;
    constant n_cycles : integer := 500;

begin

    DUT:    entity work.display_control
        port map ( ones      => ones,
                   tens      => tens,
                   hundreds  => hundreds,
                   enable    => enable,
                   clk_7seg  => clk_7seg,
                   clk_LED   => clk_LED,
                   digit     => digit,
                   seg_sel   => seg_sel
                  );
                  
    clk_div: entity work.clk_div
        port map ( clk_in    => clk_in,
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
     
     stimulus : process is
     begin
        enable <= '1';
        ones <= "0001"; tens <= "0010"; hundreds <= "0011"; wait for T_clk*100;
        ones <= "0000"; tens <= "0001"; hundreds <= "0001"; wait for T_clk*100;
        ones <= "0000"; tens <= "0000"; hundreds <= "0000";
        wait;
    end process;

end Behavioral;
