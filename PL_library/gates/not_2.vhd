Library ieee;
Use ieee.std_logic_1164.all;

Entity not_2 is
	PORT( x : IN  std_logic;
		   z : OUT std_logic);
End not_2;

Architecture behave of not_2 is
Begin
	Process( x )
	Begin
		z <= not x;
	End Process;	
end behave;