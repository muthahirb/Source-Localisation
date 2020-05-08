library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


-----------------version 2.0---------------

entity accu is
  port ( clk : in std_logic;
         clr : in std_logic;
         accumulator_enable : in std_logic;
         mul_2  : in std_logic_vector (31 downto 0);
         accumulated_data : out std_logic_vector (31 downto 0);
         FIFO_enable : out std_logic := '0');
end accu;

architecture rtl of accu is
  signal tmp : std_logic_vector (31 downto 0) := (others => '0');
begin
  process (clk) begin
    if (rising_edge(clk)) then
      if (clr = '1') then
        tmp <= (others => '0');
      elsif (accumulator_enable  = '1') then 
        tmp  <= std_logic_vector(signed(tmp) + signed(mul_2));
        FIFO_enable <= '1';
      else
        FIFO_enable <= '0';
      end if;
    end if;
  end process;
  accumulated_data <= tmp;
end rtl;

