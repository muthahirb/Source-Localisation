library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity accu2_tb is

end accu2_tb;

architecture test of accu2_tb is
component accu is
  port ( clk : in std_logic;
         clr : in std_logic;
         accumulator_enable : in std_logic;
         mul_2  : in std_logic_vector (31 downto 0);
         accumulated_data : out std_logic_vector (31 downto 0);
         FIFO_enable : out std_logic := '0');
end component;

signal clk_tb :  std_logic:='0';
signal clr_tb :  std_logic;
signal accumulator_enable_tb : std_logic;
signal mul_2_tb  :  std_logic_vector (31 downto 0);
signal  accumulated_data_tb:  std_logic_vector (31 downto 0);
signal FIFO_enable_tb :  std_logic := '0';

begin
accu_comp: component accu port map( clk=>clk_tb, clr=>clr_tb, accumulator_enable=> accumulator_enable_tb, mul_2 => mul_2_tb, 
				   accumulated_data => accumulated_data_tb, FIFO_enable => FIFO_enable_tb);


--clock inversion--
 clk_proc: process
   begin
      wait for 50 ns;
      clk_tb <= not(clk_tb);
   end process clk_proc;
------------------

----- accumulator_enable signal--
accumulator_enable_tb <= '0',
               		'1' after 100 ns,
               		'0' after 900 ns;
			
--------------------

------ clear signal ---------



clr_tb <= '1',
          '0' after 100 ns,
          '1' after 700 ns,
	  '0' after 800 ns;
-----------------------------

-- data assertion -------------


mul_2_tb     <= "00000000000000000000000000000001",
		"00000000000000000000000000000000" after 50 ns,
		"00000000000000000000000000000010" after 100 ns,
		"00000000000000000000000000000001"  after 150 ns,
		"00000000000000000000000000000011" after 200 ns,
		"11111111111111111111111111111110" after 400 ns,
		"11111111111111111111111111111110" after 500 ns,
		"00000000000000000000000000000001"  after 700 ns,
		"00000000000000000000000000000011"  after 750 ns,
		"00000000000000000000000000000001"  after 850 ns;

end test;

