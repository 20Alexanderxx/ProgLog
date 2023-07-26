library ieee;
use ieee.std_logic_1164.all;

entity combiAddSub is
	port (sel, x, y, ci : in std_logic;
			res, co 		  : out std_logic);
end combiAddSub;

architecture behave of combiAddSub is
begin
	process(sel, x, y, ci)
	begin
		res <= (ci xor y) xor x;
		co <= (y nand ci) nand ((ci xor y) nand (x xor sel));
	end process;
end behave;