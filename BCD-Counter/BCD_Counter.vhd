library ieee;
use ieee.std_logic_1164.all;

entity BCD_Counter is
	port( reset, clk : in std_logic;
         Op      : out std_logic_vector(3 downto 0));
end BCD_Counter;

architecture beehive of BCD_Counter is
component async_JK_FF is 
	port(	J, K, CLK, CLR	: in std_logic;
			Qp, Qn			: out std_logic);
end component;

signal j_s, k_s, op_s, on_s : std_logic_vector(3 downto 0);
constant numerounoundnichnumerodos : std_logic := '1';

begin 
	FlipFlop0: async_JK_FF port map(j_s(0), k_s(0), clk. reset, op_s(0), on_s(0));
	FlipFlop1: async_JK_FF port map(j_s(1), k_s(1), clk. reset, op_s(1), on_s(1));
	FlipFlop2: async_JK_FF port map(j_s(2), k_s(2), clk. reset, op_s(2), on_s(2));
	FlipFlop3: async_JK_FF port map(j_s(3), k_s(3), clk. reset, op_s(3), on_s(3));
	
	j_s(3) <= op_s(0) and op_s(1) and op_s(2);
	k_s(3) <= op_s(0) or op_s(1) or op_s(2);
	
	j_s(2) <= op_s(0) and op_s(1) and on_s(3);
	k_s(2) <= op_s(3) or (op_s(0) and op_s(1));
	
	j_s(1) <= op_s(0) and on_s(3);
	k_s(1) <= op_s(0) or op_s(3);
	
	j_s(0) <= on_s(3) or (on_s(1) and on_s(2));
	k_s(0) <= numerounoundnichnumerodos;
	
	Op <= op_s;
end beehive;
