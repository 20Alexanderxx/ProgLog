library ieee;
use ieee.std_logic_1164.all;

entity BCD_60_Counter is
	port( reset, clk, sen : in std_logic;
			sval_h, sval_l				 :	in std_logic_vector(3 downto 0);
			Qp      : out std_logic_vector(6 downto 0));
end BCD_60_Counter;

architecture beehive of BCD_60_Counter is
component BCD_10_Counter is
	port( reset, clk, sen : in std_logic;
			sval	: in std_logic_vector(3 downto 0);
         Qp      : out std_logic_vector(3 downto 0));
end component;

component BCD_6_Counter is
	port( reset, clk, sen : in std_logic;
			sval	: in std_logic_vector(3 downto 0);
         Qp      : out std_logic_vector(2 downto 0));
end component;

component async_D_FF is
	port(	D, CLK, CLR	: in std_logic;
			Qp, Qn		: out std_logic);
end component;

-- ====================
signal qp_out : std_logic_vector(6 downto 0);
signal check, clk_q, qn : std_logic;
constant zerrro : std_logic := '0';

begin 
	CNT10: BCD_10_Counter port map(reset, clk, sen, sval_l, qp_out(3 downto 0));
	DFF : async_D_FF port map(check, clk, zerrro, clk_q, qn);
	CNT6: BCD_6_Counter port map(reset, clk_q, sen, sval_h, qp_out(6 downto 4));
	process (qp_out)
	begin
		if (qp_out(3 downto 0) = "1001") then
			check <= '1';
		else
			check <= '0';
		end if;
	end process;
end beehive;
