library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity voll_add_tb is
end voll_add_tb;

architecture beehive of voll_add_tb is
component voll_add is
	port ( x, y, ci : in std_logic;
			res, co   : out std_logic);
end component;

signal s_x, s_y, s_cin, s_cout, s_res : std_logic;
signal counter : unsigned(2 downto 0);
signal clk : std_logic := '0';
signal reset : std_logic;

begin
	clk <= not clk after 5 ns;
	reset <= '1', '0' after 15 ns;
	
	dut: voll_add port map (s_x, s_y, s_cin, s_res, s_cout);
	
	process (clk, reset)
	begin
		if reset = '1' then
			counter <= (others => '0');
		elsif rising_edge(clk) then
			counter <= counter + 1;
		end if;
	end process;
	s_x <= std_logic(counter(0));
	s_y <= std_logic(counter(1));
	s_cin <= std_logic(counter(2));
	
end beehive;