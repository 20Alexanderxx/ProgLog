LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY MUX_2to1 IS
	PORT
	( 	x , y : IN std_logic;
		s 		: IN std_logic;
		f 		: OUT std_logic
	 );
END ENTITY MUX_2to1;

ARCHITECTURE Behavioral OF MUX_2to1 IS
BEGIN
	PROCESS ( x , y , s ) IS
	BEGIN
		CASE s IS
			WHEN '0' => f <= x ;
			WHEN '1' => f <= y ;
			WHEN OTHERS => f <= 'U' ;
		END CASE;
	END PROCESS;
END ARCHITECTURE Behavioral ;