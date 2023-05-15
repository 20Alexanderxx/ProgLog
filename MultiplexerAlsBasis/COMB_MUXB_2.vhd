LIBRARY IEEE ;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY COMB_MUXB_2 IS
PORT(	x, y, z, v	:	in std_logic;
		f, g			:	out std_logic
);
END COMB_MUXB_2;

ARCHITECTURE struc OF COMB_MUXB_2 IS
COMPONENT MUX_2to1
	PORT(	x, y	:	in std_logic;
			s		:	in std_logic;
			f		:	out std_logic
	);
END COMPONENT;

SIGNAL tempg, tempf : std_logic;
SIGNAL bit_zero : std_logic := '0';
SIGNAl bit_one : std_logic := '1';

BEGIN
	muxtempf: MUX_2to1 PORT MAP(v, bit_one, z, tempf);
	muxtempg: MUX_2to1 PORT MAP(bit_zero, y, x, tempg);
	muxf: MUX_2to1 PORT MAP(tempf, y, x, f);
	muxg: MUX_2to1 PORT MAP(z, bit_one, tempg, g);
END struc;