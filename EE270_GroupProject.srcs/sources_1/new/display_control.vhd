----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 05:26:31
-- Design Name: 
-- Module Name: display_control - Behavioral
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

entity display_control is
    Port ( ones        : in STD_LOGIC_VECTOR (3 downto 0);
           tens        : in STD_LOGIC_VECTOR (3 downto 0);
           hundreds    : in STD_LOGIC_VECTOR (3 downto 0);
           enable      : in STD_LOGIC;
           clk_7seg    : in STD_LOGIC;
           clk_sec     : in STD_LOGIC;
           -- clk_LED     : in STD_LOGIC;
           digit   : out STD_LOGIC_VECTOR (3 downto 0);
           seg_sel : out STD_LOGIC_VECTOR (3 downto 0));
end display_control;

architecture Behavioral of display_control is

begin

  seconds_refresh : process (clk_7seg, clk_sec, ones, tens, hundreds, enable) is
  
    variable selector : integer := 0;
    variable ones_int : integer := to_integer(unsigned(ones));
    variable tens_int : integer := to_integer(unsigned(tens));
    variable hundreds_int : integer := to_integer(unsigned(hundreds));
    
  begin
  
    if rising_edge(clk_7seg) then
        if(enable = '1') then
        
            ones_int     := to_integer(unsigned(ones));
            tens_int     := to_integer(unsigned(tens));
            hundreds_int := to_integer(unsigned(hundreds));
            
            if selector = 0 then
                seg_sel <= "1011";
                if hundreds_int = 0 then             
                    digit   <= "1111"; --invalid state - won't display anything               
                else            
                    digit   <= hundreds;            
                end if;
            end if;
    
            if selector = 1 then
                seg_sel <= "1101";
                if hundreds_int = 0 and tens_int = 0 then             
                    digit   <= "1111"; --invalid state - won't display anything                
                else            
                    digit   <= tens;           
                end if;
            
            end if;        
    
            if selector = 2 then
                seg_sel <= "1110";
                if hundreds_int = 0 and tens_int = 0 and ones_int = 0  then             
                    if clk_sec = '1' then
                        digit <= ones;
                    else
                        digit <= "1111"; --blinking 0 synchronized with LEDs
                    end if;               
                else            
                    digit   <= ones;           
                end if;
            end if;
            selector := (selector + 1) mod 3; --0, 1, 2, 0 , 1 ,2 etc      
        else    
            seg_sel <= "1111";
        end if;
    end if;
    
  end process;



end Behavioral;
