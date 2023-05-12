Library ieee;
USE ieee.std_logic_1164.all;

entity kombinatorik is
	port( x, y, z, v	:	in std_logic;
			f				:	out std_logic);
end kombinatorik;

architecture behave of kombinatorik is
component myAND
	port( x, y	:	in std_logic;
			z		:	out std_logic);
end component;

component myOR
	port( x, y	:	in std_logic;
			z		:	out std_logic);
end component;

signal x_not, y_not, z_not, v_not,
k0_zwi, k0_out, k1_out, k2_out, k3_out,
k0ork1, k2ork3 : std_logic; 

begin
	x_not <= not x;
	y_not <= not y;
	z_not <= not z;
	v_not <= not v;
	
	k0part1: myAND port map (x_not, z_not, k0_zwi);
	k0part2: myAND port map (k0_zwi, v_not, k0_out);
	k1:		myAND port map (y_not, v_not, k1_out);
	k2:		myAND port map (y_not, z, k2_out);
	k3:		myAND port map (x, z, k3_out);
	ork0k1:	myOR port map (k0_out, k1_out, k0ork1);
	ork2k3:	myOR port map (k2_out, k3_out, k2ork3);
	finalor: myOR port map (k0ork1, k2ork3, f);
end behave;