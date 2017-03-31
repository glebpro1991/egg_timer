----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 29.03.2017 04:17:04
-- Design Name: 
-- Module Name: clk_div - Behavioral
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

entity clk_div is
    Port ( clk_in    :   in  STD_LOGIC;
           clk_sec   :   out STD_LOGIC;
           clk_7seg  :   out STD_LOGIC
           --clk_LED   :   out STD_LOGIC
           );
end clk_div;

architecture Behavioral of clk_div is
    constant max_count_sec    : integer := 50000000;     --100*10^6 clock cycles every second (1Hz)
    --constant max_count_LED    : integer := 50000000;      --50*10^6 clock cycles every half second (2Hz)
    constant max_count_7_seg  : integer := 400000;        --4*10^5 clock cycles every 4 ms  (250 Hz)
    
    --for testing
    --constant max_count_sec    : integer := 100;     --100*10^6 clock cycles every second (1Hz)
    --constant max_count_LED    : integer := 50;      --50*10^6 clock cycles every half second (2Hz)
    --constant max_count_7_seg  : integer := 4;        --4*10^5 clock cycles every 4 ms  (250 Hz)
begin
  clk_divide : process (clk_in) is
    variable count_sec      : integer   := 0;    --counter for seconds
    --variable count_LED      : integer   := 0;    --counter for seconds
    variable count_7_seg    : integer   := 0;    --counter for 16ms
    
    variable int_clk_sec    : std_logic := '0';  --internal clock for seconds
    --variable int_clk_LED    : std_logic := '0';  --internal clock for 0.5s
    variable int_clk_7seg  : std_logic := '0';  --internal clock for 16ms                  
  begin
  
    if rising_edge(clk_in) then
      if count_sec <= max_count_sec then
        count_sec := count_sec + 1;
      else
        count_sec := 0;
        int_clk_sec := not int_clk_sec;
      end if;
      
      --if count_LED <= max_count_LED then
              --count_LED := count_LED + 1;
      --else
         --count_LED := 0;
         --int_clk_LED := not int_clk_LED;
      --end if;
      
      if count_7_seg <= max_count_7_seg then
         count_7_seg := count_7_seg + 1;
      else          
         count_7_seg := 0;
         int_clk_7seg := not int_clk_7seg;
      end if;      
      
      clk_sec    <= int_clk_sec;
      --clk_LED    <= int_clk_LED;
      clk_7seg  <= int_clk_7seg;
      
    end if;
    
  end process;

end Behavioral;
