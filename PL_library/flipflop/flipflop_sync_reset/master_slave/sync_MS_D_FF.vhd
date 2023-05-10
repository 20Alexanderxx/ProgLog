library ieee;
use ieee.std_logic_1164.all;

-- CEN == 1 -> enable
entity sync_MS_D_FF is
	port(	d, clk, cen, clr : in std_logic;
			Qp, Qn		     : out std_logic);
end sync_MS_D_FF;

architecture behavior of sync_MS_D_FF is

	signal gated_clk, z: std_logic := '0';

begin
	gated_clk <= clk and cen;

	process(clr, gated_clk)
	begin
		if (rising_edge(gated_clk)) then
			if (clr = '1') then
				z <= '0';
			else
				z <= d;
			end if;
		elsif (falling_edge(gated_clk)) then
			Qp <= z;
			Qn <= NOT z;
		end If;
		
	end process;
end behavior;
