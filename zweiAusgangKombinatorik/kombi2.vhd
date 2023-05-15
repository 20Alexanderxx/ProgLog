Library ieee;
USE ieee.std_logic_1164.all;

entity kombi2 is
	port( x, y, z	:	in std_logic;
			f, g				:	out std_logic);
end kombi2;

architecture behave of kombi2 is
begin
	process (x, y, z)
	begin
		f <= (x and z) or (not x and y and not z);
		g <= (not x and z) or (x and y and not z);
	end process;
end behave;