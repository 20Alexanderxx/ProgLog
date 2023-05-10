library ieee;
use ieee.std_logic_1164.all;

entity async_JK_FF is
	port(	J, K, CLK, CLR	: in std_logic;
			Qp, Qn			: out std_logic);
end async_JK_FF;

architecture behavior Of async_JK_FF Is
	signal z: std_logic := '0';
	signal JK: std_logic_vector (1 downto 0) := "00";
begin
	JK <= J & K;

	process(CLR, CLK)
	begin
		if (CLR='1') then
			z <= '0';
		elsif (rising_edge(CLK)) then
			case (JK) is
				when "00" => z <= z;
				when "01" => z <= '0';
				when "10" => z <= '1';
				when others => z <= not z;
			end case;
		end if;
	end process;

	Qp <= z;
	Qn <= not z;
	
end behavior;
