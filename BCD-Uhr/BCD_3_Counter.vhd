library ieee;
use ieee.std_logic_1164.all;

entity BCD_3_Counter is
	port( reset, clk, sen : in std_logic;
			sval				 :	in std_logic_vector(3 downto 0);
			Qp      : out std_logic_vector(1 downto 0));
end BCD_3_Counter;
	
architecture behave of BCD_3_Counter is
component async_JK_FF is 
	port(	J, K, CLK, CLR	: in std_logic;
			Qp, Qn			: out std_logic);
end component;

signal j_s, k_s : std_logic_vector(1 downto 0);
constant numerounoundnichnumerodos : std_logic := '1';
signal qp_s: std_logic_vector(1 downto 0) := "00";
signal qn_s : std_logic_vector(1 downto 0) := "11";

begin
	FlipFlop0: async_JK_FF port map(j_s(0), k_s(0), clk, reset, qp_s(0), qn_s(0));
	FlipFlop1: async_JK_FF port map(j_s(1), k_s(1), clk, reset, qp_s(1), qn_s(1));
	
	process(sen, qp_s, qn_s, sval, clk)
	begin
		if (sen = '0') then
			j_s(0) <= qn_s(1);
			k_s(0) <= numerounoundnichnumerodos;
			
			j_s(1) <= qp_s(0);
			k_s(1) <= numerounoundnichnumerodos;
		else
		   j_s(1) <= sen and sval(1);
		   k_s(1) <= sen and not sval(1);
		   
		   j_s(0) <= sen and sval(0);
		   k_s(0) <= sen and not sval(0);
		end if;
		Qp <= qp_s;	
	end process;
end behave;