----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 05:55:14
-- Design Name: 
-- Module Name: bin_to_7seg - Behavioral
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

entity bin_to_7seg is
    Port ( bin :    in  STD_LOGIC_VECTOR (3 downto 0);
           a_to_g : out STD_LOGIC_VECTOR (6 downto 0));
end bin_to_7seg;

architecture Behavioral of bin_to_7seg is

begin

  digit_change : process (bin) is
  begin
    case  bin is
        when "0000"=> a_to_g <="0000001";  -- '0'
        when "0001"=> a_to_g <="1001111";  -- '1'
        when "0010"=> a_to_g <="0010010";  -- '2'
        when "0011"=> a_to_g <="0000110";  -- '3'
        when "0100"=> a_to_g <="1001100";  -- '4' 
        when "0101"=> a_to_g <="0100100";  -- '5'
        when "0110"=> a_to_g <="0100000";  -- '6'
        when "0111"=> a_to_g <="0001111";  -- '7'
        when "1000"=> a_to_g <="0000000";  -- '8'
        when "1001"=> a_to_g <="0000100";  -- '9'
         --nothing is displayed when a number more than 9 is given as input. 
        when others=> a_to_g <="1111111"; 
    end case;
  end process;




end Behavioral;
