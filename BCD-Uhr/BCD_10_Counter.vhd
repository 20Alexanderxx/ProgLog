library ieee;
use ieee.std_logic_1164.all;

entity BCD_10_Counter is
	port( reset, clk : in std_logic;
			Qp      : out std_logic_vector(3 downto 0));
end BCD_10_Counter;

architecture beehive of BCD_10_Counter is
component async_JK_FF is 
	port(	J, K, CLK, CLR	: in std_logic;
			Qp, Qn			: out std_logic);
end component;

signal j_s, k_s : std_logic_vector(3 downto 0);
constant numerounoundnichnumerodos : std_logic := '1';
signal qp_s: std_logic_vector(3 downto 0) := "0000";
signal qn_s : std_logic_vector(3 downto 0) := "1111";
begin 
	FlipFlop0: async_JK_FF port map(j_s(0), k_s(0), clk, reset, qp_s(0), qn_s(0));
	FlipFlop1: async_JK_FF port map(j_s(1), k_s(1), clk, reset, qp_s(1), qn_s(1));
	FlipFlop2: async_JK_FF port map(j_s(2), k_s(2), clk, reset, qp_s(2), qn_s(2));
	FlipFlop3: async_JK_FF port map(j_s(3), k_s(3), clk, reset, qp_s(3), qn_s(3));
	
	j_s(3) <= qp_s(0) and qp_s(1) and qp_s(2);
	k_s(3) <= qp_s(0) or qp_s(1) or qp_s(2);
	
	j_s(2) <= qp_s(0) and qp_s(1) and qn_s(3);
	k_s(2) <= qp_s(3) or (qp_s(0) and qp_s(1));
	
	j_s(1) <= qp_s(0) and qn_s(3);
	k_s(1) <= qp_s(0) or qp_s(3);
	
	j_s(0) <= qn_s(3) or (qn_s(1) and qn_s(2));
	k_s(0) <= numerounoundnichnumerodos;
	
	Qp <= qp_s;
end beehive;
