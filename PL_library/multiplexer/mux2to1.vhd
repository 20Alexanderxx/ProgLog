library ieee;
use ieee.std_logic_1164.all;

entity mux2to1 is
	port( x, y, s : in  std_logic;
		   f       : out std_logic);
end mux2to1;

architecture behave of mux2to1 is
begin
	process( x, y, s )
	begin
		case s is
			when '0' => f <= x;
			when '1' => f <= y;
			when others => f <= 'U';
		end case;
	end process;	
end behave;