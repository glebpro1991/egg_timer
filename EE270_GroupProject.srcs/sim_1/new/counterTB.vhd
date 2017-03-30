----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 09:07:15
-- Design Name: 
-- Module Name: counterTB - Behavioral
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

entity counterTB is
--  Port ( );
end counterTB;

architecture Behavioral of counterTB is

    signal start_reset, mode, clk : std_logic;
    signal seconds                : std_logic_vector( 8 downto 0);

    constant T_clk : time       := 10 ns;
    constant n_cycles : integer := 500;

begin

    DUT: entity work.counter
        port map ( start_reset => start_reset,
                   mode        => mode,
                   clk         => clk,
                   seconds     => seconds
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
        
        start_reset <= '1'; wait for T_clk*5;
        
        wait;
    end process;

end Behavioral;
