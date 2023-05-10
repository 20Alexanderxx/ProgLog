library ieee;
use ieee.std_logic_1164.all;

-- CEN == 1 -> enabl
entity sync_MS_JK_FF is
	port(	J, K, CLK, CEN, CLR : in std_logic;
			Qp, Qn			     : out std_logic);
end sync_MS_JK_FF;

architecture behavior of sync_MS_JK_FF is

	signal gated_clk, z: std_logic := '0';

begin
	gated_clk <= CLK and CEN;

	process(CLR, gated_clk)
	begin
		if (rising_edge(gated_clk)) then
			if (CLR='1') then
				z <= '0';
			else
				if (J='0' and K='0') then z <= z;
				elsif (J='0' and K='1') then z <= '0';
				elsif (J='1' and K='0') then z <= '1';
				elsif (J='1' and K='1') then z <= not (z);
				else z <= z;
				end if;
			end if;
		elsif (falling_edge(gated_clk)) then
			Qp <= z;
			Qn <= not z;
		end if;
	end process;
	
end behavior;
