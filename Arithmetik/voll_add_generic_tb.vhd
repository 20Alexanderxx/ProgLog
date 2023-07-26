library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity voll_add_generic_tb is
end voll_add_generic_tb;

architecture beehive of voll_add_generic_tb is
component voll_add_generic is 
generic (n : Integer := 4);
port(clk, rst, cin : in std_logic;
		x, y : in std_logic_vector(n-1 downto 0);
		co : out std_logic;
		res : out std_logic_vector(n-1 downto 0));
end component;

signal s_cin, s_cout : std_logic;
signal counter : unsigned(8 downto 0);
signal clk : std_logic := '0';
signal reset : std_logic;
signal s_x, s_y, s_res : std_logic_vector(3 downto 0);

begin
	clk <= not clk after 5 ns;
	reset <= '1', '0' after 15 ns;
	
	dut: voll_add_generic port map (clk, reset, s_cin, s_x, s_y, s_cout, s_res);
	
	process (clk, reset)
	begin
		if reset = '1' then
			counter <= (others => '0');
		elsif rising_edge(clk) then
			counter <= counter + 1;
		end if;
	end process;
	s_x <= std_logic_vector(counter(7 downto 4));
	s_y <= std_logic_vector(counter(3 downto 0));
	s_cin <= std_logic(counter(8));
	
end beehive;