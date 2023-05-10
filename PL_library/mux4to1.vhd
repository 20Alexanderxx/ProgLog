library ieee;
use ieee.std_logic_1164.all;

entity mux4to1 is
	port( x3, x2, x1, x0, s1, s0 : in  std_logic;
		   f                      : out std_logic);
end mux4to1;

architecture behave of mux4to1 is
begin
	process(x3, x2, x1, x0, s1, s0)
	begin

		if (s1='0' And s0='0') then
			f <= x0;
		elsif (s1='0' And s0='1') then
			f <= x1;
		elsif (s1='1' And s0='0') then
			f <= x2;
		else
			f <= x3;
		end if;

	end process;	
end behave;