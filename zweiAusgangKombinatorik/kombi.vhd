Library ieee;
USE ieee.std_logic_1164.all;

entity kombi is
	port( x, y, z	:	in std_logic;
			f, g				:	out std_logic);
end kombi;

architecture behave of kombi is
component myAND
	port( x, y	:	in std_logic;
			z		:	out std_logic);
end component;

component myOR
	port( x, y	:	in std_logic;
			z		:	out std_logic);
end component;

signal x_not, z_not,
k0_zwi, k0f_out, k0g_out, k1f_out, k1g_out : std_logic; 

begin
	x_not <= not x;
	z_not <= not z;
	
	yandnotz: 	myAND port map (y, z_not, k0_zwi);
	k0f: 			myAND port map (k0_zwi, x_not, k0f_out);
	k1f:			myAND port map (x, z, k1f_out);
	k0g:			myAND port map (k0_zwi, x, k0g_out);
	k1g:			myAND port map (x_not, z, k1g_out);
	finalorf:	myOR port map (k0f_out, k1f_out, f);
	finalorg:	myOR port map (k0g_out, k1g_out, g);
end behave;