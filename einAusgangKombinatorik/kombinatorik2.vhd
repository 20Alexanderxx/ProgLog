Library ieee;
USE ieee.std_logic_1164.all;

entity kombinatorik2 is
	port( x, y, z, v	:	in std_logic;
			f				:	out std_logic);
end kombinatorik2;

architecture behave of kombinatorik2 is
begin
	process (x, y, z, v)
	begin
		f <= (not y and z) or (not v and not y) or (z and x) or (not v and not z and not x);
	end process;
end behave;