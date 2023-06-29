library ieee;
use ieee.std_logic_1164.all;

entity Counter_framework is
	port( clk, clr, cen : in std_logic;
			sen	  : in std_logic_vector(2 downto 0);
			sval_h, sval_l  : in std_logic_vector(3 downto 0);
         QpSekE, QpSekZ, QpMinE, QpMinZ, QpHE, QpHZ : out std_logic_vector(0 to 6));
end Counter_framework;

architecture behave of counter_framework is
component dt_clkdiv is
	port( reset, clk_in : in std_logic;
         clk_out       : out std_logic);
end component;

component BCD_60_Counter is
	port( reset, clk, sen : in std_logic;
			sval_h, sval_l	: in std_logic_vector(3 downto 0);
         Qp      : out std_logic_vector(6 downto 0));
end component;

component BCD_24_Counter is
	port( reset, clk, sen : in std_logic;
			sval_h, sval_l	: in std_logic_vector(3 downto 0);
         Qp      : out std_logic_vector(5 downto 0));
end component;

component bcd is 
	port( b : in std_logic_vector(3 downto 0); -- b3 to b0 
		 ltn, bin : in std_logic; 
		 hex : out std_logic_vector(0 to 6)); 
end component;

component Debounce is
	Port (
		CLK : in STD_LOGIC;
		x : in STD_LOGIC;
		DBx : out STD_LOGIC
	);	
end component;

signal clksek : std_logic := '0';
signal clkmin : std_logic := '0';
signal clkh   : std_logic := '0';

signal notclr : std_logic := '0';
signal gated_clk : std_logic := '0';

signal sek_res, min_res : std_logic_vector(6 downto 0);
signal h_res : std_logic_vector(5 downto 0);

signal sekZto7Seg, minZto7Seg, hZto7Seg : std_logic_vector(3 downto 0);

constant immereins : std_logic := '1';
constant immernull : std_logic := '0';
constant zerrros : std_logic_vector(1 downto 0) := "00";

signal LCD0, LCD1, LCD2, LCD3, LCD4, LCD5 : std_logic_vector(6 downto 0);

signal sen0 : std_logic := '0';
signal sen1 : std_logic := '0';
signal sen2 : std_logic := '0';

begin
	notclr <= not clr;
	Debo0: Debounce port map (clk, not sen(0), sen0);
	Debo1: Debounce port map (clk, not sen(1), sen1);
	Debo2: Debounce port map (clk, not sen(2), sen2);
	
	gated_clk <= clk and cen;
	CLK_DIV: dt_clkdiv port map (notclr, gated_clk, clksek);
	
	BCDSekunde: BCD_60_Counter port map (notclr, clksek, sen0, sval_h, sval_l, sek_res);
	
	process(clksek)
	begin
		if rising_edge(clksek) then
			clkmin <= sek_res(0) and (not sek_res(1)) and (not sek_res(2)) and sek_res(3) and 
						 sek_res(4) and (not sek_res(5)) and sek_res(6);
		end if;
	end process;	
	
	BCDMinute: BCD_60_Counter port map (notclr, clkmin, sen1, sval_h, sval_l, min_res);
	
	process(clkmin)
	begin
		if rising_edge(clksek) then
			clkh <= min_res(0) and (not min_res(1)) and (not min_res(2)) and min_res(3) and 
						 min_res(4) and (not min_res(5)) and min_res(6);
		end if;
	end process;
	
	BCDStunde: BCD_24_Counter port map (notclr, clkh, sen2, sval_h, sval_l, h_res);
	
	BCDSekEto7SEG: bcd port map (sek_res(3 downto 0), immereins, immernull, LCD0);
	sekZto7Seg <= immernull & sek_res(6 downto 4);
	BCDSekZto7SEG: bcd port map (sekZto7Seg, immereins, immernull, LCD1);
	
	BCDMinEto7SEG: bcd port map (min_res(3 downto 0), immereins, immernull, LCD2);
	minZto7Seg <= immernull & min_res(6 downto 4);
	BCDMinZto7SEG: bcd port map (minZto7Seg, immereins, immernull, LCD3);
	
	BCDHEto7SEG: bcd port map (h_res(3 downto 0), immereins, immernull, LCD4);
	hZto7Seg <= zerrros & h_res(5 downto 4);
	BCDHZto7SEG: bcd port map (hZto7Seg, immereins, immernull, LCD5);
	
	QpSekE <= LCD0;
	QpSekZ <= LCD1;
	QpMinE <= LCD2;
	QpMinZ <= LCD3;
	QpHE	 <= LCD4;
	QpHZ	 <= LCD5;

end behave;