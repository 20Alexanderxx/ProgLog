library ieee;
use ieee.std_logic_1164.all;

entity voll_sub is
	port ( x, y, bi : in std_logic;
			res, bo   : out std_logic);
end voll_sub;

architecture behave of voll_sub is
begin
process(x,y,bi)
begin
	res <= (x xor y) xor bi;
	bo <= (not x and y) or (bi and (x nand not y));
end process;
end behave;