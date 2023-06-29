library ieee;
use ieee.std_logic_1164.all;

entity BCD_6_Counter is
	port( reset, clk, sen : in std_logic;
			sval				 :	in std_logic_vector(3 downto 0);
			Qp      : out std_logic_vector(2 downto 0));
end BCD_6_Counter;

architecture beehive of BCD_6_Counter is
component async_JK_FF is 
	port(	J, K, CLK, CLR	: in std_logic;
			Qp, Qn			: out std_logic);
end component;

signal j_s, k_s : std_logic_vector(2 downto 0);
constant numerounoundnichnumerodos : std_logic := '1';
signal qp_s: std_logic_vector(2 downto 0); -- mögliche fehlerquelle 
signal qn_s : std_logic_vector(2 downto 0);
signal clk_s : std_logic := '0';
begin
	clk_s <= clk or sen;
	FlipFlop0: async_JK_FF port map(j_s(0), k_s(0), clk_s, reset, qp_s(0), qn_s(0));
	FlipFlop1: async_JK_FF port map(j_s(1), k_s(1), clk_s, reset, qp_s(1), qn_s(1));
	FlipFlop2: async_JK_FF port map(j_s(2), k_s(2), clk_s, reset, qp_s(2), qn_s(2));
	
	process(sen, qp_s, qn_s, sval)
	begin
		if (sen = '0') then
			j_s(2) <= qp_s(0) and qp_s(1);
			k_s(2) <= qp_s(0) or qp_s(1);
			
			j_s(1) <= qp_s(0) and qn_s(2);
			k_s(1) <= qp_s(0) or qp_s(2);
			
			j_s(0) <= qp_s(1) nand qp_s(2);
			k_s(0) <= numerounoundnichnumerodos;
		else
			j_s(2) <= sen and sval(2);
         k_s(2) <= sen and not sval(2);
		   
		   j_s(1) <= sen and sval(1);
		   k_s(1) <= sen and not sval(1);
		   
		   j_s(0) <= sen and sval(0);
		   k_s(0) <= sen and not sval(0);
		end if;
		Qp <= qp_s;
	end process;
	
end beehive;