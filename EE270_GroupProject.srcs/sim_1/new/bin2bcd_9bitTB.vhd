----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 09:17:18
-- Design Name: 
-- Module Name: bin2bcd_9bitTB - Behavioral
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

entity bin2bcd_9bitTB is
--  Port ( );
end bin2bcd_9bitTB;

architecture Behavioral of bin2bcd_9bitTB is

    signal binIN         : STD_LOGIC_VECTOR (8 downto 0);
    signal ones          : STD_LOGIC_VECTOR (3 downto 0);
    signal tens          : STD_LOGIC_VECTOR (3 downto 0);
    signal hundreds      : STD_LOGIC_VECTOR (3 downto 0);

begin

    DUT: entity work.bin2bcd_9bit
    port map ( binIN    => binIN,
               ones     => ones,
               tens     => tens,
               hundreds => hundreds
              );
         
     stimulus : process is
              begin
                 binIN <= "011010010"; --210
                 wait;
             end process;          

end Behavioral;
