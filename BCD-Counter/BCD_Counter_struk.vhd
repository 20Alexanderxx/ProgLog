library ieee;
use ieee.std_logic_1164.all;

entity BCD_Counter_struk is
	port( reset, clk : in std_logic;
         Qp      : out std_logic_vector(3 downto 0));
end BCD_Counter_struk;

architecture beehive of BCD_Counter_struk is
component async_JK_FF is 
	port(	J, K, CLK, CLR	: in std_logic;
			Qp, Qn			: out std_logic);
end component;

component myAND is
    Port( x, y : in std_logic;
            z      : out std_logic);
end component;

component myOR is
    Port( x, y : in std_logic;
            z      : out std_logic);
end component;

signal j_s, k_s : std_logic_vector(3 downto 0);
constant numerounoundnichnumerodos : std_logic := '1';
signal qp_s: std_logic_vector(3 downto 0) := "0000";
signal qn_s : std_logic_vector(3 downto 0) := "1111";
signal qp0andqp1, k3_zwi, j0_zwi : std_logic;
begin 
	FlipFlop0: async_JK_FF port map(j_s(0), k_s(0), clk, reset, qp_s(0), qn_s(0));
	FlipFlop1: async_JK_FF port map(j_s(1), k_s(1), clk, reset, qp_s(1), qn_s(1));
	FlipFlop2: async_JK_FF port map(j_s(2), k_s(2), clk, reset, qp_s(2), qn_s(2));
	FlipFlop3: async_JK_FF port map(j_s(3), k_s(3), clk, reset, qp_s(3), qn_s(3));
	
	--j_s(3) <= qp_s(0) and qp_s(1) and qp_s(2);
	AND01: myAND port map(qp_s(0), qp_s(1), qp0andqp1);
	AND02: myAND port map(qp0andqp1, qp_s(2), j_s(3));
	--k_s(3) <= qp_s(0) or qp_s(1) or qp_s(2);
	OR01: myOR port map(qp_s(0), qp_s(1), k3_zwi);
	OR02: myOR port map(k3_zwi, qp_s(2), k_s(3));
	
	--j_s(2) <= qp_s(0) and qp_s(1) and qn_s(3);
	AND03: myAND port map(qp0andqp1, qn_s(3), j_s(2));
	--k_s(2) <= qp_s(3) or (qp_s(0) and qp_s(1));
	OR03: myOR port map(qp0andqp1, qp_s(3), k_s(2));
	--j_s(1) <= qp_s(0) and qn_s(3);
	AND04: myAND port map(qp_s(0), qn_s(3), j_s(1));
	--k_s(1) <= qp_s(0) or qp_s(3);
	OR04:myOR port map(qp_s(0), qp_s(3), k_s(1));
	
	--j_s(0) <= qn_s(3) or (qn_s(1) and qn_s(2));
	AND05: myAND port map(qn_s(1), qn_s(2), j0_zwi);
	OR05: myOR port map(j0_zwi, qn_s(3), j_s(0));
	k_s(0) <= numerounoundnichnumerodos;
	
	Qp <= qp_s;
end beehive;
