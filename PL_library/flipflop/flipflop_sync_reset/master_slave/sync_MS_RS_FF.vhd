library ieee;
use ieee.std_logic_1164.all;

-- CEN == 1 -> enable
entity sync_MS_RS_FF is
	port(	R, S, CLK, CEN, CLR : in std_logic;
			Qp, Qn				  : out std_logic);
end sync_MS_RS_FF;

architecture behavior of sync_MS_RS_FF is

	signal gated_clk, z: std_logic := '0';

begin
	gated_clk <= CLK and CEN;

	process(CLR, gated_clk)
	begin
		if (rising_edge(gated_clk)) then
			if (CLR='1') then
				z <= '0';
			else
				if (R = '0' and S = '0')  then z <= z;
				elsif (R ='0' and S ='1') then z <= '1';
				elsIf (R ='1' and S ='0') then z <= '0';
				else  z <= 'U';
				end if;
			end if;
		elsif (falling_edge(gated_clk)) then
			Qp <= z;
			Qn <= not z;
		end if;
	end process;

end behavior;
