library ieee;
use ieee.std_logic_1164.all;

entity voll_add is
	port ( x, y, ci : in std_logic;
			res, co   : out std_logic);
end voll_add;

architecture behave of voll_add is
begin
process(x,y,ci)
begin
	res <= (x xor y) xor ci;
	co <= (x and y) or (ci and (x xor y));
end process;
end behave;