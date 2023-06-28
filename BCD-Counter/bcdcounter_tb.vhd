library ieee;
use ieee.std_logic_1164.all;

entity bcdcounter_tb is
end bcdcounter_tb;

architecture testbench of bcdcounter_tb is
component Counter_framework is
	port( clk, clr 		  : in std_logic;
         QpJK, QpJKs, QpD : out std_logic_vector(0 to 6));
end component;

signal s_CLK : std_logic := '1';
signal s_CLR : std_logic;
signal s_7SegJK, s_7SegJKs, s_7SegD: std_logic_vector(0 to 6);

begin
	dut: Counter_framework port map (s_CLK, s_CLR, s_7SegJK, s_7SegJKs, s_7SegD);
	
	process
	begin
		s_CLK <= NOT s_CLK;
		wait for 5 ns;
	end process;
	
	process
	begin
		s_CLR <= '1';
		wait for 12 ns;
		s_CLR <= '0';
		wait for 10 ns;
		s_CLR <= '1';
		wait;
	end process;
	
end testbench;