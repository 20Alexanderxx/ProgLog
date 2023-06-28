library ieee;
use ieee.std_logic_1164.all;

entity Counter_framework is
	port( clk, clr 		  : in std_logic;
         QpJK, QpJKs, QpD : out std_logic_vector(0 to 6));
end Counter_framework;

architecture behave of Counter_framework is
component dt_clkdiv is
	port( reset, clk_in : in std_logic;
         clk_out       : out std_logic);
end component;

component BCD_Counter is
	port( reset, clk : in std_logic;
         Qp      : out std_logic_vector(3 downto 0));
end component;

component BCD_Counter_struk is
	port( reset, clk : in std_logic;
         Qp      : out std_logic_vector(3 downto 0));
end component;

component BCD_Counter_D is
	port( reset, clk : in std_logic;
         Qp      : out std_logic_vector(3 downto 0));
end component;

component bcd is 
	port( b : in std_logic_vector(3 downto 0); -- b3 to b0 
		 ltn, bin : in std_logic; 
		 hex : out std_logic_vector(0 to 6)); 
end component;

signal clktocounter, notclr : std_logic;
signal countertobcdJK, countertobcdJKs, countertobcdD : std_logic_vector(3 downto 0);
constant immereins : std_logic := '1';
constant immernull : std_logic := '0';

begin
	notclr <= not clr;
	CLK_DIV: dt_clkdiv port map (notclr, clk, clktocounter);
	BCD01: BCD_Counter port map (notclr, clktocounter, countertobcdJK);
	BCD02: BCD_Counter_struk port map (notclr, clktocounter, countertobcdJKs);
	BCD03: BCD_Counter_D port map (notclr, clktocounter, countertobcdD);
	BCDto7SEG01: bcd port map (countertobcdJK, immereins, immernull, QpJK);
	BCDto7SEG02: bcd port map (countertobcdJKs, immereins, immernull, QpJKs);
	BCDto7SEG03: bcd port map (countertobcdD, immereins, immernull, QpD);
end behave;