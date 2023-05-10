library ieee;
use ieee.std_logic_1164.all;

-- CEN == 1 -> enable
entity async_MS_D_FF is
	Port(	D, CLK, CEN, CLR	: in std_logic;
			Qp, Qn				: out std_logic);
end async_MS_D_FF;

architecture behavior of async_MS_D_FF Is

	signal gated_clk, z: std_logic := '0';
	
begin
	gated_clk <= CLK and CEN;
	
	process(CLR, gated_clk, CEN)
	begin
		if (CLR='1') then
			z <= '0';
			Qp <= '0';
			Qn <= '1';
		elsif (rising_edge(gated_clk)) then
			z <= D;
		elsif (falling_edge(gated_clk)) then
			Qp <= z;
			Qn <= not z;
		end if;
		
	end process;
end behavior;
