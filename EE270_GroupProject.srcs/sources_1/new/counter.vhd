----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 05:03:05
-- Design Name: 
-- Module Name: counter - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity counter is
    Port ( mode : in STD_LOGIC;
           start_reset : in STD_LOGIC;
           clk : in STD_LOGIC;
           clk_7seg : in STD_LOGIC;
           seconds : out STD_LOGIC_VECTOR (8 downto 0));
end counter;

architecture Behavioral of counter is

     constant hard_boiled_egg_time : integer := 420 + 1;
     constant soft_boiled_egg_time : integer := 210 + 1;

begin

  down_counter : process (clk, clk_7seg) is
  
  variable seconds_left : integer;
  
  begin
        if (start_reset = '0') then
            if (mode = '1') then
                seconds_left := hard_boiled_egg_time;
            else
                seconds_left := soft_boiled_egg_time;
            end if;
        else
            if rising_edge(clk)  and seconds_left >= 0 then
               seconds_left := seconds_left - 1;
               seconds <= std_logic_vector(to_unsigned(seconds_left,9));
            end if;
       end if;
  end process;


end Behavioral;
