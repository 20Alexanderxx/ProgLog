library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity voll_sub_tb is
end voll_sub_tb;

architecture beehive of voll_sub_tb is
component voll_sub is
	port ( x, y, bi : in std_logic;
			res, bo   : out std_logic);
end component;

signal s_x, s_y, s_bin, s_bout, s_res : std_logic;
signal counter : unsigned(2 downto 0);
signal clk : std_logic := '0';
signal reset : std_logic;

begin
	clk <= not clk after 5 ns;
	reset <= '1', '0' after 15 ns;
	
	dut: voll_sub port map (s_x, s_y, s_bin, s_res, s_bout);
	
	process (clk, reset)
	begin
		if reset = '1' then
			counter <= (others => '0');
		elsif rising_edge(clk) then
			counter <= counter + 1;
		end if;
	end process;
	s_x <= std_logic(counter(1));
	s_y <= std_logic(counter(0));
	s_bin <= std_logic(counter(2));
	
end beehive;