library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
-------------- multiplier version 2.0---------------
entity mul is
  port ( clk : in std_logic;
         multiplier_enable : in std_logic;
         del_sum  : in std_logic_vector (15 downto 0);
         accumulator_enable : out std_logic;
         mul_2 : out std_logic_vector (31 downto 0));
end mul;

architecture rtl of mul is
begin
  process (clk) begin
    if (rising_edge(clk)) then
      if (multiplier_enable = '1') then 
        mul_2 <= std_logic_vector(signed(del_sum ) * signed(del_sum));
        accumulator_enable <= '1';
      else
        accumulator_enable <= '0';
      end if;
    end if;
  end process;
end RTL;
 