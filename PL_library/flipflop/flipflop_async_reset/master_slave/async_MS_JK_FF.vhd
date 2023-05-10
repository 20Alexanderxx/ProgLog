library ieee;
use ieee.std_logic_1164.all;

-- CEN == 1 -> enable
entity async_MS_JK_FF is
	port(	J, K, CLK, CEN, CLR : in std_logic;
			Qp, Qn			     : out std_logic);
end async_MS_JK_FF;

architecture behavior of async_MS_JK_FF is

	signal gated_clk, z: std_logic := '0';
	
begin
	gated_clk <= CLK and CEN;
	
	process(CLR, gated_clk)
	begin
		if (CLR='1') then
			z <= '0';
			Qp <= '0';
			Qn <= '1';
		elsif (rising_edge(gated_clk)) then
			if (J='0' and K='0') then z <= z;
			elsif (J='0' and K='1') then z <= '0';
			elsif (J='1' and K='0') then z <= '1';
			elsif (J='1' and K='1') then z <= not (z);
			else z <= z;
			end if;
		elsif (falling_edge(gated_clk)) then
			Qp <= z;
			Qn <= not z;
		end If;
	end process;

end behavior;
