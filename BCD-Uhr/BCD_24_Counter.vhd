library ieee;
use ieee.std_logic_1164.all;

entity BCD_24_Counter is
	port( reset, clk, sen : in std_logic;
			sval_h, sval_l				 :	in std_logic_vector(3 downto 0);
			Qp      : out std_logic_vector(5 downto 0));
end BCD_24_Counter;

architecture beehive of BCD_24_Counter is
component BCD_10_Counter is
	port( reset, clk, sen : in std_logic;
			sval	: in std_logic_vector(3 downto 0);
         Qp      : out std_logic_vector(3 downto 0));
end component;

component BCD_3_Counter is
	port( reset, clk, sen : in std_logic;
			sval	: in std_logic_vector(3 downto 0);
         Qp      : out std_logic_vector(1 downto 0));
end component;

component async_D_FF is
	port(	D, CLK, CLR	: in std_logic;
			Qp, Qn		: out std_logic);
end component;

-- ====================
signal check, clk_q, qn : std_logic;
constant zerrro : std_logic := '0';
signal clr_in, clr_out : std_logic;
signal qp_out : std_logic_vector(5 downto 0);
begin 
	clr_out <= clr_in or reset;
	CNT10: BCD_10_Counter port map(clr_out, clk, sen, sval_l, qp_out(3 downto 0));
	DFF : async_D_FF port map(check, clk, zerrro, clk_q, qn);
	CNT6: BCD_3_Counter port map(clr_out, clk_q, sen, sval_h, qp_out(5 downto 4));
	process (qp_out)
	begin
		if (qp_out(3 downto 0) = "1001") then
			check <= '1';
		else
			check <= '0';
		end if;
		if (qp_out = "100100") then
			clr_in <= '1';
		else
			clr_in <= '0';
		end if;
		qp <= qp_out;
	end process;
end beehive;
