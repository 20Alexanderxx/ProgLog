library ieee;
use ieee.std_logic_1164.all;

entity async_D_FF is
	port(	D, CLK, CLR	: in std_logic;
			Qp, Qn		: out std_logic);
end async_D_FF;

architecture behavior of async_D_FF is
	signal z: std_logic := '0';
begin

	process(CLR, CLK)
	begin
		if (CLR='1') then
			z <= '0';
		elsif (rising_edge(clk)) then
			z <= D;
		end if;
	end process;
	
Qp <= z;
Qn <= NOT z;
	
end behavior;
