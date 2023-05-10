Library ieee;
Use ieee.std_logic_1164.all;

Entity and_2 is
	PORT( x, y : IN  std_logic;
		   z    : OUT std_logic);
End and_2;

Architecture behave of and_2 is
Begin
	Process( x, y )
	Begin
		z <= x AND y;
	End Process;	
end behave;