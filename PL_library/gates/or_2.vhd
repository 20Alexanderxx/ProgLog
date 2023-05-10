library ieee;
use ieee.std_logic_1164.all;

entity or_2 is
	port( x, y : in  std_logic;
		   z    : out std_logic
	);
end or_2;

architecture behave of or_2 is
begin
	process( x, y )
	begin
		z <= x OR y;
	end process;	
end behave;