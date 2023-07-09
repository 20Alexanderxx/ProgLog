library ieee;
use ieee.std_logic_1164.all;

entity tb_template is
end tb_template;

architecture behave of tb_template is
component counter_framework is
port( clk, clr, cen : in std_logic;
			sen	  : in std_logic_vector(2 downto 0);
			sval_h, sval_l  : in std_logic_vector(3 downto 0);
         QpSekE, QpSekZ, QpMinE, QpMinZ, QpHE, QpHZ : out std_logic_vector(0 to 6));
end component;

signal s_CLK : std_logic := '1';
signal s_CLR, s_CEN : std_logic;
signal s_SEN : std_logic_vector(2 downto 0);
signal s_SVAL_L, s_SVAL_H : std_logic_vector(3 downto 0);

signal s_LCD0, s_LCD1, s_LCD2, s_LCD3, s_LCD4, s_LCD5 : std_logic_vector(6 downto 0);

begin
	dut: counter_framework port map (s_CLK, s_CLR, s_CEN, s_SEN, s_SVAL_H, s_SVAL_L, s_LCD0, s_LCD1, s_LCD2, s_LCD3, s_LCD4, s_LCD5);
	process
	begin
		s_CLK <= NOT s_CLK;
		wait for 5 ns;
	end process;
	
	process
	begin
		s_CEN <= '0';
		s_SEN <= "000";
		s_SVAL_L <= "0000";
		s_SVAL_H <= "0000";
		
		s_CLR <= '1';
		wait for 12 ns;
		s_CLR <= '0';
		wait for 100 ns;
		s_CLR <= '1';
		wait for 500 ns;
		s_CEN <= '0';
		wait for 300 ns;
		s_CEN <= '1';
		wait for 100 ns;
		s_SEN <= "001";
		s_SVAL_L <= "0010";
		s_SVAL_H <= "0001";
		wait for 300 ns;
		s_SEN <= "000";
		wait for 1500 ns;
		s_CLR <= '0';
		wait;
	end process;
end behave;
		