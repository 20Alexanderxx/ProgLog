library ieee;
use ieee.std_logic_1164.all;

entity BCD_Counter_D is
	port( reset, clk : in std_logic;
         Qp      : out std_logic_vector(3 downto 0));
end BCD_Counter_D;

architecture beehive of BCD_Counter_D is
component async_D_FF is 
	port(	D, CLK, CLR	: in std_logic;
			Qp, Qn			: out std_logic);
end component;

signal d_s : std_logic_vector(3 downto 0);
signal qp_s: std_logic_vector(3 downto 0) := "0000";
signal qn_s : std_logic_vector(3 downto 0) := "1111";
begin 
	FlipFlop0: async_D_FF port map(d_s(0), clk, reset, qp_s(0), qn_s(0));
	FlipFlop1: async_D_FF port map(d_s(1), clk, reset, qp_s(1), qn_s(1));
	FlipFlop2: async_D_FF port map(d_s(2), clk, reset, qp_s(2), qn_s(2));
	FlipFlop3: async_D_FF port map(d_s(3), clk, reset, qp_s(3), qn_s(3));
	
	d_s(3) <= (qp_s(3) and qn_s(2) and qn_s(1) and qn_s(0)) or (qn_s(3) and qp_s(2) and qp_s(1) and qp_s(0));
	
	d_s(2) <= ((qn_s(1) and qp_s(2)) or ((qp_s(0) xor qp_s(2)) and qp_s(1))) and qn_s(3);
	
	d_s(1) <= (qp_s(0) xor qp_s(1)) and qn_s(3);	
	
	d_s(0) <= qn_s(0) and (qn_s(3) or (qp_s(3) and qn_s(2) and qn_s(1)));
	
	
	Qp <= qp_s;
end beehive;