library ieee;
use ieee.std_logic_1164.all;

entity voll_sub_generic is 
generic (n : Integer := 4);
port(clk, rst, bin : in std_logic;
		x, y : in std_logic_vector(n-1 downto 0);
		bo : out std_logic;
		res : out std_logic_vector(n-1 downto 0));
end voll_sub_generic;


architecture behave of voll_sub_generic is

component voll_sub is 
port( x, y, bi : in std_logic;
		res, bo : out std_logic);
end component;

component NBit_Register is
	generic (n: Integer := 8);
	port(D  			        : in std_logic_vector(n-1 downto 0);
		  LD, CLK, CLR : in std_logic;
		  Q 			        : out std_logic_vector(n-1 downto 0));
end component;

component async_MS_D_FF is
	Port(	D, CLK, CEN, CLR	: in std_logic;
			Qp, Qn				: out std_logic);
end component;

signal s_x, s_y, s_bo, s_res, s_b_tmp : std_logic_vector(n-1 downto 0);
signal s_bin, s_b_neg : std_logic;

constant uno : std_logic := '1';
signal s_clk : std_logic := '0';

begin
	s_clk <= not clk;
	
	-- input registers
	REG01 : NBit_Register generic map (n) port map(x, uno, s_clk, rst, s_x);
	REG02 : NBit_Register generic map (n) port map(y, uno, s_clk, rst, s_y);
	FF3 : async_MS_D_FF port map (bin, s_clk, uno, rst, s_bin, s_b_neg);
	
	--concat carry values
	s_b_tmp <= s_bo(n-2 downto 0) & s_bin;
	
	subs: 
	for i in 0 to (n-1) generate
		suuuuub : voll_sub port map (s_x(i), s_y(i), s_b_tmp(i), s_res(i), s_bo(i));
	end generate subs;

	REG1OUT : NBit_Register generic map (n) port map(s_res, uno, s_clk, rst, res);
	FFOUT : async_MS_D_FF port map (s_bo(n-1), s_clk, uno, rst, bo, s_b_neg);

end behave;