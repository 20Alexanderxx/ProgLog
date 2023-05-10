library ieee;
use ieee.std_logic_1164.all;

entity nand_2 is
	port( x, y : in  std_logic;
		   z    : out std_logic
	);
end nand_2;

architecture behave of nand_2 is
begin
	process( x, y )
	begin
		z <= NOT (x AND y);
	end process;	
end behave;