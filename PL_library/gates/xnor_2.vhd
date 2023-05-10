library ieee;
use ieee.std_logic_1164.all;

entity xnor_2 is
	port( x, y : in  std_logic;
		   z    : out std_logic);
end xnor_2;

architecture behave of xnor_2 is
begin
	process( x, y )
	begin
		z <= x XNOR y;
	end process;	
end behave;