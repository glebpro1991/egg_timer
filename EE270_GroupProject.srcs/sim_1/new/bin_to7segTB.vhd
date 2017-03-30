----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 09:42:35
-- Design Name: 
-- Module Name: bin_to7segTB - Behavioral
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

entity bin_to7segTB is
--  Port ( );
end bin_to7segTB;

architecture Behavioral of bin_to7segTB is

    signal bin         : STD_LOGIC_VECTOR (3 downto 0);
    signal a_to_g      : STD_LOGIC_VECTOR (6 downto 0);

begin

    DUT: entity work.bin_to_7seg
    port map ( bin    => bin,
               a_to_g => a_to_g
              );
         
     stimulus : process is
     begin
        bin <= "0011"; wait for 10ns;
        bin <= "0001"; wait for 10ns; --210
        wait;
     end process;   


end Behavioral;
