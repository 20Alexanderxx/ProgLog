library ieee;
use ieee.std_logic_1164.all;

-- x     : switches 0 to 7
-- y     : switches 8 to 15
-- red   : red LEDs to show all switches
-- green : green LEDs to show selected 8 switches
entity kombinatorik is
	generic (n : integer := 8);
	port(	x, y	: in std_logic_vector(7 downto 0);
			s	   : in std_logic;
		   red   : out std_logic_vector(15 downto 0); 
			green	: out std_logic_vector(7 downto 0));
end kombinatorik;

architecture behave of kombinatorik is

	component mux2to1
		port( x, y, s : in  std_logic;
				f		  : out std_logic);
	end component;
	
begin

	process(x,y)
	begin
		for i in 0 to (n-1) loop -- 0 to 7
			red(i)   <= y(i);   -- y (0 to 7) -> 0 to 7
			red(i+n) <= x(i); -- x 0 to 7 -> 8 to 15
		end loop;
	end process;

	mux_vector:
	for i in (n-1) downto 0 generate
		DUT: mux2to1
		port map (x(i), y(i), s, green(i));
	end generate mux_vector;end behave;