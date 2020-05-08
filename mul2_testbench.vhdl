library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity mulv2_tb is
end mulv2_tb;

architecture test of mulv2_tb is
component mul is
  port ( clk : in std_logic;
         multiplier_enable : in std_logic;
         del_sum  : in std_logic_vector (15 downto 0);
         accumulator_enable : out std_logic;
         mul_2 : out std_logic_vector (31 downto 0));
end component;
signal 		clk_tb :  std_logic:= '0';
signal		multiplier_enable_tb :  std_logic;
signal	 	del_sum_tb  :  std_logic_vector (15 downto 0);
signal		accumulator_enable_tb :  std_logic;
signal 		mul_2_tb : std_logic_vector (31 downto 0);

begin
mul_comp: component mul port map (clk=>clk_tb,multiplier_enable=>multiplier_enable_tb,del_sum=>del_sum_tb,accumulator_enable=>accumulator_enable_tb,
				  mul_2=>mul_2_tb);


--clock inversion--
 clk_proc: process
   begin
      wait for 50 ns;
      clk_tb <= not(clk_tb);
   end process clk_proc;
------------------
----- multiplier_enable signal--
multiplier_enable_tb <= '0',
               		'1' after 100 ns,
               		'0' after 500 ns;
--------------------
---------- data for multiplication --------------

del_sum_tb <= "0000000000000001",
		"0000000000000000" after 50 ns,
		"0000000000000010" after 100 ns,
		"0000000000000001"  after 150 ns,
		"0000000000000011" after 200 ns,
		"1111111111111110" after 400 ns,
		"1111111111111110" after 500 ns;
end test;

 