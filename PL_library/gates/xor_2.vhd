library ieee;
use ieee.std_logic_1164.all;

entity xor_2 is
	port( x, y : in  std_logic;
		   z    : out std_logic);
end xor_2;

architecture behave of xor_2 is
begin
	process( x, y )
	begin
		z <= x XOR y;
	end process;	
end behave;