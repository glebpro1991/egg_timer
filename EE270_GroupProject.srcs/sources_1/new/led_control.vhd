----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 07:26:24
-- Design Name: 
-- Module Name: led_control - Behavioral
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

entity led_control is
    Port ( enable : in STD_LOGIC;
           seconds : in STD_LOGIC_VECTOR (8 downto 0);
           clk     : in STD_LOGIC;
           led : out STD_LOGIC_VECTOR (15 downto 0));
end led_control;

architecture Behavioral of led_control is

begin

  led_ctrl : process (clk, seconds, enable) is
  
    variable on_off : integer := 0;
  
  begin
  
    if rising_edge(clk) and to_integer(unsigned(seconds)) = 0 and enable = '1' then
        if(on_off = 0) then
            led <= "1111111111111111";
        else
            led <= "0000000000000000";
        end if;
    end if;
    
  end process;


end Behavioral;
