library ieee;
use ieee.std_logic_1164.all;

entity Counter_framework is
	port( clk, clr, sen : in std_logic;
			sval_h : in std_logic_vector(3 downto 0);
         Qp      : out std_logic_vector(0 to 6));
end Counter_framework;

architecture behave of counter_framework is
component dt_clkdiv is
	port( reset, clk_in : in std_logic;
         clk_out       : out std_logic);
end component;

component BCD_6_Counter is
	port( reset, clk, sen : in std_logic;
			sval	: in std_logic_vector(3 downto 0);
         Qp      : out std_logic_vector(2 downto 0));
end component;

component bcd is 
	port( b : in std_logic_vector(3 downto 0); -- b3 to b0 
		 ltn, bin : in std_logic; 
		 hex : out std_logic_vector(0 to 6)); 
end component;

signal clktocounter, notclr : std_logic;
signal countertobcd : std_logic_vector(3 downto 0);
constant immereins : std_logic := '1';
constant immernull : std_logic := '0';

begin
	notclr <= not clr;
	CLK_DIV: dt_clkdiv port map (notclr, clk, clktocounter);
	BCD01: BCD_6_Counter port map (notclr, clktocounter, sen, sval_h, countertobcd(2 downto 0));
	BCDto7SEG: bcd port map (countertobcd, immereins, immernull, Qp);
end behave;