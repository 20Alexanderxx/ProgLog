

library ieee;
use ieee.std_logic_1164.all;

entity sync_D_FF is
	port(	D, CLK, CLR	: in std_logic;
			Qp, Qn		: out std_logic);
end sync_D_FF;

architecture behavior of sync_D_FF is
	signal z: std_logic := '0';
begin

	process(CLR, CLK)
	begin
		if (rising_edge(clk)) then
			if (CLR='1') then
				z <= '0';
			else
				z <= D;
			end if;
		end if;
	end process;
	
	Qp <= z;
	Qn <= not z;

end behavior;
