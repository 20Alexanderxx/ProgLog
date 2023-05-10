library ieee;
use ieee.std_logic_1164.all;

entity nor_2 is
	port( x, y : in  std_logic;
		   z    : out std_logic);
end nor_2;

architecture behave of nor_2 is
begin
	process( x, y )
	begin
		z <= NOT (x OR y);
	end process;	
end behave;