library ieee;
use ieee.std_logic_1164.all;

entity NBit_Register is
	generic (n: Integer := 8);
	port(D  			        : in std_logic_vector(n-1 downto 0);
		  LD, CLK, CLR : in std_logic;
		  Q 			        : out std_logic_vector(n-1 downto 0));
end NBit_Register;

architecture behavior of NBit_Register is
	component async_MS_D_FF is
		port (D, CLK, CEN, CLR : in std_logic;
			   Qp, Qn	        : out std_logic);
	end component;

	signal s_Di, s_Qp, s_Qn	: std_logic_vector(n-1 downto 0);
	constant s_CEN : std_logic := '1';
	
begin

	myRegister:
	for i in 0 to (n-1) generate
		REG: async_MS_D_FF port map (s_Di(i), CLK, s_CEN, CLR, s_Qp(i), s_Qn(i));
	end generate myRegister;

	process(CLK, s_Qp, LD, D)
	begin
		for i in (n-1) downto 0 loop
			s_Di(i) <= (s_Qp(i) And (Not LD)) Or (D(i) And LD);	-- in Aufgabensammlung steht fälschlicherweise (not Q0)
			Q(i) <= s_Qp(i);
		end loop;
	end process;

end behavior;
